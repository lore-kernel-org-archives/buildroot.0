Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF87C0218D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 16:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F8D6110E;
	Tue, 21 Jan 2025 16:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0aDo-RXS4na; Tue, 21 Jan 2025 16:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31B161113
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31B161113;
	Tue, 21 Jan 2025 16:16:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E44A69
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 16:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6930683FC4
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 16:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPPUxem00lqu for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 16:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1D1B84F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D1B84F69
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1D1B84F69
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 16:16:42 +0000 (UTC)
X-CSE-ConnectionGUID: BQleFKJfT16nAP2rJ1o+8Q==
X-CSE-MsgGUID: C5ACWeS2Rw6J0viBLsZ3Dw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 17:16:40 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jan 2025 17:16:39 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 21 Jan 2025 17:16:38 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Jan 2025 17:16:37 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: rpWIFB5GQNi2jB7ZLBZLhw==
X-CSE-MsgGUID: sunDQyEQTESqA4ua1EWnDA==
X-IronPort-AV: E=Sophos;i="6.13,222,1732575600"; d="scan'208";a="241820434"
Date: Tue, 21 Jan 2025 17:16:37 +0100
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z4/IZbYmCGQLMG4m@yd-6wlzhs3>
References: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
 <20250121165545.0acdc63a@booty>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121165545.0acdc63a@booty>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX302.corporate.adroot.infra.ftgroup
 (10.115.26.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737476204; x=1769012204;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=IkX3OfmdnpQdudf1XZQEcVNpPOCJTOuBxLAhob9jN1M=;
 b=J5HaDORFPw1CGJThOYstxQTnQ4MkB0bRCK7XnOfQT1peYMrqgzgzEs38
 6KktknJv7QA2UZ56AwaxHrmWm1YM4fwJxXopSCpd1/EEtBkc7pziBqrf3
 w26/IH0N3aVTgE67tvLRw+tHNOBxtJX/URU2PeqPmvpV2vhxrGwgL1qgc
 cqPZ1DIqXN0jLXD+mPDG7ipjt2JzSRbmJ3iZvL1w9sR+K8OC4QFl8zGAL
 7DPob/855hTSTsMRDjDuNo5rDffZX0QQKiB0+Wf9dJVfFOTWKQ+X/C/Vq
 4v6VO/M9/nBcFIZh4lR/NzPTu2GaUOKOUubjO2GFqcvwdQSwOECtiO9Q6
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=J5HaDORF
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

Luca, Al,

On 2025-01-21 16:55 +0100, Luca Ceresoli spake thusly:
> On Tue, 21 Jan 2025 11:45:32 +0100
> <yann.morin@orange.com> wrote:
[--SNIP--]
> > Change the legal manifest to include the actual, original value as
> > was set in the .mk file.
 [--SNIP--]
> Subject line: reall -> real.

:-)

> It would be nice to shot an actual example in the commit message. I did
> a very quick search and couldn't find any package where the problem
> happens.

There is no package in the Buildroot tree that is affected, when the
version string is a constant. There are a few packages (linux, uboot...)
where the user can specify a custom version from a custom git tree, and
those could contain a colon or a slash, even a space (but let's be
honest, that space would break so many other things everywhere!).

Also, packages from br2-external trees may have versions with any such
character. For example, I'm looking at Apache ant, where the tags are
something like "rel/1.10.15" for example:
    https://github.com/apache/ant/tags

Finally, private packages (used from a br2-external tree) may have such
tags as well..

[--SNIP--]
> > -	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
> > +	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_DL_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
> >  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> >  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
> Not strictly specific about your patch, but IMO reusing the _DL_VERSION
> variable makes code less readable. The _DL_VERSION name suggests it is
> for downloading, right? What about renaming it to e.g. _ORIG_VERSION,
> and then using _ORIG_VERSION for both the download, the legal manifest,
> pkg-stats and whatever use is currently made of _DL_VERSION?

Vast subject. I'm not going to revisit that; my non-work alter-ego
previously tried, and that was not easy *at all*; talk to the people
who were in Vienna if you want a bit of details (one point is that
some packages may already make use of _DL_VERSION, especially in
br2-external trees, so we want to keep that as well, but I can't
remember the key problem I stumbled uppon, just that I went "Ouch,
burnt! No touching!").

> Other than that looks good, and I'm not strict about the _DL_VERSION so:
> 
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks! :-)

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
