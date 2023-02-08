Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BDDC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD43F4097B;
	Wed,  8 Feb 2023 13:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD43F4097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQFYYBv01MIK; Wed,  8 Feb 2023 13:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7894E4097D;
	Wed,  8 Feb 2023 13:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7894E4097D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE8FC1BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B3B4097D
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98B3B4097D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwr8vbJoxEzP for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:55:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 575B74097B
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575B74097B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 450D1846C2; Wed,  8 Feb 2023 13:55:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 14:55:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d8e207e7aaf035f48252e19013b610893d2fce0
X-Git-Newrev: b739d6bd98e8ee12ec2150563ef9cdef35d2ea35
X-Patchwork-Hint: ignore
Message-Id: <20230208135551.450D1846C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b739d6bd98e8ee12ec2150563ef9cdef35d2ea35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i3-compatible Wayland compositor

This Wayland compositor can be used as a kiosk compositor like cage, but
with the advantage of better configuration of multiple monitor and
windows. For example, move a window by title to the output X or set the
resolution of Y to Z.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Peter: Fix white space, add gdk-pixbuf to _DEPENDENCIES]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS             |  3 ++-
 package/Config.in      |  1 +
 package/sway/Config.in | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/sway/sway.hash |  3 +++
 package/sway/sway.mk   | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cb3361c83..0bb4db81bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2507,8 +2507,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
-N:	Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/slirp4netns/
+F:	package/sway/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/Config.in b/package/Config.in
index 06d0a05854..2adfcdbb1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ comment "Graphic applications"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
+	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
 
diff --git a/package/sway/Config.in b/package/sway/Config.in
new file mode 100644
index 0000000000..f8d073520f
--- /dev/null
+++ b/package/sway/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_SWAY
+	bool "sway"
+	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
+	depends on !BR2_STATIC_LIBS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_UDEV # wlroots
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_WCHAR # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
+	depends on BR2_USE_MMU # pango
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+	select BR2_PACKAGE_WLROOTS
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_PANGO
+	help
+	  i3-compatible Wayland compositor
+
+	  https://github.com/swaywm/sway
+
+comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
+	depends on !BR2_PACKAGE_SYSTEMD || \
+		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBGLES
+
+comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/sway/sway.hash b/package/sway/sway.hash
new file mode 100644
index 0000000000..6dfa71730f
--- /dev/null
+++ b/package/sway/sway.hash
@@ -0,0 +1,3 @@
+# Locally computed, tarball verified with GPG signature
+sha256  0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84  sway-1.7.tar.gz
+sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
new file mode 100644
index 0000000000..802371c827
--- /dev/null
+++ b/package/sway/sway.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# sway
+#
+################################################################################
+
+SWAY_VERSION = 1.7
+SWAY_SITE = $(call github,swaywm,sway,v$(SWAY_VERSION))
+SWAY_LICENSE = MIT
+SWAY_LICENSE_FILES = LICENSE
+SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
+SWAY_CONF_OPTS = \
+	-Dwerror=false \
+	-Ddefault-wallpaper=false \
+	-Dzsh-completions=false \
+	-Dbash-completions=false \
+	-Dfish-completions=false \
+	-Dswaybar=false \
+	-Dswaynag=false \
+	-Dtray=disabled \
+	-Dman-pages=disabled \
+	-Dsd-bus-provider=libsystemd
+
+ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
+SWAY_CONF_OPTS += -Dxwayland=enabled
+else
+SWAY_CONF_OPTS += -Dxwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
+SWAY_DEPENDENCIES += gdk-pixbuf
+else
+SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
