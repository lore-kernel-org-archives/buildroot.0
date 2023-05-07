Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDFCC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 09:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8991F41EC1;
	Sun,  7 May 2023 09:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8991F41EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-kSDSk1e3_U; Sun,  7 May 2023 09:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E0441F44;
	Sun,  7 May 2023 09:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E0441F44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00C701BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF05740CBD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF05740CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrVMU-ox8nOv for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 09:07:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97184015A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B97184015A
 for <buildroot@buildroot.org>; Sun,  7 May 2023 09:07:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CA17419F747;
 Sun,  7 May 2023 11:06:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 11:06:58 +0200
Date: Sun, 7 May 2023 11:06:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507090658.GB252090@scaer>
References: <20230503161756.741506-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503161756.741506-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683450420;
 bh=zVm2rTEvvaMgTgGnBrwVCDJ7GHyk8s+0pnNu9y0K3Oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GNDV6hB51VlLWpVO8XmwHDfWHW41rKd1dzeuKm7frI+JxXa95XEA+G5exeFQwEMrr
 RkoX/QVItaqpx/FJ3S/ZgPVMIgYA5X55UOy+F/T6U9e9ya4gcn8WY7sfC3sLZm3e0g
 VuXiEs9zCT4GDyhgh49ZDglgAcZJk4/mxU3h+D2qCP1bOtt0+rR/Y+B4naO3JZjhjB
 X8A/A6T5iZOdYkv8k+Bgsz/F4XbtUozlvv55ErSVD1sx6flyPrnRvx14xFAetl7Iq5
 bcdTZAV7Y2Rptlo76Dq9MEyk4YWSDPYDXsx4ZAuwj0/3kZUCyQiuOfUuqXd6XGENxA
 7Siim8hU9ASfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GNDV6hB5
Subject: Re: [Buildroot] [PATCH 1/2] package/heimdal: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-03 18:17 +0200, Bernd Kuhls spake thusly:
> Samba-4.16 bumped its internal heimdal code[1] which made it
> incompatible with asn1_compile built with heimdal-7.7.1:
> 
> /home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: Ignoring char(_)
> /home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: syntax error
> 
> Bump this package to the same version LibreELEC is using
> 
> https://github.com/LibreELEC/LibreELEC.tv/commit/1dc0b5bf3e50500658c8a61e89f57a98dfc0468d
> https://github.com/LibreELEC/LibreELEC.tv/commit/1112a1879523fdff7f6dec5a083d4f2bc82e7017
> https://github.com/LibreELEC/LibreELEC.tv/commit/763eddbab10f89da42a380624192cc4039eed086
> 
> to fix the build error.
> 
> Removed HOST_HEIMDAL_MAKE_SYMLINK as asn1_compile is now installed in
> $(HOST_DIR)/bin/.
> 
> [1] https://www.samba.org/samba/history/samba-4.16.0.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/heimdal/heimdal.hash |  4 +---
>  package/heimdal/heimdal.mk   | 14 ++++----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
> index cf822340da..250ddbbd4d 100644
> --- a/package/heimdal/heimdal.hash
> +++ b/package/heimdal/heimdal.hash
> @@ -1,5 +1,3 @@
> -# From https://github.com/heimdal/heimdal/releases
> -sha1  a33fdc957f84ab13f39f164b04fe1deeaab3179e  heimdal-7.7.1.tar.gz
> -sha256  117cb1ede7848db24cf27311c46f7f735a99f9c836c22e80aec92b91efe56644  heimdal-7.7.1.tar.gz
>  # Locally computed
> +sha256  2576c5e2d793db53c86e108fd117b278437bb02d6c6db2bec4d1b86958f1980a  heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17.tar.gz
>  sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
> diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
> index 21b6c0ccb3..59b64c358b 100644
> --- a/package/heimdal/heimdal.mk
> +++ b/package/heimdal/heimdal.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -HEIMDAL_VERSION = 7.7.1
> -HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
> +HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
> +HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
>  HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
> +HOST_HEIMDAL_AUTORECONF = YES
>  HEIMDAL_INSTALL_STAGING = YES
>  # static because of -fPIC issues with e2fsprogs on x86_64 host
>  HOST_HEIMDAL_CONF_OPTS = \
> @@ -39,14 +40,7 @@ define HOST_HEIMDAL_INSTALL_COMPILE_ET
>  		$(HOST_DIR)/bin/compile_et
>  endef
>  
> -# We need asn1_compile in the PATH for samba4
> -define HOST_HEIMDAL_MAKE_SYMLINK
> -	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
> -		$(HOST_DIR)/bin/asn1_compile
> -endef
> -
>  HOST_HEIMDAL_POST_INSTALL_HOOKS += \
> -	HOST_HEIMDAL_INSTALL_COMPILE_ET \
> -	HOST_HEIMDAL_MAKE_SYMLINK
> +	HOST_HEIMDAL_INSTALL_COMPILE_ET
>  
>  $(eval $(host-autotools-package))
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
