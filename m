Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70674C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAC482FA9;
	Tue, 28 Jun 2022 06:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAC482FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CVqcr1bIpmv; Tue, 28 Jun 2022 06:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3DFA82EF1;
	Tue, 28 Jun 2022 06:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DFA82EF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABAE1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759DA410DC
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759DA410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wl9U6l2weMbU for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A268410DB
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A268410DB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 361DF87761; Tue, 28 Jun 2022 05:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 08:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecf85b4ef58873e9acf749adedfbaa90baaaf3c0
X-Git-Newrev: e62db6c7cca5438d029ce89d5685f17cb6129a9e
X-Patchwork-Hint: ignore
Message-Id: <20220628055156.361DF87761@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/upower: bump to version 0.99.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=e62db6c7cca5438d029ce89d5685f17cb6129a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest release
- Switch to meson-package (autotools dropped since version 0.99.14)
- libusb is not a dependency since
  https://gitlab.freedesktop.org/upower/upower/-/commit/64582256a8c75127c3de23f5542c8467e2e9484a
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/upower/upower/-/blob/v0.99.19/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: also update thermald dependencies]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thermald/Config.in |  5 ++---
 package/upower/Config.in   |  9 +++------
 package/upower/upower.hash |  4 ++--
 package/upower/upower.mk   | 20 ++++++++++++--------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index e5e15b9b8d..353ce31a7a 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_THERMALD
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # upower -> libgudev
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # upower -> libusb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus, upower
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on BR2_PACKAGE_HAS_UDEV # upower
@@ -22,11 +21,11 @@ config BR2_PACKAGE_THERMALD
 
 	  https://github.com/intel/thermal_daemon
 
-comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "thermald needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_INSTALL_LIBSTDCPP
 
 comment "thermald needs udev /dev management"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/upower/Config.in b/package/upower/Config.in
index 612a2b74b9..e2bcdd12c3 100644
--- a/package/upower/Config.in
+++ b/package/upower/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_UPOWER
 	bool "upower"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev
 	depends on BR2_USE_MMU # libgudev
 	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBGUDEV
-	select BR2_PACKAGE_LIBUSB
 	help
 	  UPower is an abstraction for enumerating power devices,
 	  listening to device events and querying history and
@@ -23,7 +21,6 @@ comment "upower needs udev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
 
-comment "upower needs a toolchain w/ threads, wchar, gcc >= 4.9"
+comment "upower needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/upower/upower.hash b/package/upower/upower.hash
index e69ad20cbc..cabce1f558 100644
--- a/package/upower/upower.hash
+++ b/package/upower/upower.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef  upower-0.99.11.tar.xz
-sha256 c1753877db41d798d63369a825ad9225bbeb5e10a407be5fcd8de96182f1c50d  COPYING
+sha256  e5bda2f5837ee311f5b7b6ec9549b029c88f4958011c6a8f5550b54408ee06ae  upower-v0.99.19.tar.bz2
+sha256  c1753877db41d798d63369a825ad9225bbeb5e10a407be5fcd8de96182f1c50d  COPYING
diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index a6f39d2f46..49aac8c7a2 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UPOWER_VERSION = 0.99.11
-UPOWER_SOURCE = upower-$(UPOWER_VERSION).tar.xz
-UPOWER_SITE = https://upower.freedesktop.org/releases
+UPOWER_VERSION = 0.99.19
+UPOWER_SOURCE = upower-v$(UPOWER_VERSION).tar.bz2
+UPOWER_SITE = https://gitlab.freedesktop.org/upower/upower/-/archive/v$(UPOWER_VERSION)
 UPOWER_LICENSE = GPL-2.0+
 UPOWER_LICENSE_FILES = COPYING
 
@@ -17,16 +17,20 @@ UPOWER_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libgudev \
-	libusb \
 	udev
 
-UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
+UPOWER_CONF_OPTS = \
+	-Dgtk-doc=false \
+	-Dman=false \
+	-Dsystemdsystemunitdir=/usr/lib/systemd/system \
+	-Dudevhwdbdir=/lib/udev/hwdb.d \
+	-Dudevrulesdir=/lib/udev/rules.d
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-UPOWER_CONF_OPTS += --enable-introspection
+UPOWER_CONF_OPTS += -Dintrospection=enabled
 UPOWER_DEPENDENCIES += gobject-introspection
 else
-UPOWER_CONF_OPTS += --disable-introspection
+UPOWER_CONF_OPTS += -Dintrospection=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
