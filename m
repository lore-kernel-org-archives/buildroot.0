Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E241FC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 15:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E91F60A7F;
	Sun,  7 Jan 2024 15:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E91F60A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vr06RuVTLjvQ; Sun,  7 Jan 2024 15:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A218960A99;
	Sun,  7 Jan 2024 15:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A218960A99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E47FF1BF3BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C68400D0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C68400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgo_l5JQwgyu for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 15:44:40 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C768A400CF
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 15:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C768A400CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 86EA6B00548;
 Sun,  7 Jan 2024 16:44:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 16:44:34 +0100
Date: Sun, 7 Jan 2024 16:44:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZrG4pzgsBSTbgJ9@landeda>
References: <20240107141901.3834463-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107141901.3834463-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704642276;
 bh=9NCvX7+hbgEIF7cC8RHmPNRGqi7iDbzZDT8huGWbsWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5VVy8qvXSxoYp+pFBD2gQl8swnjAMOKoGYp3KI5VaDCFDXnMLjkR7tnfluKJ4XOL
 K/sQrnJyTzjAfLE8d+1F708XJ9CB0y3usJPmbPqvJQbgSLgBFuS6Thqx5OaHTjpgkD
 z5x+m/0bkHtg2hnbkS/lWXWR8Ah7KH/BCSoqVbCtNT8zj+Cwn9G50wbgefTWb3TUyH
 gW2jtMOZbSVJYgqhLQ2Niw9vwdPjEukFnbTXnpDyIH2owi1QIBi7XYOxvtvMsI8EoK
 VBXkpot5UVG+SgYaR+36XvOl6A/taFL8uSn69mUMGxmN4YKbfI28gX0BGsTTYP55tt
 W4f2S78XFH5iQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E5VVy8qv
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: fix libaio handling
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

Fabrice, All,

On 2024-01-07 15:19 +0100, Fabrice Fontaine spake thusly:
> libaio is only needed for standard install
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lvm2/Config.in | 2 +-
>  package/lvm2/lvm2.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index 577a90656a..e1df71ee2f 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_LVM2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # needs fork()
>  	depends on !BR2_STATIC_LIBS # It fails to build statically
> -	select BR2_PACKAGE_LIBAIO

    $ ./utils/docker-run make check-package
    package/lvm2/Config.in:29: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
>  	  LVM supports enterprise level volume management of disk and
> @@ -26,6 +25,7 @@ if BR2_PACKAGE_LVM2
>  
>  config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>  	bool "standard install instead of only dmsetup"
> +	select BR2_PACKAGE_LIBAIO
>  	default y
>  	help
>  	  Install the standard suite of lvm2 programs. When this option
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 9caf99eb9b..474ea30bdc 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
>  	--disable-nls \
>  	--with-symvers=no
>  
> -LVM2_DEPENDENCIES += host-pkgconf libaio
> +LVM2_DEPENDENCIES += host-pkgconf
>  
>  # LVM2 uses autoconf, but not automake, and the build system does not
>  # take into account the toolchain passed at configure time.
> @@ -49,6 +49,7 @@ LVM2_CONF_OPTS += --disable-selinux
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
> +LVM2_DEPENDENCIES += libaio
>  LVM2_INSTALL_STAGING_OPTS += install
>  LVM2_INSTALL_TARGET_OPTS += install
>  ifeq ($(BR2_INIT_SYSTEMD),y)
> -- 
> 2.43.0
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
