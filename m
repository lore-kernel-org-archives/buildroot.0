Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E053CCF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B3F81ABB;
	Mon, 23 Sep 2024 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYQRW-xnyfO2; Mon, 23 Sep 2024 19:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5343B81AD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5343B81AD7;
	Mon, 23 Sep 2024 19:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54B7A1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5100360A44
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daT9_ulltP2X for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37CC560A43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37CC560A43
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AAC37FD45; Mon, 23 Sep 2024 19:35:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 21:34:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d28d24dbc543cf8365a11582bdf1b8aa0e39bc89
X-Git-Newrev: 1c2fa85cb12de3992b275068890508983973fcdd
X-Patchwork-Hint: ignore
Message-Id: <20240923193513.2AAC37FD45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/httping: update to latest git
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c2fa85cb12de3992b275068890508983973fcdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes made to the Buildroot package:
 - use github url for download
 - switch to cmake infrastructure
 - add new option for TUI support
 - add new option for SSL support
 - TFO is always enabled now, and therefore we don't need to add
   Config.in.legacy handling for this option
 - remove no longer required patches 0001/0002
 - update license file to LICENSE
 - update license to AGPLv3
 - always build without gettext support

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[yann.morin.1998@free.fr:
  - update .checkpackageignore
  - don't use $(call github...)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 -
 .../httping/0001-fix-math-library-linking.patch    | 27 ------------
 ...0002-Makefile-allow-build-without-gettext.patch | 48 ----------------------
 package/httping/Config.in                          | 13 +++++-
 package/httping/httping.hash                       |  4 +-
 package/httping/httping.mk                         | 41 ++++++------------
 6 files changed, 26 insertions(+), 109 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c24b94a794..0cc742bf09 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -584,8 +584,6 @@ package/heirloom-mailx/0001-fix-libressl-support.patch lib_patch.Upstream
 package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstream
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/htpdate/S43htpdate Shellcheck
-package/httping/0001-fix-math-library-linking.patch lib_patch.Upstream
-package/httping/0002-Makefile-allow-build-without-gettext.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
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
index c0e5071ce8..d21b97ea1d 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -16,7 +16,16 @@ config BR2_PACKAGE_HTTPING
 
 if BR2_PACKAGE_HTTPING
 
-config BR2_PACKAGE_HTTPING_TFO
-	bool "TCP Fast Open (TFO) support"
+config BR2_PACKAGE_HTTPING_SSL
+	bool "enable SSL support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+
+config BR2_PACKAGE_HTTPING_TUI
+	bool "enable TUI support"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
 
 endif
diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index 3178c32377..e07f3e32e0 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e895a0a6d7bd79de25a255a1376d4da88eb09c34efdd0476ab5a907e75bfaf8  httping-2.5.tgz
-sha256  c5db2e5b9a692fcdf2bd370f1533529063fbcf8947a8f5ee9d4b050a14e0566d  license.txt
+sha256  4bf8641ebc44a6fa52086f82c60a29051e094424996d972263155d267c96d305  httping-0e26c53d5fe504eb7204d64b23513729aa4a5bb0-git4.tar.gz
+sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index b3a625a8e1..8cb4f7f2f9 100644
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
+HTTPING_VERSION = 0e26c53d5fe504eb7204d64b23513729aa4a5bb0
+HTTPING_SITE = https://github.com/folkertvanheusden/HTTPing
+HTTPING_SITE_METHOD = git
+HTTPING_LICENSE = AGPL-3.0
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
