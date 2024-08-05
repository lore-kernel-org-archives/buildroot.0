Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21421C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2430340629;
	Mon,  5 Aug 2024 21:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVTFHkMkAFjG; Mon,  5 Aug 2024 21:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D440440603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D440440603;
	Mon,  5 Aug 2024 21:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D93DF1BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D09264024D
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FbiHIWVOf-t for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC4A40237
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC4A40237
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 21:45:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4630683FE7; Mon,  5 Aug 2024 21:45:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 23:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9f2ade9bb207d2481b12a325bba7cee5a3e9cbf
X-Git-Newrev: beb54d8126e7b0fd2e1090061aa96e6487c4b697
X-Patchwork-Hint: ignore
Message-Id: <20240805214502.4630683FE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: bump to version 2.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=beb54d8126e7b0fd2e1090061aa96e6487c4b697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version requires libglib2 as a dependency, which itself is
detected using pkg-config, so we need host-pkgconf as a dependency.

The patch 0001-atop.h-include-time.h.patch can be removed, it was
applied upstream as
https://github.com/Atoptool/atop/commit/03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe.

A new patch (submitted upstream) is also needed to be able to provide
additional CFLAGS/LDFLAGS, without overriding the ones defined in the
upstream Makefile.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...low-the-user-to-pass-additional-CFLAGS-an.patch | 33 +++++++++++++++++
 package/atop/0001-atop.h-include-time.h.patch      | 41 ----------------------
 package/atop/Config.in                             | 11 +++---
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  4 +--
 5 files changed, 43 insertions(+), 48 deletions(-)

diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
new file mode 100644
index 0000000000..c4ec67ca24
--- /dev/null
+++ b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
@@ -0,0 +1,33 @@
+From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 5 Aug 2024 23:38:08 +0200
+Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS and
+ LDFLAGS
+
+This is needed for some build systems. For example, Buildroot needs to
+disable optimizations on some CPU architectures.
+
+Upstream: https://github.com/Atoptool/atop/pull/314
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a6f196b..dae5cda 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,8 +20,8 @@ PMPATH1  = /usr/lib/pm-utils/sleep.d
+ PMPATH2  = /usr/lib64/pm-utils/sleep.d
+ PMPATHD  = /usr/lib/systemd/system-sleep
+ 
+-CFLAGS  += -O2 -I. -Wall $(shell pkg-config --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
+-LDFLAGS  = $(shell pkg-config --libs glib-2.0)
++override CFLAGS  := -O2 -I. -Wall $(shell pkg-config --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security $(CFLAGS) # -DNOPERFEVENT   # -DHTTPSTATS
++override LDFLAGS  := $(shell pkg-config --libs glib-2.0) $(LDFLAGS)
+ OBJMOD0  = version.o
+ OBJMOD1  = various.o  deviate.o   procdbase.o
+ OBJMOD2  = acctproc.o photoproc.o photosyst.o  rawlog.o ifprop.o parseable.o
+-- 
+2.45.2
+
diff --git a/package/atop/0001-atop.h-include-time.h.patch b/package/atop/0001-atop.h-include-time.h.patch
deleted file mode 100644
index 2b8a390e71..0000000000
--- a/package/atop/0001-atop.h-include-time.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 29 Oct 2023 18:56:35 +0100
-Subject: [PATCH] atop.h: include time.h
-
-Include time.h to avoid the following build failure with musl:
-
-atop.h:157:1: error: unknown type name 'time_t'
-  157 | time_t          normalize_epoch(time_t, long);
-      | ^~~~~~
-atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
-atop.h:157:40: error: expected ')' before 'long'
-  157 | time_t          normalize_epoch(time_t, long);
-      |                                        ^~~~~
-      |                                        )
-
-Fixes:
- - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/Atoptool/atop/pull/280
----
- atop.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/atop.h b/atop.h
-index 9274fc5..3d5fea4 100644
---- a/atop.h
-+++ b/atop.h
-@@ -24,6 +24,8 @@
- #ifndef __ATOP__
- #define __ATOP__
- 
-+#include <time.h>
-+
- #define	EQ		0
- #define SECONDSINDAY	86400
- #define RAWNAMESZ	256
--- 
-2.42.0
-
diff --git a/package/atop/Config.in b/package/atop/Config.in
index b8ee30c306..6e9e209f17 100644
--- a/package/atop/Config.in
+++ b/package/atop/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_ATOP
 	bool "atop"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # ncurses wchar
+	depends on BR2_USE_MMU # fork(), libglib2
+	depends on BR2_USE_WCHAR # ncurses wchar, libglib2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # PERF_FLAG_FD_CLOEXEC
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Atop is an ASCII full-screen performance monitor for Linux
 	  that is capable of reporting the activity of all processes
@@ -20,7 +22,8 @@ config BR2_PACKAGE_ATOP
 
 	  http://www.atoptool.nl
 
-comment "atop needs a toolchain w/ wchar, headers >= 3.14"
+comment "atop needs a toolchain w/ wchar, headers >= 3.14, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 0b7ee061dd..a6539e6211 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  8d82f211b712a227000ef254c0a2b53bcb71235bf40d93316acce80b04bff926  atop-2.9.0.tar.gz
+sha256  e7a673cf2c82578e7dd82ecb0dec83fd9ecb30828b2561c28a9fa5aaf75d5f93  atop-2.10.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 27cd537f64..b383932e8d 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.9.0
+ATOP_VERSION = 2.10.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_CPE_ID_VALID = YES
-ATOP_DEPENDENCIES = ncurses zlib
+ATOP_DEPENDENCIES = ncurses zlib libglib2 host-pkgconf
 
 ATOP_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
