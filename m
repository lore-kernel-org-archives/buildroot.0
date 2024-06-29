Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9739C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 563104067B;
	Sat, 29 Jun 2024 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAnA_x1qwWoO; Sat, 29 Jun 2024 21:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24494052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24494052D;
	Sat, 29 Jun 2024 21:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52C111BF3C2
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BECB4052D
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kzar-WAIB7s for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 21:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1606B40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1606B40025
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1606B40025
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 21:13:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 60BFEB00535;
 Sat, 29 Jun 2024 23:13:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 23:13:28 +0200
Message-ID: <20240629211328.812746-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719695614;
 bh=HhrsJUm5wmC2pVz00CeSIO6QhLuxyvMaaclW1CjQ7Ag=;
 h=From:To:Cc:Subject:Date:From;
 b=LnWFGhYxfNSAjsuusxJLaMhS2+o6qAXhlUfM7FcjwcvB9zL+JF44K2r4lbRsZ+gvO
 KsHJGILJF/EkiKLhjEWLbbFVInPb6fKc/kaKlFSKltBz8KtIvSsAAWzH0/efe5MKWQ
 Iwbee71E5436e0oRryOWqD35K/zPcINoiU5RNXogfzU1sK1OKpMUz6eJQPkMcUVvjc
 zP82nYTu4TWDcmexTZ1DnpivEhv7LP71RsMfCkA48Zyp5nKDywhBC6m5xnKL8Nhop2
 W7wXHPbHBNStFrzvlKTAACl/lfLJLiksR7Qslr5L21TA1vrcdAsNAIJD5h19pzSXfj
 Pq0yOyycKT/3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LnWFGhYx
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.95
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://nmap.org/changelog.html#7.95

A notable change is the switch from pcre to pcre2. This change is
reflected in Config.in and nmap.mk.

This commit also adds the sha256 hash, published at:
https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt

The package patches are also rebased on this new version. The nmap
package was failing to build since commit 8f88a644ed
"support/scripts/apply-patches.sh: set the maximum fuzz factor to 0".
The patch 0001 was regenerated with "git format-patch". This operation
renamed the patch file. This change is reflected in the
".checkpackageignore" entry.

Fixes:
http://autobuild.buildroot.org/results/417ef0b2a80e8ec5859813a9f16f773881899025

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d09597b with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p nmap
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 .checkpackageignore                           |  2 +-
 ...ibdnet-always-build-a-static-library.patch | 25 +++++++++++++++++++
 .../nmap/0001-libdnet-wrapper-configure.patch | 11 --------
 ...pto.cc-fix-build-with-libressl-3.5.0.patch | 14 ++++++-----
 package/nmap/Config.in                        |  2 +-
 package/nmap/nmap.hash                        |  5 ++--
 package/nmap/nmap.mk                          |  4 +--
 7 files changed, 40 insertions(+), 23 deletions(-)
 create mode 100644 package/nmap/0001-libdnet-always-build-a-static-library.patch
 delete mode 100644 package/nmap/0001-libdnet-wrapper-configure.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 313201b0e68..1ffe9f79c1a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1097,7 +1097,7 @@ package/nginx/0009-auto-os-linux-fix-build-with-libxcrypt.patch lib_patch.Upstre
 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch lib_patch.Upstream
 package/nginx/S50nginx lib_sysv.Indent lib_sysv.Variables
 package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch lib_patch.Upstream
-package/nmap/0001-libdnet-wrapper-configure.patch lib_patch.Upstream
+package/nmap/0001-libdnet-always-build-a-static-library.patch lib_patch.Upstream
 package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch lib_patch.Upstream
 package/nodejs/nodejs-src/0002-check-if-uclibc-has-backtrace-support.patch lib_patch.Upstream
 package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch lib_patch.Upstream
