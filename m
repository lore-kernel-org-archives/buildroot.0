Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A037BD3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD6D40A8B;
	Wed, 28 Jan 2026 17:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnCLtuPfg_EG; Wed, 28 Jan 2026 17:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA67408F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620916;
	bh=TaccN7U1lE5rcHfVWUm77cT8xZOcUqY0CBkcuDrAtWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjicQ4j+oBIaGqcs4HPx6GdXPlZJFCAn7ghd0k2HespoxXd2RfIC6SFI5nFI1O54k
	 AgZhBT+Qfb0YL+s0bvvk3onHzlEwDMiQTyR7JDvTzXdxtbamOo7s3PNq3NYFRNVH3H
	 9hx0eJHsIuNiXeRfzyHkD/JF4jdx5YIV1NXEfV+6u3nb81g0qoedHY8v39jQDRr03I
	 01HfLjT1EsAlUCKM6LPXcLZTccXzxHreE2f2Hu0XWu7qj/3gnoUmlhFWtB/WM1fS5l
	 QYUn9Vez9MQfm8+zCUQVUbBWvxIiIBAaBTXBL/wDtEIcGReMg+PKfmP+8pVWnJ7Yzo
	 GzEhSUtRkfT4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA67408F3;
	Wed, 28 Jan 2026 17:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D919118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0375860781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO2dqbgtld4J for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A0960782
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A0960782
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4E57851EB; Wed, 28 Jan 2026 17:21:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:50:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0bc24aafbdb38a5e0d24426f9a5293dc07f57085
X-Git-Newrev: 134e29a86fd5fe2b1ccc1d31b342caf94edae398
X-Patchwork-Hint: ignore
Message-Id: <20260128172151.D4E57851EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libsvg: remove
 package
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
Content-Type: multipart/mixed; boundary="===============6492588237115449263=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6492588237115449263==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=134e29a86fd5fe2b1ccc1d31b342caf94edae398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

This package is no longer maintained, no release since 2005, and it
has build issues as it uses too old XML APIs:

/home/thomas/projets/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/libxml2/libxml/SAX.h:18:4: warning: #warning "libxml/SAX.h is deprecated" [-Wcpp]
   18 |   #warning "libxml/SAX.h is deprecated"
      |    ^~~~~~~

svgint.h:42:9: error: unknown type name 'xmlParserCtxtPtr'
   42 | typedef xmlParserCtxtPtr svg_xml_parser_context_t;
      |         ^~~~~~~~~~~~~~~~

Fixes:

  https://autobuild.buildroot.net/results/895fdba2f3fcaa42aa93946f2532351d39b16647/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81bc8bbd5b54c55967aa903b08bdffa42028aa4b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  2 --
 Config.in.legacy                                   |  9 ++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../libsvg/0001-fix-expat-static-declaration.patch | 36 ----------------------
 ...-undefined-symbol-png_set_gray_1_2_4_to_8.patch | 32 -------------------
 package/libsvg/Config.in                           | 12 --------
 package/libsvg/libsvg.hash                         |  6 ----
 package/libsvg/libsvg.mk                           | 23 --------------
 9 files changed, 9 insertions(+), 113 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1058d66ad4..c8b2b41921 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -604,8 +604,6 @@ package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.pat
 package/libspatialindex/0001-allow-building-static-libs.patch lib_patch.Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch.Upstream
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch lib_patch.Upstream
-package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
-package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 84f35d8b69..7bc18fac8b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2025.11.2"
 
+config BR2_PACKAGE_LIBSVG
+	bool "libsvg package removed"
+	select BR2_LEGACY
+	help
+	  The libsvg package has been removed. Its latest upstream
+	  release was from 2005, it was incompatible with recent
+	  libxml2 versions, and it wasn't used by any other Buildroot
+	  package except libsvg-cairo, also removed.
+
 config BR2_PACKAGE_LIBSVG_CAIRO
 	bool "libsvg-cairo package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6e382fd868..4a78ec0606 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -584,7 +584,6 @@ F:	package/sunxi-boards/
 
 N:	Carsten Schoenert <c.schoenert@gmail.com>
 F:	package/libdvbsi/
