Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C29C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F5984051B;
	Sun, 10 Apr 2022 14:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFnZn13A1TrW; Sun, 10 Apr 2022 14:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ADF84017A;
	Sun, 10 Apr 2022 14:37:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA95C1BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D80BE40074
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6tB6S3yELEC for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:37:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 133694151A
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:37:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id x3so506868wmj.5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVbn9K1Yt7hpyg9kyEUG9uKU/5eKy0a8GxreXaFK4bc=;
 b=DWX8jpIoFhGfzA9K+5y5H+t9Nk+isAXdg3qyoBlHgD+abpX9jiaI3LRlTVfMutsb+F
 HHCfrpbHn6inDJ3oosMZPScg/HNVchUZPhHYKdhXlGDWrVkIjSLG/pbJCKVUFMOjQF9v
 X0g5iKAnkCKQcaFIJg1mceNtOob4EK7jDFfSUxBtlj9Qv0oTg5zRbKOxCOyw6uuHpS0Z
 pqg2nFWYTTKoOUqv2JSXqS6lnsuAP2Fl+LwzQZ1d8GarcGJKT9fdRbkXQhKs3aqMo8su
 48jh5tdPT98Mc5ratzh4uBpsluXzZyx9jVGzCGpZ1ebSnozPF1JCuA0vBcTBRZgCKRR2
 XC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVbn9K1Yt7hpyg9kyEUG9uKU/5eKy0a8GxreXaFK4bc=;
 b=Jol0d1XoxqQMUoxKha0w2KLCsPVaXDQ0VCLBYuUwXgoa7IQjTA9tTms/xAc3aZZ/Ss
 gnwW/iPmW3HvRDS7+/A8Ex4pTScMlUICvSInuDbvBjaZDGC4vq8DIykJ/FeSFWZCu3io
 /Jhhxzrquu61+Xi2ppEbhThUCRXASEndhC1IVsUeVOrLkZO/KALDO1sCWenGs0X9Fbk2
 cXQD0Ju/t4cOcTc8cpeuGpgxduHXgb5WnFYr7LfJrtJMGAItkC/hJCF58ohCNVybHl7+
 tTGBH2Ubo/zSH2D1g0UhejvylJXUtO6bnXL6KiIm/7F/rYnCUf0xZWN4WT0Y/+AzaGCp
 Gxfw==
X-Gm-Message-State: AOAM531KfKEdydOYBz3z4/KJrUB3oUO8CE3GXexBhm2LYcLf20/ESQKV
 0mIJ/irQfTKfXmk47XhOcKeViP/Uico=
X-Google-Smtp-Source: ABdhPJxrI543zK/djqWJwXqc61rnVEsCfS1JwQy0CLZaRJw3gSqtEBFjveGWc59M6Agb09yOjuq8EQ==
X-Received: by 2002:a7b:ca42:0:b0:38c:6d09:1362 with SMTP id
 m2-20020a7bca42000000b0038c6d091362mr25454941wml.103.1649601421890; 
 Sun, 10 Apr 2022 07:37:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a056000168f00b002057a9f9f5csm28841454wrd.31.2022.04.10.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 07:37:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:34:13 +0200
Message-Id: <20220410143413.146915-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kompexsqlite: security bump to
 version 1.12.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to get latest version
- Switch to generic-package and drop patches as upstream doesn't provide
  autotools support
- License is MIT since version 1.12.15
- This bump will fix the following build failure with BR2_OPTIMIZE_FAST:

src/sqlite3.c: In function 'sqlite3IsNaN':
src/sqlite3.c:21797:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
21797 | # error SQLite will not work correctly with the -ffast-math option of GCC.
      |   ^~~~~

- This bump will also fix security issues by bumping sqlite to 3.36.0
- Update indentation in hash file (two spaces)

http://sqlitewrapper.kompex-online.com/index.php?content=changelog

Fixes:
 - http://autobuild.buildroot.org/results/63e07345b97faa6d6239933f1790c6f2e02da77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-use-autoconf-CXX-for-proper-builds.patch | 27 ----------
 .../0002-append-to-cflags-and-cxxflags.patch  | 49 -------------------
 package/kompexsqlite/kompexsqlite.hash        |  5 +-
 package/kompexsqlite/kompexsqlite.mk          | 45 ++++++++++++++---
 4 files changed, 42 insertions(+), 84 deletions(-)
 delete mode 100644 package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
 delete mode 100644 package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch

