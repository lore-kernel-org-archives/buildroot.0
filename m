Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A92C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 21:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB608400A6;
	Sun,  2 Jan 2022 21:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSY4XFimBd3t; Sun,  2 Jan 2022 21:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A390F400AB;
	Sun,  2 Jan 2022 21:27:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5E61BF3DD
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99E05812D5
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 21:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zEQCdeGrmMG for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 21:27:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
 by smtp1.osuosl.org (Postfix) with ESMTP id 206E4812D1
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 21:27:06 +0000 (UTC)
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org
 (Postfix) with ESMTPA id E146DFF50
From: Erik Larsson <who+buildroot@cnackers.org>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 22:25:59 +0100
Message-Id: <20220102212559.43475-1-who+buildroot@cnackers.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101223900.2970405-2-who+buildroot@cnackers.org>
References: <20220101223900.2970405-2-who+buildroot@cnackers.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/tpm2-tools: bump version to 5.2
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
Cc: Erik Larsson <who+buildroot@cnackers.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depedency on libuuid was removed in:
https://github.com/tpm2-software/tpm2-tools/commit/210b2d639c216df7fa68e38427b13b96edbf78fd

Drop 0001-configure-make-build-gnu99.patch as it is in 5.2

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
---
 .../0001-configure-make-build-gnu99.patch     | 30 -------------------
 package/tpm2-tools/Config.in                  |  2 --
 package/tpm2-tools/tpm2-tools.hash            |  2 +-
 package/tpm2-tools/tpm2-tools.mk              |  6 ++--
 4 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/tpm2-tools/0001-configure-make-build-gnu99.patch

diff --git a/package/tpm2-tools/0001-configure-make-build-gnu99.patch b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
deleted file mode 100644
index 37ca6c5873..0000000000
--- a/package/tpm2-tools/0001-configure-make-build-gnu99.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 521c3cc506b18c5c84d86e1e90d1daee39849b0c Mon Sep 17 00:00:00 2001
-From: William Roberts <william.c.roberts@intel.com>
-Date: Mon, 8 Feb 2021 11:57:28 -0600
-Subject: [PATCH] configure: make build gnu99
-
-Signed-off-by: William Roberts <william.c.roberts@intel.com>
-
-[Retrieved from:
-https://github.com/tpm2-software/tpm2-tools/commit/521c3cc506b18c5c84d86e1e90d1daee39849b0c
-and updated to set gnu99 instead of c99 as done by
-https://github.com/tpm2-software/tpm2-tools/commit/5d0267428e96989afce406d096994ec5091ee107]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index dc15b5595..25039a0d9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -287,6 +287,9 @@ AC_DEFUN([add_c_flag], [
- # -D_GNU_SOURCE is required for execvpe() in options.c
- add_c_flag([-D_GNU_SOURCE], [AC_MSG_ERROR([Cannot enable -D_GNU_SOURCE])])
- 
-+# Enable gnu99 mode, since we use some of these features.
-+add_c_flag([-std=gnu99], [AC_MSG_ERROR([Cannot enable -std=gnu99])])
-+
- # Best attempt compiler options that are on newer versions of GCC that
- # we can't widely enforce without killing other peoples builds.
- # Works with gcc only. Needs to be disabled on BSD and clang
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 3be947648f..1a6698570a 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_TPM2_TSS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
 	  API of TPM2-TSS. These tools can be used to manage keys,
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index bfb7e9b220..f50a896363 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e2802d4093a24b2c65b1f913d0f4c68eadde9b8fd8a9b7a3b17a6e50765e8350  tpm2-tools-4.3.2.tar.gz
+sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 41f5bcf201..8675344805 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 4.3.2
+TPM2_TOOLS_VERSION = 5.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
 TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
 TPM2_TOOLS_SELINUX_MODULES = tpm2
-TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
-# We're patching configure.ac
-TPM2_TOOLS_AUTORECONF = YES
+TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
