Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB97CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 15:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF9A407D3;
	Sun, 30 Nov 2025 15:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXH3GHrQlw7a; Sun, 30 Nov 2025 15:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5868D407DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5868D407DD;
	Sun, 30 Nov 2025 15:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65F72219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 548A46074F
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3W2gAzs5bplK for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 15:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F0B60679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F0B60679
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E51486250; Sun, 30 Nov 2025 15:56:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 16:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb1f3579a2ad9d6e317b7a2527b1fabb4229af5d
X-Git-Newrev: a8249d55c3b3cface53300c36195bcb03651cfe7
X-Patchwork-Hint: ignore
Message-Id: <20251130155651.7E51486250@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libargtable2: Remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8249d55c3b3cface53300c36195bcb03651cfe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last release dates back to 2012[1], no other package depends on
libargtable2 and the successor package libargtable3 is not backward-
compatible: https://www.argtable.org/

Due to build errors with newer gcc

/home/autobuild/autobuild/instance-15/output-1/host/microblazeel-buildroot-linux-musl/sysroot/usr/include/unistd.h:127:5:
 error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
  127 | int getopt(int, char * const [], const char *);

we remove the package from buildroot.

Fixes:
https://autobuild.buildroot.net/results/e6c/e6c039cb92fecbd93a91d2d1dab68e803875e62c/

[1] https://sourceforge.net/projects/argtable/files/argtable/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                 |  6 ++++++
 package/Config.in                                |  1 -
 package/libargtable2/0001-apply-uint-patch.patch | 25 ------------------------
 package/libargtable2/Config.in                   |  7 -------
 package/libargtable2/libargtable2.hash           |  3 ---
 package/libargtable2/libargtable2.mk             | 21 --------------------
 6 files changed, 6 insertions(+), 57 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 36296ca843..81396a2ce7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBARGTABLE2
+	bool "libargtable2 has been removed"
+	select BR2_LEGACY
+	help
+	  libargtable2 is unmaintained and has been removed
+
 config BR2_PACKAGE_OLA
 	bool "ola has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..83414b3e0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2205,7 +2205,6 @@ menu "Other"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
-	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
diff --git a/package/libargtable2/0001-apply-uint-patch.patch b/package/libargtable2/0001-apply-uint-patch.patch
deleted file mode 100644
index fed0307852..0000000000
--- a/package/libargtable2/0001-apply-uint-patch.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11 Mon Sep 17 00:00:00 2001
-From: Chris McClelland <prophet3636@gmail.com>
-Date: Thu, 12 Nov 2020 14:18:27 +0000
-Subject: [PATCH] Apply uint patch
-
-Upstream: https://github.com/makestuff/libargtable2/commit/3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11
-[thomas: strip to only have the include]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/arg_int.c     |  2 ++
- 1 files changed, 2 insertions(+)
-
-diff --git a/src/arg_int.c b/src/arg_int.c
-index 29c20e5..c51706a 100644
---- a/src/arg_int.c
-+++ b/src/arg_int.c
-@@ -24,6 +24,8 @@ USA.
- #include "config.h"
- #endif
- 
-+#include <ctype.h>
-+
- /* #ifdef HAVE_STDLIB_H */
- #include <stdlib.h>
- /* #endif */
diff --git a/package/libargtable2/Config.in b/package/libargtable2/Config.in
deleted file mode 100644
index 42d067becd..0000000000
--- a/package/libargtable2/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBARGTABLE2
-	bool "libargtable2"
-	help
-	  A greatly simplified and yet quite robust argument parsing
-	  set of library calls.
-
-	  http://argtable.sourceforge.net/
diff --git a/package/libargtable2/libargtable2.hash b/package/libargtable2/libargtable2.hash
deleted file mode 100644
index 7df3a18041..0000000000
--- a/package/libargtable2/libargtable2.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  8f77e8a7ced5301af6e22f47302fdbc3b1ff41f2b83c43c77ae5ca041771ddbf  argtable2-13.tar.gz
-sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
deleted file mode 100644
index d033e28f40..0000000000
--- a/package/libargtable2/libargtable2.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# libargtable2
-#
-################################################################################
-
-LIBARGTABLE2_MAJOR_VERSION = 2
-LIBARGTABLE2_MINOR_VERSION = 13
-LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
-LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-$(LIBARGTABLE2_VERSION)
-LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPTS = \
-	--disable-example \
-	--disable-kernel-module \
-	--enable-lib \
-	--enable-util
-LIBARGTABLE2_LICENSE = LGPL-2.0+
-LIBARGTABLE2_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
