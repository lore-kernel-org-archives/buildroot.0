Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E754FEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6428845BA;
	Fri, 13 Feb 2026 19:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXXU2DajfH75; Fri, 13 Feb 2026 19:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E0B84650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011393;
	bh=dtOgIB4d1leOsTYl6Fi78xhPDCqGdAA+ZdZBUqTrx7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eo9UZbbDateiF3i3rmPQAt8ivxwZLTr2WYWEOa8oKG1nMEEX1/NtR4fvl+SKGcbID
	 DjPQn9G+Ypv0r6m4IpNHdcargMGa6bvZoB0cp3H1yM7Qa6Tw4PsoIUEi65/OHI6193
	 h4sIipgVxBra0h7p244fcfBhEXJUDyB9dANkDrQDNyHYiDAXFOUZSYnj9C4lakgxMS
	 97P2awb/9NoFlYm44Ck7NyGvV1kvROmTWY5C8fvVc5rUY8kV88g90tAnP/bs3PqxgV
	 7vqV0HokQEa1iCWTeqjT/jumNk+VObp0VahTolNQf+/RPWyNMhZ8Lm0ApcByFJkYj8
	 rvXRf0AWtC3SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E0B84650;
	Fri, 13 Feb 2026 19:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16BD1283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB14141E58
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7K8ZL5w-a06h for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E99141E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E99141E32
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9331C83A88; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af865daee0daab23f0ee96c2291093a4c9823d0b
X-Git-Newrev: 6ce14a3faebf5c3f927f98d480d5b7a81afd7445
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.9331C83A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dvdrw-tools:
 remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ce14a3faebf5c3f927f98d480d5b7a81afd7445
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Upstream is dead, website unreachable, and the use case in 2026 is
dubious, so drop the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95519e04644ab536a8cfb6a6cff0ddfb3898a3ab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  2 -
 Config.in.legacy                                   |  7 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/dvdrw-tools/0001-limits.h.patch            | 23 ----------
 ...ude-sysmacros.h-to-compile-with-newer-gcc.patch | 14 ------
 package/dvdrw-tools/Config.in                      | 53 ----------------------
 package/dvdrw-tools/dvdrw-tools.hash               |  3 --
 package/dvdrw-tools/dvdrw-tools.mk                 | 35 --------------
 9 files changed, 7 insertions(+), 132 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f2b8fc6c8d..a143f8ea85 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -354,8 +354,6 @@ package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch lib_pa
 package/dvblast/0001-missing-lm.patch lib_patch.Upstream
 package/dvblast/0002-fix-int-types.patch lib_patch.Upstream
 package/dvbsnoop/0001-musl-types-h.patch lib_patch.Upstream
-package/dvdrw-tools/0001-limits.h.patch lib_patch.Upstream
-package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch lib_patch.Upstream
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch lib_patch.Upstream
 package/earlyoom/S02earlyoom Shellcheck lib_sysv.Indent
 package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index e8c95cb939..f1e4fa0d99 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02.11"
 
+config BR2_PACKAGE_DVDRW_TOOLS
+	bool "dvdrw-tools removed"
+	select BR2_LEGACY
+	help
+	  dvdrw-tools was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_LOCKDEV
 	bool "lockdev removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 30cf69a28f..0cae81eb11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3061,7 +3061,6 @@ F:	package/libcli/
 
 N:	Steve Kenton <skenton@ou.edu>
 F:	package/dvdauthor/
-F:	package/dvdrw-tools/
 F:	package/memtest86/
 F:	package/mjpegtools/
 F:	package/udftools/
diff --git a/package/Config.in b/package/Config.in
index bd44e8e988..38da39033b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -16,7 +16,6 @@ menu "Audio and video applications"
 	source "package/bluez-alsa/Config.in"
 	source "package/dvblast/Config.in"
 	source "package/dvdauthor/Config.in"