diff --git a/package/nmap/0001-libdnet-always-build-a-static-library.patch b/package/nmap/0001-libdnet-always-build-a-static-library.patch
new file mode 100644
index 00000000000..b34e44e389d
--- /dev/null
+++ b/package/nmap/0001-libdnet-always-build-a-static-library.patch
@@ -0,0 +1,25 @@
+From aeadf40bc0ebbb9fea8de8bc6786a2eccf02fa34 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 29 Jun 2024 16:50:36 +0200
+Subject: [PATCH] libdnet: always build a static library
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Julien: rebased patch on version 7.95]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ libdnet-stripped/configure.gnu | 3 +++
+ 1 file changed, 3 insertions(+)
+ create mode 100644 libdnet-stripped/configure.gnu
+
+diff --git a/libdnet-stripped/configure.gnu b/libdnet-stripped/configure.gnu
+new file mode 100644
+index 0000000..989fee4
+--- /dev/null
++++ b/libdnet-stripped/configure.gnu
+@@ -0,0 +1,3 @@
++#!/bin/sh
++
++exec "${0%.gnu}" "${@}" --enable-static --disable-shared
+-- 
+2.45.2
+
diff --git a/package/nmap/0001-libdnet-wrapper-configure.patch b/package/nmap/0001-libdnet-wrapper-configure.patch
deleted file mode 100644
index a85242ad941..00000000000
--- a/package/nmap/0001-libdnet-wrapper-configure.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-libdnet: always build a static library
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/libdnet-stripped/configure.gnu b/libdnet-stripped/configure.gnu
---- /dev/null
-+++ b/libdnet-stripped/configure.gnu
-@@ -0,0 +1,3 @@
-+#!/bin/sh
-+
-+exec "${0%.gnu}" "${@}" --enable-static --disable-shared
diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
index f2bdf5904dd..700b8585f13 100644
--- a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
+++ b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
@@ -1,4 +1,4 @@
-From 4ebea5c1d1a10be0d0165da3b9c0e1fa82c3db3c Mon Sep 17 00:00:00 2001
+From 0a79771c302bf398150da78cd18b67cb9b67f47a Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 21 May 2022 17:51:37 +0200
 Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
@@ -15,15 +15,17 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/nmap/nmap/pull/2480
+[Julien: rebased patch on version 7.95]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  nping/Crypto.cc | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/nping/Crypto.cc b/nping/Crypto.cc
-index 850438352..9f7c88686 100644
+index 6f05db6..1d11d55 100755
 --- a/nping/Crypto.cc
 +++ b/nping/Crypto.cc
-@@ -70,7 +70,9 @@
+@@ -69,7 +69,9 @@
  #include <openssl/evp.h>
  #include <openssl/err.h>
  
@@ -32,8 +34,8 @@ index 850438352..9f7c88686 100644
 +	((!defined LIBRESSL_VERSION_NUMBER) || \
 +	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
  #define HAVE_OPAQUE_EVP_PKEY 1
- #define FUNC_EVP_MD_CTX_init EVP_MD_CTX_reset
- #define FUNC_EVP_MD_CTX_cleanup EVP_MD_CTX_reset
+ #else
+ #define EVP_MD_CTX_new EVP_MD_CTX_create
 -- 
-2.35.1
+2.45.2
 
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 6e097a9884c..c9fcf9771df 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -34,7 +34,7 @@ comment "a symlink from ncat to 'nc' will be installed"
 
 config BR2_PACKAGE_NMAP_NMAP
 	bool "install nmap"
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  This option installs 'nmap' itself.
 
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 99c5d5fb07d..4f6ea20731a 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.94.tar.bz2.digest.txt (lowercase)
-sha512  a55cddf9c1d9272243d01251eb3315b26f232d0596818857083222a385398618b428dc2bd8282c3e832527e135a74aeb020ca8609d83d8337342f5d8a04d7f2c  nmap-7.94.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt (lowercase)
+sha256  e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778  nmap-7.95.tar.bz2
+sha512  fd95a8bc627a2b8b507353f761dc9fdc8e880a0dd2d75a51b9cb3ec664318796af9bb16a6ff9a1358bd77ad669c2a54e333be630f201f69287692a7d2d41c17e  nmap-7.95.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 6cd9d961198..077840b1923 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.94
+NMAP_VERSION = 7.95
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
@@ -62,7 +62,7 @@ NMAP_CONF_OPTS += --without-ncat
 endif
 
 ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
-NMAP_DEPENDENCIES += pcre
+NMAP_DEPENDENCIES += pcre2
 NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
 NMAP_MAKE_OPTS += nmap
 NMAP_INSTALL_TARGET_OPTS += install-nmap
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
