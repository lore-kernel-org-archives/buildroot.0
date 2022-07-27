Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C3C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBD34086B;
	Wed, 27 Jul 2022 13:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBD34086B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3_IgIKZvlY3; Wed, 27 Jul 2022 13:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4081A4086F;
	Wed, 27 Jul 2022 13:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4081A4086F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAC01BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5374040550
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5374040550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orAEJ09lFkbI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B26A74052F
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26A74052F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 95491865D4; Wed, 27 Jul 2022 13:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 14:53:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d48af707737ece6242d58e83b98e5c601fa55acc
X-Git-Newrev: 1e64fa2956171cdc9d6e6c8896b4b589ce573513
X-Patchwork-Hint: ignore
Message-Id: <20220727131040.95491865D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e64fa2956171cdc9d6e6c8896b4b589ce573513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GDAL is a translator library for raster and vector geospatial data
formats. As a library, it presents a single raster abstract data model
and single vector abstract data model to the calling application for all
supported formats. It also comes with a variety of useful command line
utilities for data translation and processing.

https://gdal.org/

test-pkg shows that this package is affected by binutils bug 27597.

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |   3 ++
 package/Config.in      |   1 +
 package/gdal/Config.in |  30 ++++++++++++
 package/gdal/gdal.hash |   6 +++
 package/gdal/gdal.mk   | 126 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 166 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 270fc52de1..8adbc420a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -752,6 +752,9 @@ F:	package/wireless-regdb/
 N:	Dominik Faessler <faessler@was.ch>
 F:	package/logsurfer/
 
+N:	Dominik Michael Rauh <dmrauh@posteo.de>
+F:	package/gdal/
+
 N:	Doug Kehn <rdkehn@gmail.com>
 F:	package/nss-pam-ldapd/
 F:	package/sp-oops-extract/
diff --git a/package/Config.in b/package/Config.in
index f039d83113..1711ee69a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1967,6 +1967,7 @@ menu "Other"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
+	source "package/gdal/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/gdal/Config.in b/package/gdal/Config.in
new file mode 100644
index 0000000000..55a8c7fb83
--- /dev/null
+++ b/package/gdal/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_GDAL
+	bool "gdal"
+	depends on BR2_INSTALL_LIBSTDCPP # proj, libjson
+	# configure can't find proj, when linking statically
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # proj
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGEOTIFF
+	select BR2_PACKAGE_LIBJSON
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_PROJ
+	select BR2_PACKAGE_ZLIB
+	help
+	  GDAL is a translator library for raster and vector geospatial
+	  data formats. As a library, it presents a single raster
+	  abstract data model and single vector abstract data model to
+	  the calling application for all supported formats. It also
+	  comes with a variety of useful command line utilities for data
+	  translation and processing.
+
+	  https://gdal.org/
+
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
new file mode 100644
index 0000000000..52bb60de35
--- /dev/null
+++ b/package/gdal/gdal.hash
@@ -0,0 +1,6 @@
+# md5 from: https://download.osgeo.org/gdal/3.5.1/gdal-3.5.1.tar.xz.md5, sha256 locally computed:
+md5  4b7981efbeed69c06c79fb65d0a60d83  gdal-3.5.1.tar.xz
+sha256  d12c30a9eacdeaab493c0d1c9f88eb337c9cbb5bb40744c751bdd5a5af166ab6  gdal-3.5.1.tar.xz
+
+# Hashes of license files:
+sha256  b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
new file mode 100644
index 0000000000..0d42037ad6
--- /dev/null
+++ b/package/gdal/gdal.mk
@@ -0,0 +1,126 @@
+################################################################################
+#
+# gdal
+#
+################################################################################
+
+GDAL_VERSION = 3.5.1
+GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
+GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
+GDAL_LICENSE = MIT, many others
+GDAL_LICENSE_FILES = LICENSE.TXT
+GDAL_INSTALL_STAGING = YES
+GDAL_CONFIG_SCRIPTS = gdal-config
+# gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
+# but since by default mrf driver support is enabled, it also needs
+# jpeg, libpng and zlib. By default there are also many other drivers
+# enabled but it seems, in contrast to mrf driver support, that they
+# can be implicitly disabled, by configuring gdal without their
+# respectively needed dependencies.
+GDAL_DEPENDENCIES = host-pkgconf jpeg libgeotiff libpng proj tiff zlib
+
+# Yes, even though they have --with options, these few libraries are
+# mandatory. If we don't provide them, bundled versions are used.
+GDAL_CONF_OPTS = \
+	--with-geotiff \
+	--with-jpeg \
+	--with-libjson-c \
+	--with-libtool \
+	--with-libz \
+	--with-png \
+	--with-proj \
+	--without-armadillo \
+	--without-blosc \
+	--without-brunsli \
+	--without-cfitsio \
+	--without-crypto \
+	--without-cryptopp \
+	--without-curl \
+	--without-dds \
+	--without-dods-root \
+	--without-ecw \
+	--without-expat \
+	--without-exr \
+	--without-fgdb \
+	--without-fme \
+	--without-freexl \
+	--without-geos \
+	--without-gnm \
+	--without-libkml \
+	--without-lz4 \
+	--without-grass \
+	--without-libgrass \
+	--without-gta \
+	--without-hdf4 \
+	--without-hdf5 \
+	--without-hdfs \
+	--without-heif \
+	--without-idb \
+	--without-ingres \
+	--without-jp2lura \
+	--without-jasper \
+	--without-java \
+	--without-jpeg12 \
+	--without-jxl \
+	--without-charls \
+	--without-kakadu \
+	--without-kea \
+	--without-lerc \
+	--without-gif \
+	--without-liblzma \
+	--without-libdeflate \
+	--without-mdb \
+	--without-mongocxx \
+	--without-mongocxxv3 \
+	--without-mrsid \
+	--without-jp2mrsid \
+	--without-macosx-framework \
+	--without-mrsid_lidar \
+	--without-msg \
+	--without-mysql \
+	--without-netcdf \
+	--without-null \
+	--without-oci \
+	--without-odbc \
+	--without-ogdi \
+	--without-opencl \
+	--without-openjpeg \
+	--without-pam \
+	--without-pcidsk \
+	--without-pcraster \
+	--without-pcre \
+	--without-pcre2 \
+	--without-pdfium \
+	--without-perl \
+	--without-podofo \
+	--without-poppler \
+	--without-python \
+	--without-qhull \
+	--without-rasdaman \
+	--without-rasterlite2 \
+	--without-rdb \
+	--without-sfcgal \
+	--without-sosi \
+	--without-spatialite \
+	--without-sqlite3 \
+	--without-teigha \
+	--without-tiledb \
+	--without-webp \
+	--without-xerces \
+	--without-zstd
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+GDAL_DEPENDENCIES += libxml2
+GDAL_CONF_OPTS += --with-xml2
+else
+GDAL_CONF_OPTS += --without-xml2
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+GDAL_DEPENDENCIES += postgresql
+GDAL_CONF_OPTS += --with-pg
+else
+GDAL_CONF_OPTS += --without-pg
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