-	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff --git a/package/dvdrw-tools/0001-limits.h.patch b/package/dvdrw-tools/0001-limits.h.patch
deleted file mode 100644
index ccda8eeb72..0000000000
--- a/package/dvdrw-tools/0001-limits.h.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-transport.hxx: add limits.h include now needed because of kernel changes
-
-Signed-off-by: Steve Kenton <skenton@ou.edu>
-
-diff -pruN dvd+rw-tools-7.1.ori/transport.hxx dvd+rw-tools-7.1/transport.hxx
---- dvd+rw-tools-7.1.ori/transport.hxx	2008-03-01 04:34:43.000000000 -0600
-+++ dvd+rw-tools-7.1/transport.hxx	2015-01-18 15:47:24.245863631 -0600
-@@ -9,6 +9,7 @@
- #if defined(__unix) || defined(__unix__)
- #include <stdio.h>
- #include <stdlib.h>
-+#include <limits.h>
- #include <unistd.h>
- #include <string.h>
- #include <sys/types.h>
-@@ -40,6 +41,7 @@ inline long getmsecs()
- #include <stddef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <limits.h>
- #define ssize_t		LONG_PTR
- #define off64_t		__int64
- 
diff --git a/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
deleted file mode 100644
index 29c3a73a4b..0000000000
--- a/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-growisofs.c: include sysmacros.h to compile with glibc-2.28
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -urpN dvd+rw-tools-7.1.orig/growisofs.c dvd+rw-tools-7.1/growisofs.c
---- dvd+rw-tools-7.1.orig/growisofs.c	2018-09-08 01:56:11.686656819 +0200
-+++ dvd+rw-tools-7.1/growisofs.c	2018-09-08 02:11:45.868778471 +0200
-@@ -441,6 +441,7 @@
- #include <fcntl.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <assert.h>
- #include "mp.h"
diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
deleted file mode 100644
index d4d6bd2cd3..0000000000
--- a/package/dvdrw-tools/Config.in
+++ /dev/null
@@ -1,53 +0,0 @@
-comment "dvdrw-tools needs a toolchain w/ threads, C++, wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR
-
-config BR2_PACKAGE_DVDRW_TOOLS
-	bool "dvdrw-tools"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	help
-	  The dvd+rw-tools are used to master Blu-ray Disc
-	  and DVD Disc media, both +RW/+R and -RW/-R. Note:
-	  The +RW in the name is a historical artifact. This
-	  package contains the widely used growisofs program.
-
-	  Buildroot does not support packages with a '+' sign
-	  in their name, which explains why it is named
-	  dvdrw-tools and not dvd+rw-tools.
-
-	  Because dvd+rw-tools does not directly interact with
-	  disc media it uses a separate media backend program.
-	  The usual backend is mkisofs from the cdrtools package.
-	  However, cdrtools is not currently part of buildroot.
-
-	  The Linux From Scratch project uses uses xorriso for the
-	  media backend and Ubuntu uses cdrkit for the backend.
-	  Choose the one which seems most appropriate for your use.
-	  NOTE: xorriso does not currently support UDF.
-
-	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
-
-if BR2_PACKAGE_DVDRW_TOOLS
-choice
-	prompt "Media Backend"
-	help
-	  Choose which media backend program to use.
-
-config BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
-	bool "cdrkit"
-	select BR2_PACKAGE_CDRKIT
-	help
-	  Symlink mkisofs to genisoimage from the cdrkit package.
-
-config BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND
-	bool "xorriso"
-	select BR2_PACKAGE_XORRISO
-	help
-	  Symlink mkisofs to xorrisofs from the xorriso package.
-
-endchoice
-endif
diff --git a/package/dvdrw-tools/dvdrw-tools.hash b/package/dvdrw-tools/dvdrw-tools.hash
deleted file mode 100644
index a5ed6ad521..0000000000
--- a/package/dvdrw-tools/dvdrw-tools.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed using sha256sum
-sha256  f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca  dvd+rw-tools-7.1.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSE
diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
deleted file mode 100644
index 5dab546607..0000000000
--- a/package/dvdrw-tools/dvdrw-tools.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# dvdrw-tools
-#
-################################################################################
-
-DVDRW_TOOLS_VERSION = 7.1
-DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
-DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
-DVDRW_TOOLS_LICENSE = GPL-2.0
-DVDRW_TOOLS_LICENSE_FILES = LICENSE
-DVDRW_TOOLS_DEPENDENCIES = host-m4
-
-define DVDRW_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
-DVDRW_TOOLS_BACKEND = genisoimage
-DVDRW_TOOLS_DEPENDENCIES += cdrkit
-else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
-DVDRW_TOOLS_BACKEND = xorrisofs
-DVDRW_TOOLS_DEPENDENCIES += xorriso
-endif
-
-define DVDRW_TOOLS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
-	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
-	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
-	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
-	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
-	ln -s -f $(DVDRW_TOOLS_BACKEND) $(TARGET_DIR)/usr/bin/mkisofs
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
