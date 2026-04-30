Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C3CFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCE1615E2;
	Mon,  4 May 2026 14:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pge47Xf0qqYc; Mon,  4 May 2026 14:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A829C6155A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906134;
	bh=MNqnRPdoVCEeruB2UO067kWkuD5RacIOMyXXbZFOU7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DMcuj7a17zQa1GzrXCjD3zqzQnbZW11ueryTeqy+1VTNTBgFQm1XEGWlTB3jYQ6km
	 2l6g58TIZm1akaYIfPauxRf34KHQcj5gXLw5r9ht+DCoWCYxTmUu/8tZlEc8Cj4tW5
	 eraximfsppGNstiC6Bl2/JHjo/lZK1p0L4iiKgmuvgCyTzADfQ4+/QZiYtpvmArL3W
	 lO95Bb6ltcw5x/abrs0AhOw8PblR1LH8lhmp8PjsgMceVCYyAyGkm3xdgu1cLVMbtu
	 JYl4JjbzK0nMXUIfMP4y5OSSK0j7iOUmijPfKB+WECimUWXEk2fH0DpsqIafkDN+TT
	 rp8eGLjBUazkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A829C6155A;
	Mon,  4 May 2026 14:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F67C25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1185F4079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14-f_nkqwdDw for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05BC140B70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05BC140B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD6458435A; Mon,  4 May 2026 14:48:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:08:28 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f43fdf13c77ed00dec8d61a2d9ff2a39fce30604
X-Git-Newrev: 9b0cb875ef1571da209b2fd4de50ceafde7e3b9e
X-Patchwork-Hint: ignore
Message-Id: <20260504144842.DD6458435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ficl: downgrade
 to version 3.03
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b0cb875ef1571da209b2fd4de50ceafde7e3b9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 20bd9021423959fdd4dd4413dc12e78ea6d35353)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 -
 package/ficl/0001-fix-Makefile.patch               | 47 ----------------------
 package/ficl/0001-missing-include.patch            | 26 ++++++++++++
 .../ficl/0002-Makefile.linux-pass-LDFLAGS.patch    | 11 +++--
 package/ficl/ficl.hash                             |  4 +-
 package/ficl/ficl.mk                               | 20 ++++-----
 6 files changed, 45 insertions(+), 64 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fabd3833a3..0e2e975eff 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -343,7 +343,6 @@ package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.
 package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
-package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
deleted file mode 100644
index d5a25c43f0..0000000000
--- a/package/ficl/0001-fix-Makefile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-fix dependency in Makefiles
-
-there is no longer a sysdep.h file.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-diff --git a/Makefile b/Makefile
-index 976d00a..7f73c44 100644
---- a/Makefile
-+++ b/Makefile
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) $(CFLAGS) $(LDFLAGS) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.ansi b/Makefile.ansi
-index e510fcd..170e6eb 100644
---- a/Makefile.ansi
-+++ b/Makefile.ansi
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.linux b/Makefile.linux
-index d447e7e..7f2cdfe 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
--- 
-
diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
new file mode 100644
index 0000000000..8c6547c46e
--- /dev/null
+++ b/package/ficl/0001-missing-include.patch
@@ -0,0 +1,26 @@
+From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 7 Dec 2025 10:15:27 +0100
+Subject: [PATCH] missing include
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: upstream is dead
+---
+ fileaccess.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fileaccess.c b/fileaccess.c
+index 738889d..c03d5d6 100644
+--- a/fileaccess.c
++++ b/fileaccess.c
+@@ -4,6 +4,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ #include "ficl.h"
+ 
+ #if FICL_WANT_FILE
+-- 
+2.43.0
+
diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
index dd9e16412c..d05b49b7ff 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: upstream is dead
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[francois: downgrade to 3.03]
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
  Makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,11 +25,12 @@ diff --git a/Makefile.linux b/Makefile.linux
 index 5f1a41f..df887e6 100644
 --- a/Makefile.linux
 +++ b/Makefile.linux
-@@ -14,6 +14,6 @@ MINOR = 1.0
+@@ -13,7 +13,7 @@ MAJOR = 3
+ MINOR = 0.1
  
- ficl: main.o $(HEADERS) libficl.a
--	$(CC) main.o -o ficl -L. -lficl -lm
-+	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
+ ficl: testmain.o ficl.h sysdep.h libficl.a
+-	$(CC) testmain.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
  
  lib: libficl.so.$(MAJOR).$(MINOR)
  
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index df53c843c1..1a4a54e704 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
-sha256  1d1dd1f1cde52e8b607c5ccb6a2e5de878fd1719b8c5a4d31b9cdb343c203d0d  ReadMe.txt
+sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
+sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index c0698a3433..ef2e1408ce 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-FICL_VERSION_MAJOR = 4.1
-FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
+FICL_VERSION = 3.03
+FICL_TAG = ficl$(subst .,,$(FICL_VERSION))
+FICL_VERSION_SO = 3.0.1
+FICL_SOURCE = $(FICL_TAG).tar.gz
+FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/$(FICL_TAG)
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
@@ -26,14 +28,14 @@ endef
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += main libficl.so.$(FICL_VERSION)
+FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
 define FICL_INSTALL_SHARED_BIN
-	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/ficl
+	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
 endef
 define FICL_INSTALL_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
+	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
 endef
 endif
 
@@ -46,8 +48,6 @@ define FICL_INSTALL_STAGING_CMDS
 	$(FICL_INSTALL_STATIC_LIB)
 	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
 	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
-	$(INSTALL) -D -m 0644 $(@D)/ficllocal.h $(STAGING_DIR)/usr/include/ficllocal.h
-	$(INSTALL) -D -m 0644 $(@D)/ficlplatform/unix.h $(STAGING_DIR)/usr/include/ficlplatform/unix.h
 endef
 
 define FICL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
