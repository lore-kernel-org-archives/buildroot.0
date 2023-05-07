Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC9CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1365F408CF;
	Sun,  7 May 2023 21:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1365F408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BX6D0NFby3E1; Sun,  7 May 2023 21:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D7540145;
	Sun,  7 May 2023 21:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D7540145
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBD361BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B48CD613F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B48CD613F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4ryRylRyYvX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:37:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6730860F47
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6730860F47
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:37:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 966542003AE;
 Sun,  7 May 2023 23:37:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:37:18 +0200
Date: Sun, 7 May 2023 23:37:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20230507213718.GS252090@scaer>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
 <20230502154713.1490788-3-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502154713.1490788-3-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683495441;
 bh=6MHxXZCf4U3NkaGmC/O5EGJhecJuCh7gnBvRaihQVuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWnhOzSm0Krk+V9w7rQdXz6GbMnoYs/fidw806cMerr7ZHASAL+iGN09ozaJzZEYh
 F9Nwzxwt7QqYxOZrf3/4kc3YuIMYcUgd7m2RldML20Hv5MDFhJs8xJJ560bA7WttzX
 7djDD+wL4rTSxNfPXJ+UCn8SA0CrVK4YRY2U7/RQrXduaYjNTRT9EZXMrzMcxvUE0P
 sfu1ctsNbTLZXlbdjD9+7RLdaWn2AAoPV8uTR29/ODw1D9OzZxo9U4aF0TfbJ/kODk
 Mb8HWOcH2vQJZ0mJ/NNiNn9KOE9W7Vt7FkI7yz6pixrTX6LvuSbHL1q1zHF6yLn/TN
 JlRxxtt/p923g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sWnhOzSm
Subject: Re: [Buildroot] [PATCH 3/6] package/optee-client: bump to version
 3.21.0
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Etienne, All,

On 2023-05-02 17:47 +0200, Etienne Carriere spake thusly:
> Bumps OP-TEE client package version to OP-TEE release 3.21.0.
> Removes the 2 local patches that have been integrated into mainline
> repository before release tag 3.21.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  ...condition-libteeacl-with-WITH_TEEACL.patch | 105 ------------------
>  ...-use-realloc-instead-of-reallocarray.patch |  34 ------

