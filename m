Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4185C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8A44098F;
	Tue,  4 Jan 2022 18:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwpmG76uASH7; Tue,  4 Jan 2022 18:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9B1409D3;
	Tue,  4 Jan 2022 18:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59AF21BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17695813CE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAVnmF8POQ-d for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE7DE81BF5
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 24DBE82BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 593683b45f72169dd94ec14fa18720b3cec9dda4
X-Git-Newrev: 5e39bd0439be9f65a7b03f4bcd86bf2fbb16b212
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.24DBE82BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: bump version to 5.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e39bd0439be9f65a7b03f4bcd86bf2fbb16b212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depedency on libuuid was removed in:
https://github.com/tpm2-software/tpm2-tools/commit/210b2d639c216df7fa68e38427b13b96edbf78fd

Drop 0001-configure-make-build-gnu99.patch as it is in 5.2

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure-make-build-gnu99.patch          | 30 ----------------------
 package/tpm2-tools/Config.in                       |  2 --
 package/tpm2-tools/tpm2-tools.hash                 |  2 +-
 package/tpm2-tools/tpm2-tools.mk                   |  6 ++---
 4 files changed, 3 insertions(+), 37 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
