Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD80560E8C;
	Mon,  4 Apr 2022 19:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2mB0LXh4kPF; Mon,  4 Apr 2022 19:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11F460803;
	Mon,  4 Apr 2022 19:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0021BF284
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B2FC60803
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnyVGzuTAQcJ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:55:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1151605AE
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:55:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a064:3cb0:6c84:3c72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6F50B7802D1;
 Mon,  4 Apr 2022 21:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649102106;
 bh=O71LDAGlcZRBjiecRzvSrhZq2EZrf6H9I6lYCZwYPBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=godNDnBBWnRQ2/yguCHwY17k+QPmXYbMCVyY1D9Vg13tC71jo14aVQ1zv3tADiQID
 XUPoEYJFpfOQ3GwaMx+mA7eI1s0Od940O/nt+Gh/IDf6jiXVwUA3JUjkc1qMVIL5v2
 rFrk7M89zQ8xagECMgR20aDvAq8u3/6rOZl58LDGy4/xNQNsuBPrgsXGm1OsMoRcAD
 QknSc/tjh1t1mjocjuMR0d/QjAIUn6/KcvjNXxtzgvNLEwT70Ff0uyzzP7Cp7cFe++
 4el9CsQcNYppzSSe1bQRfrNxvkbWmwym513B2JM4XdEcmOghYfOpcXW382O68dquhv
 KiApq7ApdjL9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Apr 2022 21:55:03 +0200
Date: Mon, 4 Apr 2022 21:55:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220404195503.GG2354230@scaer>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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

On 2022-04-03 12:03 +0200, Fabrice Fontaine spake thusly:
> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
> 
> In file included from ../includes/dhcpd.h:91,
>                  from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
>    51 | #include <isc/boolean.h>
>       |          ^~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939

That config still does not build for me even with this patch:

    >>> dhcp 4.4.2-P1 Building
    PATH="/home/ymorin/dev/buildroot/O/host/bin:/home/ymorin/dev/buildroot/O/host/sbin:/home/ymorin/bin:/home/ymorin/bin:/opt/mutt/bin:/opt/containerd/bin:/home/ymorin/bin:/home/ymorin/bin:/opt/mutt/bin:/opt/containerd/bin:/home/ymorin/bin:/home/ymorin/bin:/opt/mutt/bin:/opt/containerd/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" /usr/bin/make -j1  -C /home/ymorin/dev/buildroot/O/build/dhcp-4.4.2-P1/
    Making all in ./bind
    Configuring BIND libraries for DHCP.
    configure: WARNING: using cross tools not prefixed with host triplet
    configure: error: include/zlib.h not found.
    make[3]: *** [Makefile:42: bind1] Error 1
    make[2]: *** [Makefile:495: all-recursive] Error 1
    make[1]: *** [package/pkg-generic.mk:292: /home/ymorin/dev/buildroot/O/build/dhcp-4.4.2-P1/.stamp_built] Error 2
    make: *** [Makefile:23: _all] Error 2

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcp/Config.in |  1 -
>  package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index 515040c612..e0706efafb 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
>  	# fork()
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	select BR2_PACKAGE_BIND
>  	help
>  	  DHCP relay agent from the ISC DHCP distribution.
>  
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 18765a3639..f1e3c22f1c 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = MPL-2.0
>  DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind host-gawk
> +DHCP_DEPENDENCIES = host-gawk
>  DHCP_CPE_ID_VENDOR = isc
> +# internal bind does not support parallel builds.
> +DHCP_MAKE = $(MAKE1)
>  
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
> @@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
>  	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>  		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>  	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
>  
>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>  
>  DHCP_CONF_OPTS = \
> -	--with-libbind=$(STAGING_DIR)/usr \
> +	--with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
>  	--with-randomdev=/dev/random \
>  	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
>  	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
> @@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
>  	--with-relay-pid-file=/var/run/dhcrelay.pid \
>  	--with-relay6-pid-file=/var/run/dhcrelay6.pid
>  
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DHCP_BIND_EXTRA_CONFIG += --with-zlib
> +DHCP_DEPENDENCIES += zlib
> +else
> +DHCP_BIND_EXTRA_CONFIG += --without-zlib
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +DHCP_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
>  DHCP_CONF_OPTS += --disable-libtool
>  else
>  DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
> -- 
> 2.35.1
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
