Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CCC7EE31
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 08:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6AA843F6;
	Fri, 27 Jun 2025 08:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7w80XII8Qmwu; Fri, 27 Jun 2025 08:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F9A84437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F9A84437;
	Fri, 27 Jun 2025 08:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5071D0
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C1AF843EB
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcoJPQtBIH_h for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 08:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3400843F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3400843F5
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3400843F5
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:40:59 +0000 (UTC)
X-CSE-ConnectionGUID: vv5zRrLPSky9uGUcddisRw==
X-CSE-MsgGUID: Xhr3o8VhQE+k6y2dAQ4whQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:40:56 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2025 10:40:58 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Fri, 27 Jun 2025 10:40:55 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 27 Jun 2025 10:40:55 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: //IUCF2rSgKXw5NjH1ORyA==
X-CSE-MsgGUID: 8VPKB7rhSKul8jkKPHPdog==
X-IronPort-AV: E=Sophos;i="6.16,269,1744063200"; d="scan'208";a="302845196"
Date: Fri, 27 Jun 2025 10:40:55 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Message-ID: <aF5ZF7d+WwGN5dSX@yd-6wlzhs3>
References: <20250627075855.199254-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627075855.199254-1-maxime.chevallier@bootlin.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX308.corporate.adroot.infra.ftgroup
 (10.115.27.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751013659; x=1782549659;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=jlIA1OHPXiuGLubpm6bkAxQ5NZRfAKVk7B4XAE+pPTA=;
 b=h6RRFuRLhhhEiynXUpNEKhV5VE5dwwscXwX7kzZE2bfd3Pe56AzIGctY
 7eJrW2k8GZGSxWhNMcrP10+Tbir9zjaSylJhZlIuUlFWkVi/K2jATYf+6
 uX2ndod+2Mpm9coY6o2fvj4FAiHJMZ/Gzglkvlneoqq3lrQ5JG+HH5hGh
 GQ8oQkd01rBxkkkPg3m6yR+A6EOqJeNDjXazwLgXEfsCDXVZDNBV6mQKQ
 OwGMwFH97wVDjdUBwC6WnJ2YvqzHZVy/H52U48nK83nYueObAnZ7a8Kvm
 qC1xfQFjEPEV2i/zMC2tU8kLkkB1F3QrLhc+i+YJBqjqmyJwb/d2Wgxun
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=h6RRFuRL
Subject: Re: [Buildroot] [PATCH] package/elfutils: elfutils programs now
 require a c++ toolchain
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

Maxime, All,

On 2025-06-27 09:58 +0200, Maxime Chevallier via buildroot spake thusly:
> The 0.192 release of elfutils introduced the src/srcfiles.cxx program,
> that lists all source files of a given ELF binary. As this is a C++
> program, we need a toolchain that supports it.
> 
> Without it, the build system tries to use "no" as the CXX compiler,
> resulting in the following errors :
> 
>   /bin/sh: line 1: no: command not found
> 
> as can be seen here for example :
> 
> https://autobuild.buildroot.net/results/849/849221c794a469a423857a290db775d150b84900
> 
> Add a dependency to a CPP toolchain for the elfutils programs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  package/elfutils/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> index c355048c6d..f6f5438fb0 100644
> --- a/package/elfutils/Config.in
> +++ b/package/elfutils/Config.in
> @@ -24,8 +24,12 @@ if BR2_PACKAGE_ELFUTILS
>  config BR2_PACKAGE_ELFUTILS_PROGS
>  	bool "Install programs"
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  This option tells elfutils to not only install the libelf
>  	  libraries, but also the elfutils programs.
>  
> +comment "elfutils programs needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

Two things:

1. the dependency  on glibc already required a comment, which is
    currently missing: maybe add it as a separate patch?

2. the new comment should mention both issues:

    comment "elfutils programs needs a glibc toolchain w/ C++"
            depends on !BR2_TOOLCHAIN_USES_GLIBC \
                    || !BR2_INSTALL_LIBSTDCPP

Regards,
Yann E. MORIN.

>  endif
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
