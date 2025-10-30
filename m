Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776CCCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9072184063;
	Thu, 30 Oct 2025 08:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdA7EbG-GhWV; Thu, 30 Oct 2025 08:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB97840BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB97840BA;
	Thu, 30 Oct 2025 08:22:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DFEB2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E328613A0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QpMx4t33CzP for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAAC2613A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAAC2613A4
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C846387A0D; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:18:04 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3c1e6ee3daeb6840b3a4101555cc319af5de725f
X-Git-Newrev: 1cdbcad9f518d18a39ec3ed2147bd7c34a038bbe
X-Patchwork-Hint: ignore
Message-Id: <20251030082228.C846387A0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libvips: security
 bump to v8.17.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1cdbcad9f518d18a39ec3ed2147bd7c34a038bbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

See the many release notes: https://github.com/libvips/libvips/releases

Along that version bump:
- Change source code archive compression from .gz to .xz as this the
  new upstream delivery format
- Switch from autotools to meson build system (see upstream commit
  https://github.com/libvips/libvips/commit/538aa2a8415e10e5c30e4e8671ab5387ca4869fb)
- Update the LICENSE file (see upstream commit
  https://github.com/libvips/libvips/commit/057703938e76083f78760d64ece983dcf7be65ff)

This fixes the following vulnerabilities:
- CVE-2025-29769:
    libvips is a demand-driven, horizontally threaded image processing
    library.  The heifsave operation could incorrectly determine the
    presence of an alpha channel in an input when it was not possible to
    determine the colour interpretation, known internally within libvips
    as "multiband". There aren't many ways to create a "multiband" input,
    but it is possible with a well-crafted TIFF image. If a "multiband"
    TIFF input image had 4 channels and HEIF-based output was requested,
    this led to libvips creating a 3 channel HEIF image without an alpha
    channel but then attempting to write 4 channels of data. This caused a
    heap buffer overflow, which could crash the process. This
    vulnerability is fixed in 8.16.1.
    https://www.cve.org/CVERecord?id=CVE-2025-29769

- CVE-2025-59933:
    libvips is a demand-driven, horizontally threaded image processing
    library. For versions 8.17.1 and below, when libvips is compiled with
    support for PDF input via poppler, the pdfload operation is affected
    by a buffer read overflow when parsing the header of a crafted PDF
    with a page that defines a width but not a height. Those using libvips
    compiled without support for PDF input are unaffected as well as
    thosewith support for PDF input via PDFium. This issue is fixed in
    version 8.17.2. A workaround for those affected is to block the
    VipsForeignLoadPdf operation via vips_operation_block_set, which is
    available in most language bindings, or to set VIPS_BLOCK_UNTRUSTED
    environment variable at runtime, which will block all untrusted
    loaders including PDF input via poppler.
    https://www.cve.org/CVERecord?id=CVE-2025-59933

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: update _LICENSE_FILES to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 72c7d99e22eb7706e413992cf7084438fea657bb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libvips/libvips.hash |  6 +--
 package/libvips/libvips.mk   | 92 ++++++++++++++++++++------------------------
 2 files changed, 44 insertions(+), 54 deletions(-)

diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index 1ba242d1cf..dd7510ecb2 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  2468088d958e0e2de1be2991ff8940bf45664a826c0dad12342e1804e2805a6e  vips-8.10.6.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+# From https://github.com/libvips/libvips/releases/download/v8.17.2/vips-8.17.2.tar.xz.sha256sum
+sha256  57ea0ec4f30ea04748c9e8eec5415e7c9ac7cafe6822e4788fc110376a1d224a  vips-8.17.2.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 8eb1f0964e..e7641fa8cd 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.10.6
-LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
+LIBVIPS_VERSION = 8.17.2
+LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.xz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
-LIBVIPS_LICENSE_FILES = COPYING
+LIBVIPS_LICENSE_FILES = LICENSE
 LIBVIPS_CPE_ID_VENDOR = libvips
 
 # Sparc64 compile fails, for all optimization levels except -O0. To
@@ -22,135 +22,125 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 LIBVIPS_CONF_OPTS = \
-	--without-dmalloc \
-	--without-gsf \
-	--without-OpenEXR \
-	--without-openslide \
-	--without-cfitsio \
-	--without-pangoft2 \
-	--without-x
+	-Dopenexr=disabled \
+	-Dopenslide=disabled \
+	-Dcfitsio=disabled \
+	-Dpangocairo=disabled
 LIBVIPS_INSTALL_STAGING = YES
 LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-ifeq ($(BR2_PACKAGE_GIFLIB),y)
-LIBVIPS_CONF_OPTS += --with-giflib
-LIBVIPS_DEPENDENCIES += giflib
-else
-LIBVIPS_CONF_OPTS += --without-giflib
-endif
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBVIPS_CONF_OPTS += --enable-introspection
+LIBVIPS_CONF_OPTS += -Dintrospection=enabled
 LIBVIPS_DEPENDENCIES += gobject-introspection
 else
-LIBVIPS_CONF_OPTS += --disable-introspection
+LIBVIPS_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
 LIBVIPS_CONF_OPTS += \
-	--with-magick \
-	--with-magickpackage=MagickCore
+	-Dmagick=enabled \
+	-Dmagick-package=MagickCore
 LIBVIPS_DEPENDENCIES += imagemagick
 else ifeq ($(BR2_PACKAGE_GRAPHICSMAGICK),y)
 LIBVIPS_CONF_OPTS += \
-	--with-magick \
-	--with-magickpackage=GraphicsMagick
+	-Dmagick=enabled \
+	-Dmagick-package=GraphicsMagick
 LIBVIPS_DEPENDENCIES += graphicsmagick
 else
-LIBVIPS_CONF_OPTS += --without-magick
+LIBVIPS_CONF_OPTS += -Dmagick=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-LIBVIPS_CONF_OPTS += --with-jpeg
+LIBVIPS_CONF_OPTS += -Djpeg=enabled
 LIBVIPS_DEPENDENCIES += jpeg
 else
-LIBVIPS_CONF_OPTS += --without-jpeg
+LIBVIPS_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-LIBVIPS_CONF_OPTS += --with-lcms
+LIBVIPS_CONF_OPTS += -Dlcms=enabled
 LIBVIPS_DEPENDENCIES += lcms2
 else
-LIBVIPS_CONF_OPTS += --without-lcms
+LIBVIPS_CONF_OPTS += -Dlcms=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-LIBVIPS_CONF_OPTS += --with-png
+LIBVIPS_CONF_OPTS += -Dpng=enabled
 LIBVIPS_DEPENDENCIES += libpng
 else
-LIBVIPS_CONF_OPTS += --without-png
+LIBVIPS_CONF_OPTS += -Dpng=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-LIBVIPS_CONF_OPTS += --with-rsvg
+LIBVIPS_CONF_OPTS += -Drsvg=enabled
 LIBVIPS_DEPENDENCIES += librsvg
 else
-LIBVIPS_CONF_OPTS += --without-rsvg
+LIBVIPS_CONF_OPTS += -Drsvg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MATIO),y)
-LIBVIPS_CONF_OPTS += --with-matio
+LIBVIPS_CONF_OPTS += -Dmatio=enabled
 LIBVIPS_DEPENDENCIES += matio
 else
