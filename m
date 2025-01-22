Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92428C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 06:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DCC341E0B;
	Wed, 22 Jan 2025 06:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jj5pJ9LJgn35; Wed, 22 Jan 2025 06:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDAD541E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDAD541E17;
	Wed, 22 Jan 2025 06:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 600E6C1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17B9041E1C
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IUS8JtyL5PF for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 06:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8A3941E0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A3941E0B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8A3941E0B
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 06:45:37 +0000 (UTC)
X-CSE-ConnectionGUID: 5gHWosU+QF+N5HpvTKdlsQ==
X-CSE-MsgGUID: C2aM1hsIQBCQwyifDtQE7A==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:45:35 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jan 2025 07:45:34 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 22 Jan 2025 07:45:33 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 22 Jan 2025 07:45:32 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: aCHwP/aBRduIpO0zNqh8ZQ==
X-CSE-MsgGUID: LJM7QraMRBmpNLV7HLs97w==
X-IronPort-AV: E=Sophos;i="6.13,224,1732575600"; d="scan'208";a="242118279"
Date: Wed, 22 Jan 2025 07:45:32 +0100
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z5CUDJNAXFkBy/zy@yd-6wlzhs3>
References: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
 <20250121165545.0acdc63a@booty> <Z4/IZbYmCGQLMG4m@yd-6wlzhs3>
 <20250121191044.36864ead@booty>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121191044.36864ead@booty>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737528338; x=1769064338;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=D5vv5c/InNzAJYqiqCJvh2lidIn1wgzrOTWWIhVl2sA=;
 b=KyfbGztD4yCVm6SSAwzK3AELWB5tzhiuO76XWGA8okX9rJkggEL8EVQy
 XzH+rz07wHD01xvm2/PphNchFELEx+nTHy2HptGA31nIgFntw5Yjpqrp1
 h704KTIrQ3XXUXtKR59Z6uBY+RkW+FXZT4MUkHruI4thjNTWS+ohcP/7y
 YFzjAXwY2l6nFpn0yPe5gr9eEB3tGJat6MNwxb195oVYv6HpikjeldqyT
 jB0ystZTzOHixmQKVbAFHRSZOWP+dVVPpaeCleYZnWOUlwB6BHqSRMEuw
 6lSdq0yPMSi/G/pxKFNHW5NELucMeOYP6PrRaG5O4/moNhelTvI2qacIT
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=KyfbGztD
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: store reall version in
 legal manifest
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2025-01-21 19:10 +0100, Luca Ceresoli spake thusly:
> On Tue, 21 Jan 2025 17:16:37 +0100
> yann.morin@orange.com wrote:
> > On 2025-01-21 16:55 +0100, Luca Ceresoli spake thusly:
> > > On Tue, 21 Jan 2025 11:45:32 +0100
> > > <yann.morin@orange.com> wrote:  
[--SNIP--]
> > > It would be nice to shot an actual example in the commit message. I did
> > > a very quick search and couldn't find any package where the problem
> > > happens.  
[--SNIP--]
> > Finally, private packages (used from a br2-external tree) may have such
> > tags as well..
> Sure, make sense. If it were me, I'd add an example with one of those
> packages for which one can specify the version in a configuration
> setting, like U-Boot or Linux, in case you send a v2.

Sorry, maybe I was not clear about linux and uboot: they were just given
as an example where a slash could snick in; I don't know of any publicly
accessible git repositories that has such tags for those pacakges. There
is however Apache's ant that does have such tags (although it is not
(yet) pacjaged in Buildroot).

I'll send a v2 with a rewording of my previous explanations.

Thanks!

[--SNIP--]
> > > Not strictly specific about your patch, but IMO reusing the _DL_VERSION
> > > variable makes code less readable. [--SNIP--]
> > Vast subject. [--SNIP--]

Ah, I think I remember some details now: the consensus was not about
renaming _DL_VERSION, but getting rid of it, stop mangling _VERSION and
keep it untouched, and instead introduce _VERSION_SANITISED (or
whatev'). That was causing issues of which the details still evade me
for now...

> I hereby forget about having suggest such an improvement. O:-)

No worries, that was already something that was indeed discussed because
_DL_VERSION is indeed ugly; it specifically prevents having things like
an actual version as advertised upstream (which can get tracked by
releasemonitoring.org), vs. the tag in git that often gets a 'v' prefix
(or in the Apache ant case, a whole 'rel/' prefix). Hic sunt dracones.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
