Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA68C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77374158F;
	Mon,  8 Jan 2024 22:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77374158F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-CQwZ826B-r; Mon,  8 Jan 2024 22:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B2941BEB;
	Mon,  8 Jan 2024 22:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B2941BEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1237B1BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6F24158F
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC6F24158F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77cWvWIZQSeB for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:19:35 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED5D14025E
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED5D14025E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 85CADB0055E;
 Mon,  8 Jan 2024 23:19:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 23:19:30 +0100
Date: Mon, 8 Jan 2024 23:19:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZx08mDAbYBN2hw8@landeda>
References: <20240107174655.910522-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107174655.910522-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704752372;
 bh=uGwJlomwcjv+LUcsOZTAwWTTpsZU3SybAJhXZUb4GXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qaLveDl/4rkY2bwZ6b+nafgTF1YUKBenftbaWsiD7ButZyNFF6GfoqstplBhQsYdx
 PijYSQc98gdNO7VMOaMdw2egHq6bCTnUdUnlENN6PWTe++prJWFrVmcpXeeaoVHlYy
 /TRMDoGc3dhDXTiD/sHSHqDIMYt5upbEzuccEHOtE9PlkBfTIqpw+v8HFcctaQloSn
 bhT2diVWtjD8Vr1mADqm7qyL99sGkXswPCl8ZqK+nY5I8aLYEy9+o5eIMRmyFcpXT1
 oMVzbrvcTLTXPZec0B9P7lN8IOzlWn1oMBManAMeNQ80JV9/Vll7KRHqguDg628EJ8
 VwwydDOvyAUmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qaLveDl/
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.15p5
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

On 2024-01-07 18:46 +0100, Fabrice Fontaine spake thusly:
> - Drop patch (already in version) and so also drop autoreconf
> - The sudoers plugin has been modified to make it more resilient to
>   ROWHAMMER attacks on authentication and policy matching. This
>   addresses CVE-2023-42465.
> 
> https://www.sudo.ws/releases/stable/#1.9.15p5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  ...onfigure.ac-fix-openssl-static-build.patch | 47 -------------------
>  package/sudo/sudo.hash                        |  2 +-
>  package/sudo/sudo.mk                          |  6 +--
>  4 files changed, 3 insertions(+), 53 deletions(-)
>  delete mode 100644 package/sudo/0001-configure.ac-fix-openssl-static-build.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 1ddd13111a..6f67b4ba61 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1273,7 +1273,6 @@ package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch Upstream
>  package/start-stop-daemon/0002-just-warn-on-missing-arch.patch Upstream
>  package/statserial/0001-ncurses-link.patch Upstream
>  package/stunnel/S50stunnel Indent Shellcheck Variables
> -package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
>  package/supervisor/S99supervisord Variables
>  package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
>  package/suricata/S99suricata Shellcheck
> diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
> deleted file mode 100644
> index dc91af6119..0000000000
> --- a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 1fed5adc166d5f2190a6b6ad048ec2d803316327 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 22 Feb 2023 10:13:30 +0100
> -Subject: [PATCH] configure.ac: fix openssl static build
> -
> -Do not use AX_APPEND_FLAG as it will break static builds by removing
> -duplicates such as -lz or -latomic which are needed by -lssl and
> --lcrypto. This will fix the following build failure with sparc which
> -needs -latomic:
> -
> -Checking for X509_STORE_CTX_get0_cert
> -configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
> -/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
> -x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'
> -
> -[...]
> -
> -In file included from ./hostcheck.c:38:
> -../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
> -  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
> -      |                                         ^~~~~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/sudo-project/sudo/commit/1fed5adc166d5f2190a6b6ad048ec2d803316327]
> ----
> - m4/openssl.m4 | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/m4/openssl.m4 b/m4/openssl.m4
> -index a2e4941ae8..b4cbd821db 100644
> ---- a/m4/openssl.m4
> -+++ b/m4/openssl.m4
> -@@ -44,7 +44,9 @@ AC_DEFUN([SUDO_CHECK_OPENSSL], [
> - 			SUDO_APPEND_LIBPATH([LIBTLS], [$f])
> - 			;;
> - 		    *)
> --			AX_APPEND_FLAG([$f], [LIBTLS])
> -+			# Do not use AX_APPEND_FLAG as it will break static builds by removing
> -+			# duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
> -+		        LIBTLS="$LIBTLS $f"
> - 			;;
> - 		esac
> - 	    done
> diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
> index 720b21d849..066d3b9de6 100644
> --- a/package/sudo/sudo.hash
> +++ b/package/sudo/sudo.hash
> @@ -1,4 +1,4 @@
>  # From: https://www.sudo.ws/getting/download/
> -sha256  92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b  sudo-1.9.13p3.tar.gz
> +sha256  558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558  sudo-1.9.15p5.tar.gz
>  # Locally calculated
>  sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 73b3503e6a..c173781304 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SUDO_VERSION_MAJOR = 1.9.13
> -SUDO_VERSION_MINOR = p3
> +SUDO_VERSION_MAJOR = 1.9.15
> +SUDO_VERSION_MINOR = p5
>  SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
>  SUDO_SITE = https://www.sudo.ws/sudo/dist
>  SUDO_LICENSE = ISC, BSD-3-Clause
> @@ -13,8 +13,6 @@ SUDO_LICENSE_FILES = LICENSE.md
>  SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
>  SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
>  SUDO_SELINUX_MODULES = sudo
> -# We're patching m4/openssl.m4
> -SUDO_AUTORECONF = YES
>  # This is to avoid sudo's make install from chown()ing files which fails
>  SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
>  SUDO_CONF_OPTS = \
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
