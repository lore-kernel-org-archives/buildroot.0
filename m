Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33672C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF0F84AC7;
	Fri, 16 Jan 2026 20:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6fF42lxdNFh; Fri, 16 Jan 2026 20:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00C884AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597074;
	bh=Ssnm+2cm5ijVtiWt32CgqThIMh+JGZIdm03nTkxqxbE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PWyZYAKpSNF3nQL+xc4fhZrlR89yZxeaLZ15WVhCnT9Q7T8v8tZhQUoaK1BQdGRU5
	 ybdFJYjkdFJYCuBRP5dcWj+fi/58dROuEAZd2R9CycON/mQpgFMQyNiAborPsHcYj8
	 E6Se0Mh2ncFBANDcMUgpmIceG2lcxhRusO3GiyjSj3fgplDynbv5BgDurLQAoULcvh
	 2Q7FvCwmGk9IFwwY/ZamTD5UNHkfmLWgMIVhEdMZlvVBlkoe5vXhJiv9Wpc5d1i54p
	 1hInPizzNOYmGU8x/5xDDssarZqxTyzfuEWK/0pMQg8A5yld3sGNxyB9tNhl7YiWLV
	 j5hIKcF+gUcAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00C884AC5;
	Fri, 16 Jan 2026 20:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E82223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C44D3615A3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Nal-GUmnix1 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCF8615A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFCF8615A2
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE80D88691; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:54:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81bc8bbd5b54c55967aa903b08bdffa42028aa4b
X-Git-Newrev: 3e4e261a16280422daeb65ea8ddbd8c2df34db83
X-Patchwork-Hint: ignore
Message-Id: <20260116205748.AE80D88691@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gconf: remove package, broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5123846597857972158=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5123846597857972158==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3e4e261a16280422daeb65ea8ddbd8c2df34db83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gconf has not seen any release since 2013, and the last commit in
https://gitlab.gnome.org/Archive/gconf is from 2015.

The package example application basic-gconf-app fails to build with a
recent compiler such as GCC 14.x:

basic-gconf-app.c:458:60: error: passing argument 1 of ‘gtk_dialog_get_content_area’ from incompatible pointer type [-Wincompatible-pointer-types]

It is not entirely clear since when this breakage takes place, but
most likely since GCC 14.x was introduced. This issue can be
reproduced including on 2025.02.x with the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_GCONF=y

However, for the build issue to happen you need to run:

$ make libgtk3
$ make

So that libgtk3 gets built before gconf. Indeed, there's a hidden
dependency between the two, and the example programs of gconf only get
build if libgtk3 is built before. We've however encountered the
problem in a (real) bigger build where the dependency relationship of
packages have caused libgtk3 to get built before gconf.

Note that we could perhaps have fixed the problem by disabling the
examples, but gconf is anyway so old and deprecated that it isn't
worth the effort.

There are no known autobuilder issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  7 +++++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/gconf/Config.in  | 21 ---------------------
 package/gconf/gconf.hash |  4 ----
 package/gconf/gconf.mk   | 23 -----------------------
 6 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 24d8abfd96..95bbf06189 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_GCONF
+	bool "gconf package removed"
+	select BR2_LEGACY
+	help
+	  gconf was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_LIBSVG
 	bool "libsvg package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 5ae3937375..0b9569b3e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1746,7 +1746,6 @@ F:	support/testing/tests/package/test_zfs.py
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-core/
 F:	package/earlyoom/
-F:	package/gconf/
 F:	package/libnss/
 F:	package/llama-cpp/
 F:	package/llvm-project/clang/
diff --git a/package/Config.in b/package/Config.in
index d8e7b5ac0e..edde13b7a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2152,7 +2152,6 @@ menu "Other"
 	source "package/flatcc/Config.in"
 	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
-	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
 	source "package/gemmlowp/Config.in"
 	source "package/gflags/Config.in"
diff --git a/package/gconf/Config.in b/package/gconf/Config.in
deleted file mode 100644
index a2371b3f23..0000000000
--- a/package/gconf/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_GCONF
-	bool "gconf"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
-	depends on BR2_USE_WCHAR # libglib2
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBXML2
-	help
-	  GConf was a system used by the GNOME desktop environment for
-	  storing configuration settings for the desktop and
-	  applications. It is similar to the Windows Registry.
-
-	  https://projects.gnome.org/gconf/
-
-comment "gconf needs a toolchain w/ threads, wchar, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
deleted file mode 100644
index ad0064fa99..0000000000
--- a/package/gconf/gconf.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://download.gnome.org/sources/GConf/3.2/GConf-3.2.6.sha256sum
-sha256  1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
-# License files, locally calculated
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
deleted file mode 100644
index b84fa96082..0000000000
--- a/package/gconf/gconf.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# gconf
-#
-################################################################################
-
-GCONF_VERSION = 3.2.6
-GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
-GCONF_SITE = https://download.gnome.org/sources/GConf/3.2
-GCONF_CONF_OPTS = --disable-orbit
-GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
-	host-intltool $(TARGET_NLS_DEPENDENCIES)
-GCONF_LICENSE = LGPL-2.0+
-GCONF_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GCONF_CONF_OPTS += --enable-introspection
-GCONF_DEPENDENCIES += gobject-introspection
-else
-GCONF_CONF_OPTS += --disable-introspection
-endif
-
-$(eval $(autotools-package))

--===============5123846597857972158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5123846597857972158==--
