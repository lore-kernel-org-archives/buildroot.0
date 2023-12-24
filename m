Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2066DC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 10:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C06416BC;
	Sun, 24 Dec 2023 10:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C06416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sz2F8ct96lt4; Sun, 24 Dec 2023 10:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCBB416C2;
	Sun, 24 Dec 2023 10:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACCBB416C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3AC1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E797060A8D
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E797060A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHqOjdBcHn09 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 10:49:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D33D460A89
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D33D460A89
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE70A82639; Sun, 24 Dec 2023 10:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 11:49:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 875b898b984e9aabaeced6a485356fb9c4b8d5db
X-Git-Newrev: 32c1fbad554d4c2bfbe56a652333195c8ae67904
X-Patchwork-Hint: ignore
Message-Id: <20231224104954.BE70A82639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: bump version to
 f49c2f1a2023da0cb055874fba050563dfea57db
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32c1fbad554d4c2bfbe56a652333195c8ae67904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop no longer needed
  0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch as
  it was a backport from upstream

- Updated license hash due to numerous additions of licenses, and
  updated copyright years. The LICENSE variable was updated
  accordingly, and clarified

- zlib is now a mandatory dependency, it is not checked at configure
  time, but <zlib.h> is uncondtionnally included, and libzlib is
  linked in unconditionnally. See
  https://chromium.googlesource.com/breakpad/breakpad/+/de086a98595f68715c1dce9860f77014a2a1b187

- explicitly disable zstd support, which was added in upstream commit
  https://chromium.googlesource.com/breakpad/breakpad/+/9ea5b228f560580f85df895c2f117d7e43340935. This
  requires adding AUTORECONF = YES because the pre-generated
  configure/Makefile.in available in the Git repository is out of
  date, and links unconditionnally with -lzstd, even when
  --disable-zstd is passed.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Thomas: handle zlib dependency, handle zstd option, fix LICENSE variable]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rsion-gcc-13-cannot-use-uintptr_t-via-inc.patch | 30 ----------------------
 package/google-breakpad/Config.in                  |  1 +
 package/google-breakpad/google-breakpad.hash       |  4 +--
 package/google-breakpad/google-breakpad.mk         | 21 ++++++++++++---
 4 files changed, 20 insertions(+), 36 deletions(-)

diff --git a/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch b/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
deleted file mode 100644
index 2c3619b74b..0000000000
--- a/package/google-breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa Mon Sep 17 00:00:00 2001
-From: mingtaoxt xt <mingtaoxt@gmail.com>
-Date: Wed, 19 Oct 2022 19:36:13 +0800
-Subject: [PATCH] mainline version gcc-13 cannot use "uintptr_t" via "#include
- <string>"
-
-Change-Id: I0049bb92658b4226e32783ad4d8271787deef5f3
-Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166
-Reviewed-by: Mike Frysinger <vapier@chromium.org>
-Upstream: https://chromium.googlesource.com/breakpad/breakpad/+/7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/client/linux/handler/minidump_descriptor.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/client/linux/handler/minidump_descriptor.h b/src/client/linux/handler/minidump_descriptor.h
-index 4349b88f..d822c9d9 100644
---- a/src/client/linux/handler/minidump_descriptor.h
-+++ b/src/client/linux/handler/minidump_descriptor.h
-@@ -32,6 +32,7 @@
- #include <assert.h>
- #include <sys/types.h>
- 
-+#include <cstdint>
- #include <string>
- 
- #include "client/linux/handler/microdump_extra_info.h"
--- 
-2.43.0
-
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 49d0bc06de..0d21fd2e5c 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
+	select BR2_PACKAGE_ZLIB
 	help
 	  Google-Breakpad is a library and tool suite that allows you
 	  to distribute an application to users with compiler-provided
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 03719816b5..788978f08a 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52716d140ba528d36b40591ae2c7485b18023f6610414bba0057f0cc13caf256  google-breakpad-c85eb4a59b618f3beaad5445ceb1f865ffa8efdf-br1.tar.gz
-sha256  8d5d1311342ed55b486d778a6763f54a26002698ac0cbab64026b98033300dfd  LICENSE
+sha256  29e147011bf6577df95ee3a50bf5ffd1941645dd414d569bd409a9035bcbb7f7  google-breakpad-f49c2f1a2023da0cb055874fba050563dfea57db-br1.tar.gz
+sha256  69b3d80c19a460e09716910d54d1ada5d800716e2b73751bebac44352590f646  LICENSE
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 132323363b..81d2c7d4a2 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,15 +4,28 @@
 #
 ################################################################################
 
-GOOGLE_BREAKPAD_VERSION = c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
+GOOGLE_BREAKPAD_VERSION = f49c2f1a2023da0cb055874fba050563dfea57db
 GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
 GOOGLE_BREAKPAD_SITE_METHOD = git
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
-GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause, MIT
+# APSL-2.0, BSD-4-Clause, Apache-2.0, BSD-2-Clause not listed, only
+# used for Mac code, GPL-2.0 not listed, only used for autotools code
+GOOGLE_BREAKPAD_LICENSE = \
+	BSD-3-Clause, \
+	Unicode-DFS-2015 (UTF code), \
+	MIT (src/common/linux/breakpad_getcontext.S), \
+	curl (src/third_party/curl/), \
+	ClArtistic (src/third_party/libdisasm)
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
-GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
+# Needed because the configure/Makefile.in provided in the Git
+# repository is out of date, and links with -lzstd even if
+# --disable-zstd is passed
+GOOGLE_BREAKPAD_AUTORECONF = YES
+GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support zlib
+GOOGLE_BREAKPAD_CONF_OPTS = --disable-zstd
 
-HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
+HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support host-zlib
+HOST_GOOGLE_BREAKPAD_CONF_OPTS = --disable-zstd
 
 ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS),)
 GOOGLE_BREAKPAD_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