Removed files that were ignored, must be dropped from
.checkpacakgeignore too.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  package/optee-client/optee-client.hash        |   4 +-
>  package/optee-client/optee-client.mk          |   2 +-
>  4 files changed, 3 insertions(+), 142 deletions(-)
>  delete mode 100644 package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
>  delete mode 100644 package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
> 
> diff --git a/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch b/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
> deleted file mode 100644
> index 4fdf9afc94..0000000000
> --- a/package/optee-client/0001-libteeacl-condition-libteeacl-with-WITH_TEEACL.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -From bbdf665aba39c29a3ce7bd06e4554c62a416ebaa Mon Sep 17 00:00:00 2001
> -From: Etienne Carriere <etienne.carriere@linaro.org>
> -Date: Thu, 10 Nov 2022 12:05:24 +0100
> -Subject: [PATCH] libteeacl: condition libteeacl with WITH_TEEACL
> -
> -Build and embed libteeacl upon WITH_TEEACL=1 (default configuration).
> -This configuration switch allows one to build OP-TEE client without
> -dependencies on pkg-config and libuuid  when OP-TEE ACL for
> -PKCS11 is not needed:
> - cmake -DWITH_TEEACL=0 ...
> -or
> - make WITH_TEEACL=0 ...
> -
> -With the comments below addressed, LGTM.
> -
> -Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
> -Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
> -Reviewed-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> -[etienne.carriere@linaro.org: backport upstream commit]
> -Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> -[yann.morin.1998@free.fr: actually do a backport of bbdf665]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - CMakeLists.txt |  9 ++++++---
> - Makefile       | 15 ++++++++++++---
> - 2 files changed, 18 insertions(+), 6 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 0786752..9fb5c6a 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -5,6 +5,7 @@ project (optee_client C)
> - set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)
> - 
> - set (CFG_WERROR 1 CACHE BOOL "Build with -Werror")
> -+option (WITH_TEEACL "Build libteeacl" TRUE)
> - 
> - include(GNUInstallDirs)
> - 
> -@@ -37,7 +38,9 @@ add_subdirectory (libteec)
> - add_subdirectory (tee-supplicant)
> - add_subdirectory (public)
> - add_subdirectory (libckteec)
> --find_package (PkgConfig REQUIRED)
> --pkg_check_modules(uuid REQUIRED IMPORTED_TARGET uuid)
> --add_subdirectory (libteeacl)
> -+if(WITH_TEEACL)
> -+    find_package (PkgConfig REQUIRED)
> -+    pkg_check_modules(uuid REQUIRED IMPORTED_TARGET uuid)
> -+    add_subdirectory (libteeacl)
> -+endif(WITH_TEEACL)
> - add_subdirectory (libseteec)
> -diff --git a/Makefile b/Makefile
> -index 90b487e..2ee5621 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -16,6 +16,8 @@ SBINDIR ?= /usr/sbin
> - LIBDIR ?= /usr/lib
> - INCLUDEDIR ?= /usr/include
> - 
> -+WITH_TEEACL ?= 1
> -+
> - .PHONY: all build build-libteec build-libckteec build-libseteec \
> - 	build-libteeacl check-libuuid install copy_export clean cscope \
> - 	clean-cscope \
> -@@ -35,8 +37,10 @@ build-tee-supplicant: build-libteec
> - 	@echo "Building tee-supplicant"
> - 	$(MAKE) --directory=tee-supplicant  --no-print-directory --no-builtin-variables CFG_TEE_SUPP_LOG_LEVEL=$(CFG_TEE_SUPP_LOG_LEVEL)
> - 
> --build: build-libteec build-tee-supplicant build-libckteec build-libseteec \
> --	build-libteeacl
> -+build: build-libteec build-tee-supplicant build-libckteec build-libseteec
> -+ifeq ($(WITH_TEEACL),1)
> -+build: build-libteeacl
> -+endif
> - 
> - build-libckteec: build-libteec
> - 	@echo "Building libckteec.so"
> -@@ -57,7 +61,10 @@ check-libuuid:
> - install: copy_export
> - 
> - clean: clean-libteec clean-tee-supplicant clean-cscope clean-libckteec \
> --	clean-libseteec clean-libteeacl
> -+	clean-libseteec
> -+ifeq ($(WITH_TEEACL),1)
> -+clean: clean-libteeacl
> -+endif
> - 
> - clean-libteec:
> - 	@$(MAKE) --directory=libteec --no-print-directory clean
> -@@ -158,9 +165,11 @@ copy_export: build
> - 	cp libckteec/include/*.h $(DESTDIR)$(INCLUDEDIR)
> - 	cp -d ${O}/libckteec/libckteec.so* $(DESTDIR)$(LIBDIR)
> - 	cp -d ${O}/libckteec/libckteec.a $(DESTDIR)$(LIBDIR)
> -+ifeq ($(WITH_TEEACL),1)
> - 	cp libteeacl/include/*.h $(DESTDIR)$(INCLUDEDIR)
> - 	cp -d ${O}/libteeacl/libteeacl.so* $(DESTDIR)$(LIBDIR)
> - 	cp -d ${O}/libteeacl/libteeacl.a $(DESTDIR)$(LIBDIR)
> -+endif
> - 	cp libseteec/include/*.h $(DESTDIR)$(INCLUDEDIR)
> - 	cp -d ${O}/libseteec/libseteec.so* $(DESTDIR)$(LIBDIR)
> - 	cp -d ${O}/libseteec/libseteec.a $(DESTDIR)$(LIBDIR)
> --- 
> -2.25.1
> -
> diff --git a/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch b/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
> deleted file mode 100644
> index 88f5a4f87e..0000000000
> --- a/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From dde6306458331371be5df15e3ca953697d2463ef Mon Sep 17 00:00:00 2001
> -From: Eero Aaltonen <eero.aaltonen@vaisala.com>
> -Date: Thu, 2 Feb 2023 17:22:29 +0200
> -Subject: [PATCH] libteeacl: use realloc() instead of reallocarray()
> -
> -Use realloc() instead of reallocarray(), since uClibc apparently does
> -not implement reallocarray().
> -
> -Fixes: https://github.com/OP-TEE/optee_client/issues/339
> -
> -Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> -Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
> -
> -[Retrieved from:
> -https://github.com/OP-TEE/optee_client/commit/dde6306458331371be5df15e3ca953697d2463ef]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libteeacl/src/group.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/libteeacl/src/group.c b/libteeacl/src/group.c
> -index 10965dd0..bd165a11 100644
> ---- a/libteeacl/src/group.c
> -+++ b/libteeacl/src/group.c
> -@@ -72,7 +72,8 @@ enum rv_groupmember teeacl_user_is_member_of(const char *user, gid_t group)
> - 	if (ret == -1) {
> - 		p_groups = groups;
> - 
> --		groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
> -+		/* we use realloc, since uClibc does not implement reallocarray */
> -+		groups = realloc(groups, grouplistsize * sizeof(gid_t));
> - 		if (!groups) {
> - 			free(p_groups);
> - 			return E_MEMORY;
> diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
> index c067e26f4e..69016eae11 100644
> --- a/package/optee-client/optee-client.hash
> +++ b/package/optee-client/optee-client.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/OP-TEE/optee_client/archive/3.19.0/optee-client-3.19.0.tar.gz
> -sha256  5f0d02efa0e496964e86ca9dd2461ada923d1f9e11a4b9cafb5393bd08337644  optee-client-3.19.0.tar.gz
> +# From https://github.com/OP-TEE/optee_client/archive/3.21.0/optee-client-3.21.0.tar.gz
> +sha256  368164a539b85557d2079fa6cd839ec444869109f96de65d6569e58b0615d026  optee-client-3.21.0.tar.gz
>  # Locally computed
>  sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index ef113c838f..4b95842efa 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPTEE_CLIENT_VERSION = 3.19.0
> +OPTEE_CLIENT_VERSION = 3.21.0
>  OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
>  OPTEE_CLIENT_LICENSE = BSD-2-Clause
>  OPTEE_CLIENT_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
