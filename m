Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24327C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF81141A49;
	Fri, 16 Jan 2026 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6x5MtdV_s4CI; Fri, 16 Jan 2026 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F6441A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597072;
	bh=KgBUW3V6RV8R5Dl8ifcAiN0kjSwKwhKcpqDds3CF3fc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Got1h0ZZa3oIEAR5+PT/E2OcgSEIMhnLcncgaiCVdz08LXhqVpCZGu/GcsEA01TOQ
	 kLgzYYhnsX4Wdz3Jg7a4iYEuIwqVHHWzZMQDRcAM62hHBhlRZ/f3EPCufidIvh2BTn
	 7lMpn+PAly158jZtNiWmyiXwtXoetbAKoOBHBkLjAuolvvr/tppfjqo6HeCYzYhzPf
	 PL0J8kl1PxlUkd5w5noY8XK/K2HmG9cVOyM7P6Au9xWQNQkV6cdj0MwqGxjQi1OD1k
	 4IeIF9Q9rpC9fcAgTYE593vqPM3naOx1bfsvjPoZ5MipHAHUk4oxliVfDThlj9a++D
	 RhdQB8Us3tljA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F6441A3B;
	Fri, 16 Jan 2026 20:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B80C32D1
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A184168D
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdTn2yoGifoh for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A723F40027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A723F40027
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9581988692; Fri, 16 Jan 2026 20:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:54:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8680db4582c5c448e0702409fc18dbdb7faf21a7
X-Git-Newrev: 81bc8bbd5b54c55967aa903b08bdffa42028aa4b
X-Patchwork-Hint: ignore
Message-Id: <20260116205748.9581988692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvg: remove package
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
Content-Type: multipart/mixed; boundary="===============2888474120395850941=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2888474120395850941==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=81bc8bbd5b54c55967aa903b08bdffa42028aa4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index a7c9fab430..a25452290b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -580,8 +580,6 @@ package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.pat
 package/libspatialindex/0001-allow-building-static-libs.patch lib_patch.Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch.Upstream
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch lib_patch.Upstream
-package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
-package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 0bd6677b50..24d8abfd96 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
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
index d8ee9140fc..5ae3937375 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -591,7 +591,6 @@ F:	package/sunxi-boards/
 
 N:	Carsten Schoenert <c.schoenert@gmail.com>
 F:	package/libdvbsi/
-F:	package/libsvg/
 
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
diff --git a/package/Config.in b/package/Config.in
index 13b6f2ece6..d8e7b5ac0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1773,7 +1773,6 @@ menu "Graphics"
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

--===============2888474120395850941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2888474120395850941==--
