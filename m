Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B6BC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6A8822C9;
	Sun, 21 May 2023 15:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A6A8822C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZEzpHETz8W2; Sun, 21 May 2023 15:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10990822FE;
	Sun, 21 May 2023 15:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10990822FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FDEA1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2267960BA9
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2267960BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaMFlT76tjOF for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E2EE60ACA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E2EE60ACA
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:50:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0AC84B005AA;
 Sun, 21 May 2023 17:50:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:50:35 +0200
Date: Sun, 21 May 2023 17:50:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230521155035.GH171618@scaer>
References: <20230512002511.1356447-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512002511.1356447-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684684240;
 bh=n5ckWr8eVQkUlXjPe+jlDWS32xWdI45nYVRidtLJSMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3k19xX/LjnsbFEON2L5l3C4iFZzjEVW/p+kTbOAP/CIfdfwiovCt+j/En2jPDbkI
 ywNcl4Z/SaX04hScBTVfSME/tV0i1ACkLmjMIW60e2VkIRPQo4rymWYRskv7rAXLGg
 ZC+7l0c4LJqYE24RNTd9s376/trh+ZpmgwiwfjcpEu/G0WwMR/I7RKeWFBllw5uyzi
 BOR57ymstBQNnwSvL1P7g+VZemDCPV8Z+5GtovApn6xCdr+jMswGvMcOjHFUFD/TZj
 OFgZZYhCyMCj+OPsXWB52krbtRCIysdK7jkCHh/PqsHsm7rL+PKSLMLXuBCF7Zjhig
 Qv/hE8Z90A8pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S3k19xX/
Subject: Re: [Buildroot] [PATCH v2 1/2] package/conmon: new package
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-11 17:25 -0700, Christian Stewart via buildroot spake thusly:
> Conmon is an OCI container runtime monitor.
> 
> https://github.com/containers/conmon
> 
> Dependency of podman.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

You got comments from Joachin on both patches, so I marked them as
changes-requested.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> 
>  - requires libglib2, host-pkgconf
>  - bump version to 2.1.7
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/conmon/Config.in   | 15 +++++++++++++++
>  package/conmon/conmon.hash |  3 +++
>  package/conmon/conmon.mk   | 36 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 56 insertions(+)
>  create mode 100644 package/conmon/Config.in
>  create mode 100644 package/conmon/conmon.hash
>  create mode 100644 package/conmon/conmon.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 37c1f06ec1..1608317654 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -543,6 +543,7 @@ F:	package/balena-engine/
>  F:	package/batman-adv/
>  F:	package/catatonit/
>  F:	package/cni-plugins/
> +F:	package/conmon/
>  F:	package/containerd/
>  F:	package/crun/
>  F:	package/delve/
> diff --git a/package/Config.in b/package/Config.in
> index 420ebaa370..52bc10b91b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2631,6 +2631,7 @@ menu "System tools"
>  	source "package/bubblewrap/Config.in"
>  	source "package/cgroupfs-mount/Config.in"
>  	source "package/circus/Config.in"
> +	source "package/conmon/Config.in"
>  	source "package/containerd/Config.in"
>  	source "package/coreutils/Config.in"
>  	source "package/cpulimit/Config.in"
> diff --git a/package/conmon/Config.in b/package/conmon/Config.in
> new file mode 100644
> index 0000000000..c4b428a541
> --- /dev/null
> +++ b/package/conmon/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CONMON
> +	bool "conmon"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +	help
> +	  Conmon is an OCI container runtime monitor.
> +
> +	  https://github.com/containers/conmon
> +
> +comment "conmon needs a glibc or musl toolchain w/ threads, wchar"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_USE_MMU
> diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
> new file mode 100644
> index 0000000000..82d1d14ba3
> --- /dev/null
> +++ b/package/conmon/conmon.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
> +sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
> diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
> new file mode 100644
> index 0000000000..cda059042a
> --- /dev/null
> +++ b/package/conmon/conmon.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# conmon
> +#
> +################################################################################
> +
> +CONMON_VERSION = 2.1.7
> +CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
> +CONMON_LICENSE = Apache-2.0
> +CONMON_LICENSE_FILES = LICENSE
> +
> +CONMON_DEPENDENCIES += host-pkgconf libglib2
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +CONMON_ENABLE_SECCOMP = 1
> +CONMON_DEPENDENCIES += libseccomp
> +else
> +CONMON_ENABLE_SECCOMP = 0
> +endif
> +
> +define CONMON_CONFIGURE_CMDS
> +	printf '#!/bin/bash\necho "$(CONMON_ENABLE_SECCOMP)"\n' > \
> +		$(@D)/hack/seccomp-notify.sh
> +	chmod +x $(@D)/hack/seccomp-notify.sh
> +endef
> +
> +define CONMON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
> +endef
> +
> +define CONMON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/bin/conmon $(TARGET_DIR)/usr/bin/conmon
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.40.1
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
