Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACDCC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 04:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D11860AC6;
	Thu, 22 Aug 2024 04:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPVWNEAtSWvu; Thu, 22 Aug 2024 04:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6CCA60AA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CCA60AA8;
	Thu, 22 Aug 2024 04:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC241BF338
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 04:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84BF940309
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 04:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXPmFqavpU3R for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 04:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80F63402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F63402BC
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80F63402BC
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 04:10:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 41D513536D26; Thu, 22 Aug 2024 06:10:04 +0200 (CEST)
Date: Thu, 22 Aug 2024 06:10:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zsa6HF+NBfLtnThO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724299804; bh=INf45K58tBOwNjuyLRqzPjfGqBxR74dtrnnRtA749/o=;
 h=Date:From:To:Subject:From;
 b=dPYBUdgufIMuG9ZqXYjELseDyDM1M/w0AA2C/60rPSUarLTEg/gtMofTvektXgHSm
 Ixv3i/wtNfbNfYrlNRH6EzmcioJ53eBbHerVqxhzD9nLVSSGJb1+tugoWBJWGpETx9
 ATjm+ljaFgTX8NJFpL1K1SPIN51Jfgs5UQGIRfmFypZZzxrV+hjFT7UjhuRiCGX8d2
 K65NAM1ety2b7DCQDHBXU6zoMDTbzsq1xAGaBrd/msqQ9V63WIM6ZtVz6xe135NO6A
 gvCRdEM7Id+T4264Hw2WklkGUCTW7piZr5j3RZrtMkvzClMT8CvFI0TeDfXw9ctgsV
 ahTfY+WeNgcfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=dPYBUdgu
Subject: [Buildroot] [PATCH next] package/httping: update to 4.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes made to the Buildroot package:
 - use github url for download
 - switch to cmake infrastructure
 - add new option for TUI support
 - add new option for SSL support
 - TFO is always enabled now
 - remove no longer required patches 0001/0002
 - update license file to LICENSE
 - update license to GPLv3
 - always build without gettext support

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-fix-math-library-linking.patch       | 27 -----------
 ...Makefile-allow-build-without-gettext.patch | 48 -------------------
 package/httping/Config.in                     | 13 ++++-
 package/httping/httping.hash                  |  4 +-
 package/httping/httping.mk                    | 41 +++++-----------
 5 files changed, 26 insertions(+), 107 deletions(-)
 delete mode 100644 package/httping/0001-fix-math-library-linking.patch
 delete mode 100644 package/httping/0002-Makefile-allow-build-without-gettext.patch

