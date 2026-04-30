Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A95CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9717615ED;
	Mon,  4 May 2026 14:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BuR-BC1SOx5; Mon,  4 May 2026 14:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2ACD615CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906138;
	bh=YrClmKXiCmjApWtA7CA4bQ0QLZUvJNpC1OBPcgs0Lxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XBPTG1/iSSvgh5MHRuNfOArLq8QPJv4fnHMGNHZ7Jh+SdvUXbmJRjEsqkcudCSBio
	 zQN6FPYeWwJdHOJgkHWy/Y66fORuf6NP5zGB3zrQ0b8Vecb98aX5YJliuefzIRgOij
	 f8E+tstKzT5g7Koe/Za+LL3tr2K8cYgrKib3HToXd0CFb14sVWua6zobynql6z1S1U
	 0ktDbH/xuUq8mzDlp+Tz9hhJjRgcIDD6L2kgsrnx8pMV81TD4c35ouiGCeoxLQx87V
	 kymrcLGn3hL6TajD/sQPu4qE2Gvtl1XLiOYJDR9b5TjEXsz+iIwS3RO08woWfx4vH+
	 9Mn7Io+ZyB2Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2ACD615CB;
	Mon,  4 May 2026 14:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2AB25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77A03615BB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWquRYWsLcsf for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E042615BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E042615BF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15D638435A; Mon,  4 May 2026 14:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:08:49 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9b0cb875ef1571da209b2fd4de50ceafde7e3b9e
X-Git-Newrev: 1b2573e946f6b639ab6ad69886a458e51e4cef49
X-Patchwork-Hint: ignore
Message-Id: <20260504144843.15D638435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ficl: bump to
 version 3.065
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b2573e946f6b639ab6ad69886a458e51e4cef49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

- sources are now hosted on Github
- ficl have its own LICENSE file
- remove one upstreamed patch
- support only static lib
- requires C11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e7dcf9e5af0cc0c7afd3e887f7731d855aa39094)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...atch => 0001-makefile.linux-pass-LDFLAGS.patch} | 26 ++++++------
 package/ficl/0001-missing-include.patch            | 26 ------------
 package/ficl/Config.in                             |  6 ++-
 package/ficl/ficl.hash                             |  4 +-
 package/ficl/ficl.mk                               | 47 +++++-----------------
 5 files changed, 31 insertions(+), 78 deletions(-)

diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
similarity index 70%
rename from package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
rename to package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
index d05b49b7ff..1ac86466d4 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
@@ -17,23 +17,25 @@ Upstream: upstream is dead
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [francois: downgrade to 3.03]
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[francois: upgrade to 3.065]
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
- Makefile.linux | 2 +-
+ makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.linux b/Makefile.linux
-index 5f1a41f..df887e6 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -13,7 +13,7 @@ MAJOR = 3
- MINOR = 0.1
- 
- ficl: testmain.o ficl.h sysdep.h libficl.a
--	$(CC) testmain.o -o ficl -L. -lficl -lm
-+	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
+diff --git a/makefile.linux b/makefile.linux
+index 1e467ea..fad7059 100755
+--- a/makefile.linux
++++ b/makefile.linux
+@@ -26,7 +26,7 @@ libficl.a: $(OBJECTS)
  
- lib: libficl.so.$(MAJOR).$(MINOR)
+ # === Console Test executable ===
+ ficl: $(FICL_TEST_OBJ) ficl.h sysdep.h libficl.a
+-	$(CC) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
  
+ # === Compile rules ===
+ .SUFFIXES: .cxx .cc .c .o
 -- 
 2.35.1
 
diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
deleted file mode 100644
index 8c6547c46e..0000000000
--- a/package/ficl/0001-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 7 Dec 2025 10:15:27 +0100
-Subject: [PATCH] missing include
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-Upstream: upstream is dead
----
- fileaccess.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/fileaccess.c b/fileaccess.c
-index 738889d..c03d5d6 100644
---- a/fileaccess.c
-+++ b/fileaccess.c
-@@ -4,6 +4,7 @@
- #include <string.h>
- #include <ctype.h>
- #include <sys/stat.h>
-+#include <unistd.h>
- #include "ficl.h"
- 
- #if FICL_WANT_FILE
--- 
-2.43.0
-
diff --git a/package/ficl/Config.in b/package/ficl/Config.in
index 4d9ab4a5bf..21861652ef 100644
--- a/package/ficl/Config.in
+++ b/package/ficl/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_FICL
 	bool "ficl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6 # C11/static_assert
 	help
 	  Ficl is a programming language interpreter designed to be
 	  embedded into other systems as a command, macro, and
 	  development prototyping language.
 	  Ficl is an acronym for "Forth Inspired Command Language".
 
-	  http://ficl.sourceforge.net
+	  https://ficl.sourceforge.net/
+
+comment "ficl needs a gcc >= 4.6"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index 1a4a54e704..6023708ff0 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
-sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
+sha256  09a4649a68a075999c2bc26129cf233c4d672335a9c68b98ffcbf1bc8962e5e1  ficl3065.tar.gz
+sha256  b7a894f23d7d7302852405b3d1b6fd88e76b4c116a68f046d4547c073c75d3ea  LICENSE
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index ef2e1408ce..1ab1bb6a39 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,56 +4,29 @@
 #
 ################################################################################
 
-FICL_VERSION = 3.03
+FICL_VERSION = 3.065
 FICL_TAG = ficl$(subst .,,$(FICL_VERSION))
-FICL_VERSION_SO = 3.0.1
 FICL_SOURCE = $(FICL_TAG).tar.gz
-FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/$(FICL_TAG)
-FICL_LICENSE = BSD-2-Clause
-FICL_LICENSE_FILES = ReadMe.txt
+FICL_SITE = $(call github,jwsadler58,ficl,$(FICL_TAG))
+FICL_LICENSE = BSD-3-Clause
+FICL_LICENSE_FILES = LICENSE
 FICL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += ficl
-define FICL_INSTALL_STATIC_BIN
-	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += libficl.a
-define FICL_INSTALL_STATIC_LIB
-	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
-endef
-endif
-
-ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
-define FICL_INSTALL_SHARED_BIN
-	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
-endef
-define FICL_INSTALL_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
-	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
-	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
-endef
-endif
+FICL_DEPENDENCIES = host-python3
 
 define FICL_BUILD_CMDS
-	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
+	# workaround for static_assert on uclibc-ng < 1.0.42
+	$(MAKE) -C $(@D) -f makefile.linux $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c11 -Dlinux -D_POSIX_C_SOURCE=200809L -Dstatic_assert=_Static_assert -I. " CPPFLAGS="" ficl
 endef
 
 define FICL_INSTALL_STAGING_CMDS
-	$(FICL_INSTALL_STATIC_LIB)
-	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
+	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
 	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
 endef
 
 define FICL_INSTALL_TARGET_CMDS
-	$(FICL_INSTALL_STATIC_BIN)
-	$(FICL_INSTALL_SHARED_BIN)
-	$(call FICL_INSTALL_SHARED_LIB,$(TARGET_DIR))
+	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
