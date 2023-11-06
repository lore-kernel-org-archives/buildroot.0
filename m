Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A658C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC51341F83;
	Mon,  6 Nov 2023 21:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC51341F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0p4lK9o7k3r; Mon,  6 Nov 2023 21:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD33C41F96;
	Mon,  6 Nov 2023 21:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD33C41F96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C67511BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71ACF820B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71ACF820B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4g7iO5VV480f for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A29A82039
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A29A82039
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44A7386ADE; Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:45:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d47fa52df5bc0e1d6e1c0690dd6ee77b92965f35
X-Git-Newrev: 3b2da40749392319d45869b50f2b8362987eff38
X-Patchwork-Hint: ignore
Message-Id: <20231106214647.44A7386ADE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/system-config-printer: bump to
 version 1.5.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b2da40749392319d45869b50f2b8362987eff38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Drop second patch (rejected): cups-config is deprecated in favor of pkg-config
- Drop autoreconf (no more patches)
- intltool has been replaced by gettext since
  https://github.com/OpenPrinting/system-config-printer/commit/e653c1a860aedc306828e60f4b99a80e0d8b3523

https://github.com/OpenPrinting/system-config-printer/blob/v1.5.18/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 -
 ...option-to-disable-xmlto-manual-generation.patch | 73 ----------------------
 ...2-configure-accept-non-system-cups-config.patch | 35 -----------
 .../system-config-printer.hash                     |  2 +-
 .../system-config-printer/system-config-printer.mk | 11 +---
 5 files changed, 4 insertions(+), 119 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4fd26a4242..8b591e5276 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1336,8 +1336,6 @@ package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
-package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch Upstream
-package/system-config-printer/0002-configure-accept-non-system-cups-config.patch Upstream
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/targetcli-fb/S50target Shellcheck Variables
diff --git a/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
deleted file mode 100644
index e2cf395811..0000000000
--- a/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 731c8d7e1f9edb527785d61f74031a5e5846554b Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sun, 25 Jul 2021 16:30:59 -0600
-Subject: [PATCH] Add option to disable xmlto manual generation.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-95e0b461f5a46c74b00287aca65732ea2fc9d69b]
----
- Makefile.am  | 7 ++++++-
- configure.ac | 5 +++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 843ba30d..7facab94 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -209,9 +209,11 @@ else
- systemd_CLEANFILES=
- endif
- 
-+if XMLTO
- man_MANS=					\
- 	man/system-config-printer.1		\
- 	man/system-config-printer-applet.1
-+endif
- 
- dbus_DATA =					\
- 	dbus/com.redhat.NewPrinterNotification.conf		\
-@@ -274,7 +276,6 @@ EXTRA_DIST=\
- 	$(bin_SCRIPTS) \
- 	setup.py \
- 	$(EXPORT_MODULES) \
--	man/system-config-printer.xml \
- 	$(dbus_DATA) \
- 	$(dbusinterfaces_DATA) \
- 	$(dbusservices_DATA) \
-@@ -297,12 +298,16 @@ EXTRA_DIST=\
- 	test_PhysicalDevice.py \
- 	$(appdata_in_files)
- 
-+if XMLTO
-+EXTRA_DIST+=man/system-config-printer.xml
-+
- # The man pages are generated from DocBook XML.
- .stamp-man-pages-built: $(top_srcdir)/man/system-config-printer.xml
- 	xmlto man -o man $<
- 	touch .stamp-man-pages-built
- 
- $(man_MANS): .stamp-man-pages-built
-+endif
- 
- html:	$(EXPORT_MODULES) $(EXPORT_MODULES_GEN)
- 	rm -rf html
-diff --git a/configure.ac b/configure.ac
-index 811f897a..a2a66889 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -75,6 +75,11 @@ if test "x$with_systemdsystemunitdir" != xno; then
- fi
- AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
- 
-+AC_ARG_WITH(xmlto,
-+        [AC_HELP_STRING([--with-xmlto],
-+                [Enable xmlto manual generation @<:@default=yes@:>@])])
-+AM_CONDITIONAL([XMLTO], [test x$with_xmlto != xno])
-+
- ALL_LINGUAS="ar as ast bg bn_IN bn br bs ca cs cy da de el en_GB es et fa fi fr fur gu he hi hr hu id is it ja kn ko lt lv mai ml mr ms nb nds nl nn oc or pa pl pt_BR pt ro ru si sk sl sr@latin sr sv ta te th tr uk vi zh_CN zh_TW"
- AC_CONFIG_FILES([
- Makefile
--- 
-2.25.1
-
diff --git a/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch b/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch
deleted file mode 100644
index 9661115bf0..0000000000
--- a/package/system-config-printer/0002-configure-accept-non-system-cups-config.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 75db995dda74696123cde2869e4e9b3315b91abd Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 1 Aug 2021 13:40:28 +0200
-Subject: [PATCH] configure: accept non-system cups-config
-
-In cross-compilation setups, cups.config might not be installed, and
-might not be in the PATH.
-
-Allow a user to specify the full path to cups-config.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd013b4a..9f033d18 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,7 +33,11 @@ fi
- AC_SUBST(DESKTOPVENDOR)
- AC_SUBST(DESKTOPPREFIX)
- 
--cupsserverbindir="`cups-config --serverbin`"
-+AC_ARG_WITH([cups-config],
-+            [AC_HELP_STRING([--with-cups-config], [Specify the path of cups-config])],,
-+            [with_cups_config=cups-config])
-+
-+cupsserverbindir="`${with_cups_config} --serverbin`"
- AC_SUBST(cupsserverbindir)
- 
- PKG_CHECK_MODULES(GLIB, glib-2.0, has_glib=yes, has_glib=no)
--- 
-2.25.1
-
diff --git a/package/system-config-printer/system-config-printer.hash b/package/system-config-printer/system-config-printer.hash
index 56b7e47650..3bbc870780 100644
--- a/package/system-config-printer/system-config-printer.hash
+++ b/package/system-config-printer/system-config-printer.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  fbd226ce215bf014213dded81b43b9d4d90470524f5bf7cd21ecc71d4aefa689  system-config-printer-1.5.15.tar.xz
+sha256  b1a69e1b4ec2add569a87aeca811a37c5361ee6ae327ec852b79e64223e34bee  system-config-printer-1.5.18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
index e275743026..6b101e8400 100644
--- a/package/system-config-printer/system-config-printer.mk
+++ b/package/system-config-printer/system-config-printer.mk
@@ -4,18 +4,13 @@
 #
 ################################################################################
 
-SYSTEM_CONFIG_PRINTER_VERSION = 1.5.15
+SYSTEM_CONFIG_PRINTER_VERSION = 1.5.18
 SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VERSION).tar.xz
 SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
 SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0+
 SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
-SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-desktop-file-utils host-intltool host-pkgconf
-
-# 0001-Add-option-to-disable-xmlto-manual-generation.patch
-# 0002-configure-accept-non-system-cups-config.patch
-SYSTEM_CONFIG_PRINTER_AUTORECONF = YES
-
-SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES = \
+	cups host-desktop-file-utils $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