-F:	package/libsvg/
 
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
diff --git a/package/Config.in b/package/Config.in
index 06ae9ace41..7402715b65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1766,7 +1766,6 @@ menu "Graphics"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
-	source "package/libsvg/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvdpau/Config.in"
diff --git a/package/libsvg/0001-fix-expat-static-declaration.patch b/package/libsvg/0001-fix-expat-static-declaration.patch
deleted file mode 100644
index 1086785d0f..0000000000
--- a/package/libsvg/0001-fix-expat-static-declaration.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Newer expat versions use different declarations of the following functions:
-
-static void _svg_parser_sax_start_element ();
-static void _svg_parser_sax_end_element ();
-static void _svg_parser_sax_characters ();
-
-We need to patch the libsvg source to not follow into a build error like
-   "static declaration of 'foo' follows non-static declaration"
-and use the functions from the expat library instead from the libsvg source.
-
-Patch based on
-http://oe-lite.org/redmine/projects/xorg/repository/revisions/c4df7951e846e1be718f37f2455696a1d0861f3d/entry/recipes/cairo/libsvg-0.1.4/gcc4_and_expat.patch
-
-Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_expat.c
---- libsvg-0.1.4~orig/src/svg_parser_expat.c	2005-02-14 11:26:26.000000000 -0600
-+++ libsvg-0.1.4/src/svg_parser_expat.c	2006-02-10 21:58:20.000000000 -0600
-@@ -30,6 +30,7 @@
- #include "svgint.h"
- #include "svg_hash.h"
- 
-+#ifndef LIBSVG_EXPAT
- static void
- _svg_parser_sax_start_element (void		*closure,
- 			       const XML_Char	*name,
-@@ -43,6 +44,7 @@
- _svg_parser_sax_characters (void		*closure,
- 			    const XML_Char	*ch,
- 			    int			len);
-+#endif
- 
- static void
- _svg_parser_sax_warning (void		*closure,
diff --git a/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch b/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
deleted file mode 100644
index d0bbeab074..0000000000
--- a/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 213e5749947fad08d985eda8d06839efedda78ef Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 5 Mar 2015 21:42:52 +0100
-Subject: [PATCH] Fix undefined symbol png_set_gray_1_2_4_to_8
-
-Since libpng-1.4.0 the function png_set_gray_1_2_4_to_8() was
-removed, the replacement function is called
-png_set_expand_gray_1_2_4_to_8() (see [1]).
-
-[1] http://libpng.sourceforge.net/ANNOUNCE-1.4.0.txt
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/svg_image.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/svg_image.c b/src/svg_image.c
-index cd8a95a..f256943 100755
---- a/src/svg_image.c
-+++ b/src/svg_image.c
-@@ -271,7 +271,7 @@ _svg_image_read_png (const char		*filename,
- 
-     /* expand gray bit depth if needed */
-     if (color_type == PNG_COLOR_TYPE_GRAY && depth < 8)
--	png_set_gray_1_2_4_to_8 (png);
-+	png_set_expand_gray_1_2_4_to_8 (png);
- 
-     /* transform transparency to alpha */
-     if (png_get_valid(png, info, PNG_INFO_tRNS))
--- 
-2.1.4
-
diff --git a/package/libsvg/Config.in b/package/libsvg/Config.in
deleted file mode 100644
index 741ef10c7a..0000000000
--- a/package/libsvg/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LIBSVG
-	bool "libsvg"
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
-	help
-	  Libsvg provides a parser for SVG content in files or buffers.
-	  Libsvg does not do any rendering, but instead provides a
-	  function-based interface that can be used by various rendering
-	  engines.
-
-	  http://cairographics.org/snapshots/
diff --git a/package/libsvg/libsvg.hash b/package/libsvg/libsvg.hash
deleted file mode 100644
index 4a9d42a651..0000000000
--- a/package/libsvg/libsvg.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://cairographics.org/snapshots/libsvg-0.1.4.tar.gz.md5
-md5  ce0715e3013f78506795fba16e8455d3  libsvg-0.1.4.tar.gz
-
-# Locally calculated
-sha256  4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f  libsvg-0.1.4.tar.gz
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
deleted file mode 100644
index 45d730db1f..0000000000
--- a/package/libsvg/libsvg.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# libsvg
-#
-################################################################################
-
-LIBSVG_VERSION = 0.1.4
-LIBSVG_SITE = http://cairographics.org/snapshots
-LIBSVG_DEPENDENCIES = host-pkgconf libpng jpeg
-LIBSVG_INSTALL_STAGING = YES
-LIBSVG_LICENSE = LGPL-2.0+
-LIBSVG_LICENSE_FILES = COPYING
-
-# libsvg needs at last a XML parser
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-LIBSVG_CONF_OPTS += --with-expat
-LIBSVG_DEPENDENCIES += expat
-else
-LIBSVG_CONF_OPTS += --with-libxml2
-LIBSVG_DEPENDENCIES += libxml2
-endif
-
-$(eval $(autotools-package))

--===============6492588237115449263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6492588237115449263==--