diff --git a/package/httping/0001-fix-math-library-linking.patch b/package/httping/0001-fix-math-library-linking.patch
deleted file mode 100644
index 582fb9e917..0000000000
--- a/package/httping/0001-fix-math-library-linking.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Move LDFLAGS+=-lm option to the end.
-The order of the math library directive '-lm' matters.
-
-Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
-[Fabrice: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
-diff -Nurp httping-2.3.4_orig/Makefile httping-2.3.4/Makefile
---- httping-2.3.4_orig/Makefile	2014-07-23 16:16:36.495546288 +0530
-+++ httping-2.3.4/Makefile	2014-07-23 16:18:42.547541002 +0530
-@@ -36,7 +36,6 @@ DEBUG=yes
- WFLAGS=-Wall -W -Wextra -pedantic -D_FORTIFY_SOURCE=2
- OFLAGS=
- CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\" -DLOCALEDIR=\"$(LOCALEDIR)\"
--LDFLAGS+=-lm
- 
- PACKAGE=$(TARGET)-$(VERSION)
- PREFIX?=/usr
-@@ -97,6 +96,8 @@ ifeq ($(ARM),yes)
- CC=arm-linux-gcc
- endif
- 
-+LDFLAGS+=-lm
-+
- all: $(TARGET) $(TRANSLATIONS)
- 
- $(TARGET): $(OBJS)
diff --git a/package/httping/0002-Makefile-allow-build-without-gettext.patch b/package/httping/0002-Makefile-allow-build-without-gettext.patch
deleted file mode 100644
index aec1de47d1..0000000000
--- a/package/httping/0002-Makefile-allow-build-without-gettext.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fe7d6c5a0e5dfe129f228498037393d23d6ae890 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 18 Jul 2017 19:09:03 +0300
-Subject: [PATCH] Makefile: allow build without gettext
-
-The msgfmt command is part of the gettext package, and is used to generate
-binary translation files. When gettext is not installed, build fails.
-Translation files are not always needed on size constrained embedded targets.
-Add an option to disable translation files generation using the NO_GETTEXT
-variable.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/flok99/httping/pull/36
-
- Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 46127f4cdde1..160cc1794ec8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -55,7 +55,9 @@ MKDIR=/bin/mkdir
- ARCHIVE=/bin/tar cf -
- COMPRESS=/bin/gzip -9
- 
-+ifneq ($(NO_GETTEXT),yes)
- TRANSLATIONS=nl.mo ru.mo
-+endif
- 
- OBJS=gen.o http.o io.o error.o utils.o main.o tcp.o res.o socks5.o kalman.o cookies.o help.o colors.o
- 
-@@ -118,10 +120,12 @@ install: $(TARGET) $(TRANSLATIONS)
- ifneq ($(DEBUG),yes)
- 	$(STRIP) $(DESTDIR)/$(BINDIR)/$(TARGET)
- endif
-+ifneq ($(NO_GETTEXT),yes)
- 	mkdir -p $(DESTDIR)/$(PREFIX)/share/locale/nl/LC_MESSAGES
- 	cp nl.mo $(DESTDIR)/$(PREFIX)/share/locale/nl/LC_MESSAGES/httping.mo
- 	mkdir -p $(DESTDIR)/$(PREFIX)/share/locale/ru/LC_MESSAGES
- 	cp ru.mo $(DESTDIR)/$(PREFIX)/share/locale/ru/LC_MESSAGES/httping.mo
-+endif
- 
- 
- makefile.inc:
--- 
-2.13.2
-
diff --git a/package/httping/Config.in b/package/httping/Config.in
index c0e5071ce8..f5057e05d0 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -16,7 +16,16 @@ config BR2_PACKAGE_HTTPING
 
 if BR2_PACKAGE_HTTPING
 
-config BR2_PACKAGE_HTTPING_TFO
-	bool "TCP Fast Open (TFO) support"
+config BR2_PACKAGE_HTTPING_SSL
+	bool "enable SSL support"
+	select BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+
+config BR2_PACKAGE_HTTPING_TUI
+	bool "enable TUI support"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
+	select BR2_PACKAGE_FFTW_DOUBLE
 
 endif
diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index 3178c32377..7c153ad2db 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e895a0a6d7bd79de25a255a1376d4da88eb09c34efdd0476ab5a907e75bfaf8  httping-2.5.tgz
-sha256  c5db2e5b9a692fcdf2bd370f1533529063fbcf8947a8f5ee9d4b050a14e0566d  license.txt
+sha256  41b29bedd19ad2aa0f744149c70ad925c9f28400717dcefbdaf77d321176cbfb  v4.1.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index b3a625a8e1..cf1189eeb6 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,34 +4,19 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 2.5
-HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
-HTTPING_SITE = http://www.vanheusden.com/httping
-HTTPING_LICENSE = GPL-2.0
-HTTPING_LICENSE_FILES = license.txt
-HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(TARGET_NLS_LIBS) \
-	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
-HTTPING_DEPENDENCIES = \
-	$(TARGET_NLS_DEPENDENCIES) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW_DOUBLE),fftw-double)
-HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
-	FW=$(if $(BR2_PACKAGE_FFTW_DOUBLE),yes,no) \
-	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
-	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
-	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
-	NO_GETTEXT=$(if $(BR2_SYSTEM_ENABLE_NLS),no,yes)
+HTTPING_VERSION = 4.1.0
+HTTPING_SOURCE = v$(HTTPING_VERSION).tar.gz
+HTTPING_SITE = $(call github,folkertvanheusden,HTTPing,v$(HTTPING_VERSION))
+HTTPING_LICENSE = GPL-3.0
+HTTPING_LICENSE_FILES = LICENSE
 
-define HTTPING_BUILD_CMDS
-	$(HTTPING_MAKE_OPTS) LDFLAGS="$(HTTPING_LDFLAGS)" \
-		$(MAKE) DEBUG=no -C $(@D)
-endef
+ifeq ($(BR2_PACKAGE_HTTPING_TUI),y)
+HTTPING_DEPENDENCIES += ncurses fftw-double
+HTTPING_CONF_OPTS += -DUSE_TUI=1
+endif
 
-define HTTPING_INSTALL_TARGET_CMDS
-	$(HTTPING_MAKE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
-endef
+ifeq ($(BR2_PACKAGE_HTTPING_SSL),y)
+HTTPING_DEPENDENCIES += openssl
+endif
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