-LIBVIPS_CONF_OPTS += --without-matio
+LIBVIPS_CONF_OPTS += -Dmatio=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-LIBVIPS_CONF_OPTS += --with-orc
+LIBVIPS_CONF_OPTS += -Dorc=enabled
 LIBVIPS_DEPENDENCIES += orc
 else
-LIBVIPS_CONF_OPTS += --without-orc
+LIBVIPS_CONF_OPTS += -Dorc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER),y)
-LIBVIPS_CONF_OPTS += --with-poppler
+LIBVIPS_CONF_OPTS += -Dpoppler=enabled
 LIBVIPS_DEPENDENCIES += poppler
 else
-LIBVIPS_CONF_OPTS += --without-poppler
+LIBVIPS_CONF_OPTS += -Dpoppler=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-LIBVIPS_CONF_OPTS += --with-tiff
+LIBVIPS_CONF_OPTS += -Dtiff=enabled
 LIBVIPS_DEPENDENCIES += tiff
 else
-LIBVIPS_CONF_OPTS += --without-tiff
+LIBVIPS_CONF_OPTS += -Dtiff=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
-LIBVIPS_CONF_OPTS += --with-fftw
+LIBVIPS_CONF_OPTS += -Dfftw=enabled
 LIBVIPS_DEPENDENCIES += fftw-double
 else
-LIBVIPS_CONF_OPTS += --without-fftw
+LIBVIPS_CONF_OPTS += -Dfftw=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-LIBVIPS_CONF_OPTS += --with-libexif
+LIBVIPS_CONF_OPTS += -Dexif=enabled
 LIBVIPS_DEPENDENCIES += libexif
 else
-LIBVIPS_CONF_OPTS += --without-libexif
+LIBVIPS_CONF_OPTS += -Dexif=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBHEIF),y)
-LIBVIPS_CONF_OPTS += --with-heif
+LIBVIPS_CONF_OPTS += -Dheif=enabled
 LIBVIPS_DEPENDENCIES += libheif
 else
-LIBVIPS_CONF_OPTS += --without-heif
+LIBVIPS_CONF_OPTS += -Dheif=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-LIBVIPS_CONF_OPTS += --with-libwebp
+LIBVIPS_CONF_OPTS += -Dwebp=enabled
 LIBVIPS_DEPENDENCIES += webp
 else
-LIBVIPS_CONF_OPTS += --without-libwebp
+LIBVIPS_CONF_OPTS += -Dwebp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBVIPS_CONF_OPTS += --with-zlib
+LIBVIPS_CONF_OPTS += -Dzlib=enabled
 LIBVIPS_DEPENDENCIES += zlib
 else
-LIBVIPS_CONF_OPTS += --without-zlib
+LIBVIPS_CONF_OPTS += -Dzlib=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