diff --git a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch b/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
deleted file mode 100644
index 408c100d71..0000000000
--- a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 769693d9ddf63b04dd4aad6cad080f3cee3f997e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 11 Jun 2015 14:08:38 -0300
-Subject: [PATCH] Makefile: use autoconf CXX for proper builds
-
-Status: applied upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 91fb8b2..fe862cd 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -23,6 +23,7 @@ mandir = $(prefix)/share/man/man3
- headerdir = $(prefix)/include/kompex
- 
- CC = @CC@
-+CXX = @CXX@
- CFLAGS = @CFLAGS@
- CPPFLAGS = $(CFLAGS) @CPPFLAGS@
- LDFLAGS = @LDFLAGS@
--- 
-2.3.6
-
diff --git a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch b/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
deleted file mode 100644
index abd0dc0fdd..0000000000
--- a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7 Mon Sep 17 00:00:00 2001
-From: me <noemail@nowhere.com>
-Date: Thu, 20 Nov 2014 14:37:34 -0700
-Subject: [PATCH] Append to CFLAGS and CXXFLAGS as setup by ./configure.  This
- can allow users to Customize the SQLite build process with compile time
- #defines rather than altering the sources.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7
-
- Makefile-shared.mk | 4 ++--
- Makefile-static.mk | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile-shared.mk b/Makefile-shared.mk
-index b2a4920..d15ce3c 100644
---- a/Makefile-shared.mk
-+++ b/Makefile-shared.mk
-@@ -12,10 +12,10 @@ OBJS= \
- 	${objsdir}/sqlite3.o
- 
- # C Compiler Flags
--CFLAGS= -fPIC -MMD -MP
-+CFLAGS+= -fPIC -MMD -MP
- 
- # CC Compiler Flags
--CPPFLAGS= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
-+CPPFLAGS+= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
- 
- # Link Libraries and Options
- LDLIBSOPTIONS= -shared -fPIC
-diff --git a/Makefile-static.mk b/Makefile-static.mk
-index 429a4ff..0678681 100644
---- a/Makefile-static.mk
-+++ b/Makefile-static.mk
-@@ -12,10 +12,10 @@ OBJS= \
- 	${objsdir}/sqlite3.o
- 
- # C Compiler Flags
--CFLAGS= -MMD -MP
-+CFLAGS+= -MMD -MP
- 
- # CC Compiler Flags
--CPPFLAGS= -I${includedir} -MMD -MP
-+CPPFLAGS+= -I${includedir} -MMD -MP
- 
- # Link Libraries and Options
- LDLIBSOPTIONS=
diff --git a/package/kompexsqlite/kompexsqlite.hash b/package/kompexsqlite/kompexsqlite.hash
index 8869e9b7d9..aa0f269570 100644
--- a/package/kompexsqlite/kompexsqlite.hash
+++ b/package/kompexsqlite/kompexsqlite.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	kompexsqlite-1.10.12-1.tar.gz
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	LICENSE.txt
+sha256  81773ddb156fed51ef43a5f562e3b47761c4c33de9197bf0c3e7099b08579e2a  download.php?dl=KompexSQLiteWrapper-Source_1.12.15.tar.gz
+sha256  65fd20aeb67892740a710a09d788acfda8747741e746395739412919f84b5f9f  inc/KompexSQLiteDatabase.h
+sha256  001f26c0b2ca407a9a5d3f5e0690d7e576687b23110e18d2a08014dd774eb71c  inc/sqlite3.h
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index a40088fa2d..6a619de0ef 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -4,11 +4,44 @@
 #
 ################################################################################
 
-KOMPEXSQLITE_VERSION = 1.10.12-1
-KOMPEXSQLITE_SITE = \
-	$(call github,Aethelflaed,kompex-sqlite-wrapper,v$(KOMPEXSQLITE_VERSION))
+KOMPEXSQLITE_VERSION = 1.12.15
+KOMPEXSQLITE_SOURCE = download.php?dl=KompexSQLiteWrapper-Source_$(KOMPEXSQLITE_VERSION).tar.gz
+KOMPEXSQLITE_SITE = http://sqlitewrapper.kompex-online.com/counter
 KOMPEXSQLITE_INSTALL_STAGING = YES
-KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
-KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
+KOMPEXSQLITE_LICENSE = MIT (wrapper), Public Domain (bundled sqlite)
+KOMPEXSQLITE_LICENSE_FILES = inc/KompexSQLiteDatabase.h inc/sqlite3.h
 
-$(eval $(autotools-package))
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+KOMPEXSQLITE_CONFS += ReleaseStaticLib
+define KOMPEXSQLITE_INSTALL_STATIC_LIB
+	$(INSTALL) -D -m 0644 $(@D)/lib/release/KompexSQLiteWrapper_Static.a \
+		$(STAGING_DIR)/usr/lib/libkompex-sqlite-wrapper.a
+endef
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+KOMPEXSQLITE_CONFS += ReleaseDynamicLib
+define KOMPEXSQLITE_INSTALL_SHARED_LIB
+	$(INSTALL) -D -m 0755 $(@D)/lib/release/KompexSQLiteWrapper.so \
+		$(1)/usr/lib/libkompex-sqlite-wrapper.so
+endef
+endif
+
+define KOMPEXSQLITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		ALLCONFS="$(KOMPEXSQLITE_CONFS)" \
+		-C "$(@D)/Kompex SQLite Wrapper" all
+endef
+
+define KOMPEXSQLITE_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/kompex
+	$(INSTALL) -m 644 $(@D)/inc/* $(STAGING_DIR)/usr/include/kompex
+	$(KOMPEXSQLITE_INSTALL_STATIC_LIB)
+	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(STAGING_DIR))
+endef
+
+define KOMPEXSQLITE_INSTALL_TARGET_CMDS
+	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
