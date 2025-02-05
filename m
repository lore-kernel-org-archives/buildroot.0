Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCAC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DEB415DF;
	Wed,  5 Feb 2025 13:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqei9rIpPDlJ; Wed,  5 Feb 2025 13:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8354155C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8354155C;
	Wed,  5 Feb 2025 13:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34EFF12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249C282323
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTvTgwt89bJd for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3880822F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3880822F6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3880822F6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:02:46 +0000 (UTC)
X-CSE-ConnectionGUID: 9RqBe5HhS8q92pRLqV3Wcw==
X-CSE-MsgGUID: Uy7k3hq7SpOesgK70anPuw==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 14:02:44 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 14:02:44 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 14:02:42 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 14:02:41 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: IB0iaxipRkeD9aUpq58RYA==
X-CSE-MsgGUID: 616z0qg1RlWdWX4xT9FeNg==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="251571397"
Date: Wed, 5 Feb 2025 14:02:41 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6NhcW6N6p4R5oSd@yd-6wlzhs3>
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
 <20250205113531.4161633-2-fiona.klute@gmx.de>
 <Z6NTRZe6pNcyMvRn@yd-6wlzhs3>
 <51e532ed-9c27-4bbd-9ed2-58044082c4c1@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51e532ed-9c27-4bbd-9ed2-58044082c4c1@gmx.de>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738760567; x=1770296567;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=4C+TBui2r/PSmdiddwYVl+kFSFyWoQcI/a7b920lQdE=;
 b=Unc0oXszgbIxSwOaZiBOSvqKYWKZJ43fSU6RhnL7yh5RvlKg8pB+LgDV
 4cyur2k80O5ZGX1Yq5zHUV5Tx62ChdA8Idykk2idWhMX6/ETrYfdakZGL
 Tj+cVXGEKQEsxPehyRjAjDeYS0IB5vAXZhGdASieDCTb6b7V6/QLCELaG
 AEHgcxVxWxkjoI3YWUh5vyEg6Urf/mOaoePoy6V8qRnKzVP83uJdeLhLZ
 tt16UbcAqKLLtuMd3sN2mxZ3nS84Bdaw5H1+gxYiebQ4Ss+oc4zP9yUWN
 Zcp64gBNpx2cEt3YO3QN59yeBpd406ilP9wNutBITLCUPFsQQK/lYla/q
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Unc0oXsz
Subject: Re: [Buildroot] [PATCH v2 2/3] package/pkg-golang: do not force
 ld.gold on aarch64
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2025-02-05 13:14 +0100, Fiona Klute spake thusly:
[--SNIP--]
> I wouldn't expect the ld.bfd name to go away if/when Binutils drops
> ld.gold, because there still are other linkers people might want to use
> and switch between, e.g. ld.lld from LLVM. But I agree we can handle
> that if it happens,

Ah, that makes sense. Anfd that will open yet another can of worms then.

> ideally Go would stop forcing ld.gold soon enough so
> we can just drop the override. :-)

Indeed, that will probably happen before gold gets dropped.

Still, neither is already the case, so a little note in the commit log
about the current state would be nice, if at least for when we revisit
that in the future so that we can understand our lack of foresight back
in these times! ;-)

Thanks for the feedback.

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
