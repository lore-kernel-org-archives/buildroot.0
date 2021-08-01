Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BBBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1752460F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1752460F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CB283AF1;
	Wed,  4 Aug 2021 01:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNo3mHIk4ASd; Wed,  4 Aug 2021 01:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDA283B19;
	Wed,  4 Aug 2021 01:04:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 181B51BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2913541480
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47EtCUV3gVZk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EBF840F2E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D59AD87E2D; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:03:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a3f27b1933451ff6e76d4b5c0bdcb4d3028e93d
X-Git-Newrev: 7d0de574dbda34f496a0ff2a8ece2b3c8ed9d5ca
X-Patchwork-Hint: ignore
Message-Id: <20210803211025.D59AD87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/system-config-printer:
 new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7d0de574dbda34f496a0ff2a8ece2b3c8ed9d5ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package has some udev tools to assist with printer autodetection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - add missing dependency to host-pkgconf
  - add patch for --with-cups-config
  - use that to point to cups-config in staging
  - append-assign in conditional blocks
  - license to be GPL-2.0-or-later (not GPL-2.0-only)
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 ...option-to-disable-xmlto-manual-generation.patch | 73 ++++++++++++++++++++++
 ...2-configure-accept-non-system-cups-config.patch | 35 +++++++++++
 package/system-config-printer/Config.in            |  7 +++
 .../system-config-printer.hash                     |  3 +
 .../system-config-printer/system-config-printer.mk | 38 +++++++++++
 6 files changed, 157 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fb7021f89d..2598565234 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2308,6 +2308,7 @@ endif
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
+	source "package/system-config-printer/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
new file mode 100644
index 0000000000..e2cf395811
--- /dev/null
+++ b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
@@ -0,0 +1,73 @@
+From 731c8d7e1f9edb527785d61f74031a5e5846554b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 25 Jul 2021 16:30:59 -0600
+Subject: [PATCH] Add option to disable xmlto manual generation.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+95e0b461f5a46c74b00287aca65732ea2fc9d69b]
+---
+ Makefile.am  | 7 ++++++-
+ configure.ac | 5 +++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 843ba30d..7facab94 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -209,9 +209,11 @@ else
+ systemd_CLEANFILES=
+ endif
+ 
++if XMLTO
+ man_MANS=					\
+ 	man/system-config-printer.1		\
+ 	man/system-config-printer-applet.1
++endif
+ 
+ dbus_DATA =					\
+ 	dbus/com.redhat.NewPrinterNotification.conf		\
+@@ -274,7 +276,6 @@ EXTRA_DIST=\
+ 	$(bin_SCRIPTS) \
+ 	setup.py \
+ 	$(EXPORT_MODULES) \
+-	man/system-config-printer.xml \
+ 	$(dbus_DATA) \
+ 	$(dbusinterfaces_DATA) \
+ 	$(dbusservices_DATA) \
+@@ -297,12 +298,16 @@ EXTRA_DIST=\
+ 	test_PhysicalDevice.py \
+ 	$(appdata_in_files)
+ 
++if XMLTO
++EXTRA_DIST+=man/system-config-printer.xml
++
+ # The man pages are generated from DocBook XML.
+ .stamp-man-pages-built: $(top_srcdir)/man/system-config-printer.xml
+ 	xmlto man -o man $<
+ 	touch .stamp-man-pages-built
+ 
+ $(man_MANS): .stamp-man-pages-built
++endif
+ 
+ html:	$(EXPORT_MODULES) $(EXPORT_MODULES_GEN)
+ 	rm -rf html
+diff --git a/configure.ac b/configure.ac
+index 811f897a..a2a66889 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,11 @@ if test "x$with_systemdsystemunitdir" != xno; then
+ fi
+ AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
+ 
++AC_ARG_WITH(xmlto,
++        [AC_HELP_STRING([--with-xmlto],
++                [Enable xmlto manual generation @<:@default=yes@:>@])])
++AM_CONDITIONAL([XMLTO], [test x$with_xmlto != xno])
++
+ ALL_LINGUAS="ar as ast bg bn_IN bn br bs ca cs cy da de el en_GB es et fa fi fr fur gu he hi hr hu id is it ja kn ko lt lv mai ml mr ms nb nds nl nn oc or pa pl pt_BR pt ro ru si sk sl sr@latin sr sv ta te th tr uk vi zh_CN zh_TW"
+ AC_CONFIG_FILES([
+ Makefile
+-- 
+2.25.1
+
diff --git a/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch b/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch
new file mode 100644
index 0000000000..9661115bf0
--- /dev/null
+++ b/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch
@@ -0,0 +1,35 @@
+From 75db995dda74696123cde2869e4e9b3315b91abd Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 1 Aug 2021 13:40:28 +0200
+Subject: [PATCH] configure: accept non-system cups-config
+
+In cross-compilation setups, cups.config might not be installed, and
+might not be in the PATH.
+
+Allow a user to specify the full path to cups-config.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dd013b4a..9f033d18 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,7 +33,11 @@ fi
+ AC_SUBST(DESKTOPVENDOR)
+ AC_SUBST(DESKTOPPREFIX)
+ 
+-cupsserverbindir="`cups-config --serverbin`"
++AC_ARG_WITH([cups-config],
++            [AC_HELP_STRING([--with-cups-config], [Specify the path of cups-config])],,
++            [with_cups_config=cups-config])
++
++cupsserverbindir="`${with_cups_config} --serverbin`"
+ AC_SUBST(cupsserverbindir)
+ 
+ PKG_CHECK_MODULES(GLIB, glib-2.0, has_glib=yes, has_glib=no)
+-- 
+2.25.1
+
diff --git a/package/system-config-printer/Config.in b/package/system-config-printer/Config.in
new file mode 100644
index 0000000000..8ebc4d060c
--- /dev/null
+++ b/package/system-config-printer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SYSTEM_CONFIG_PRINTER
+	bool "system-config-printer"
+	depends on BR2_PACKAGE_CUPS
+	help
+	  Graphical user interface for CUPS administration
+
+	  https://github.com/OpenPrinting/system-config-printer
diff --git a/package/system-config-printer/system-config-printer.hash b/package/system-config-printer/system-config-printer.hash
new file mode 100644
index 0000000000..56b7e47650
--- /dev/null
+++ b/package/system-config-printer/system-config-printer.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  fbd226ce215bf014213dded81b43b9d4d90470524f5bf7cd21ecc71d4aefa689  system-config-printer-1.5.15.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
new file mode 100644
index 0000000000..b20bea7dc4
--- /dev/null
+++ b/package/system-config-printer/system-config-printer.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# system-config-printer
+#
+################################################################################
+
+SYSTEM_CONFIG_PRINTER_VERSION = 1.5.15
+SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VERSION).tar.xz
+SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
+SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0+
+SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-intltool host-pkgconf
+
+# 0001-Add-option-to-disable-xmlto-manual-generation.patch
+# 0002-configure-accept-non-system-cups-config.patch
+SYSTEM_CONFIG_PRINTER_AUTORECONF = YES
+
+SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_LIBUSB)$(BR2_PACKAGE_HAS_UDEV),yyy)
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-udev-rules=yes
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libusb udev
+else
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-udev-rules=no
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES += systemd
+else
+SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
