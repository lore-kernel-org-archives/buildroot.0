Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9828C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C0CC820F3;
	Tue, 24 Jan 2023 10:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0CC820F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrrG33fMXuQt; Tue, 24 Jan 2023 10:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8032D820F0;
	Tue, 24 Jan 2023 10:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8032D820F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4445D1BF25B
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 10:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE3F4183F
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 10:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE3F4183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhWyC0V8cnEJ for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 10:31:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A43E340147
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A43E340147
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 10:31:56 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKGan-0003RG-HF; Tue, 24 Jan 2023 13:31:53 +0300
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 13:31:49 +0300
Message-Id: <20230124103149.588288-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B62236D681D1FF9E641CABCF29B2C7FA9B182A05F5380850404D3E2407EE0C44955428D55B369BF6629B8C44354908299198FC28BEF35E6FFD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AE8B5BEC11030C2FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AA63211222797374EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEE22E25E1B69823DFDFB65E1DA2FBD19020879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CFE05210CFCCB54F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A51183377CF7F7E5B8B099166A693CB66E31EDD5FB173DD7A75A4FF58CDAEABE2AA132EA92956906CB697742550EFD07B03076C465858CA6B2
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B94C1DAF75C4D22E45455F37EE48F93089CB01C6B598BCE100E6FD4397C9BC7C4D67AB0ADE7D86E1D7E09C32AA3244CA6168E9DD37CD35074D2E11FE5CCCC4F35DA7DC5AF9B58C0927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FAjljcXCZbeYw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5B2D9C60DFCF2DC7D460B61C51A4F224698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=gKMqpbT6naPKIzfuieSWHO/O0CMzXF+VhbTpujAuxWw=; 
 t=1674556316;x=1674646316; 
 b=K5i/H8StXD085G7MdRBNlBAShPRx9BbTEo0kiXcQ37+bWMOrwj2NHnI+MpelOjMRaYQS5/ye5ZwhDs7ypGQMSJFMo9QQqOZJSNx23WKjFIKB3cirZlOcSIoVBC1nf5cicZzTbvnXrpINA9xbSJyYzjCg9gSVHPyVWVRE8/2M8gNKhuggzdwD3vugx3unWQq7/kIQdvUbWJrMI0WA4lpeRhoSIx7dMFaZRRgz+sLE+IKXKr5/9UJ5LZb/raK0kOZl7IZTFe2Z0Qc970LMp/nw6KQkRzJB5ioXhHegGd5/Doo+kvj/6OSuoI7kRmEAoMT0gz8m/0MV8Yv4c7fhnGBPvg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=K5i/H8St
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/gdal: switch to cmake build
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: dmrauh@posteo.de, Maxim Kochetkov <fido_max@inbox.ru>,
 himaralonso+buildroot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GDAL autoconf has wrong libgeotiff detection. It uses host's
library if installed instead of buildroot one.
Modern versions of gdal have no autoconf build scripts, just cmake only.

So move to cmake build variant.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15281
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/gdal/gdal.mk | 166 ++++++++++++++++++++++---------------------
 1 file changed, 85 insertions(+), 81 deletions(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 33e7ba724a..a777834083 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -12,6 +12,13 @@ GDAL_LICENSE_FILES = LICENSE.TXT
 GDAL_CPE_ID_VENDOR = osgeo
 GDAL_INSTALL_STAGING = YES
 GDAL_CONFIG_SCRIPTS = gdal-config
+GDAL_SUPPORTS_IN_SOURCE_BUILD=NO
+
+# Using 'make' with the Makefile generator will not work,
+# as it will try the GNUmakefile.
+# GNUmakefile and autoconf are dropped in 3.6 so may be dropped in future version.
+GDAL_MAKE_OPTS += -f Makefile
+
 # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
 # but since by default mrf driver support is enabled, it also needs
 # jpeg, libpng and zlib. By default there are also many other drivers
@@ -20,97 +27,94 @@ GDAL_CONFIG_SCRIPTS = gdal-config
 # respectively needed dependencies.
 GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
 
-# Yes, even though they have --with options, these few libraries are
+# Yes, even though they have DGDAL_USE, these few libraries are
 # mandatory. If we don't provide them, bundled versions are used.
 GDAL_CONF_OPTS = \
-	--with-geotiff \
-	--with-jpeg \
-	--with-libjson-c=$(STAGING_DIR)/usr \
-	--with-libtool \
-	--with-libz \
-	--with-png \
-	--with-proj \
-	--without-armadillo \
-	--without-blosc \
-	--without-brunsli \
-	--without-cfitsio \
-	--without-crypto \
-	--without-cryptopp \
-	--without-curl \
-	--without-dds \
-	--without-ecw \
-	--without-expat \
-	--without-exr \
-	--without-fgdb \
-	--without-freexl \
-	--without-geos \
-	--without-gnm \
-	--without-libkml \
-	--without-lz4 \
-	--without-gta \
-	--without-hdf4 \
-	--without-hdf5 \
-	--without-hdfs \
-	--without-heif \
-	--without-idb \
-	--without-jp2lura \
-	--without-java \
-	--without-jpeg12 \
-	--without-jxl \
-	--without-kakadu \
-	--without-kea \
-	--without-lerc \
-	--without-gif \
-	--without-liblzma \
-	--without-libdeflate \
-	--without-mongocxxv3 \
-	--without-mrsid \
-	--without-jp2mrsid \
-	--without-macosx-framework \
-	--without-msg \
-	--without-mysql \
-	--without-netcdf \
-	--without-null \
-	--without-oci \
-	--without-odbc \
-	--without-ogdi \
-	--without-opencl \
-	--without-openjpeg \
-	--without-pam \
-	--without-pcidsk \
-	--without-pcraster \
-	--without-pcre \
-	--without-pcre2 \
-	--without-pdfium \
-	--without-podofo \
-	--without-poppler \
-	--without-python \
-	--without-qhull \
-	--without-rasdaman \
-	--without-rasterlite2 \
-	--without-rdb \
-	--without-sfcgal \
-	--without-sosi \
-	--without-spatialite \
-	--without-sqlite3 \
-	--without-teigha \
-	--without-tiledb \
-	--without-webp \
-	--without-xerces \
-	--without-zstd
+	-DGDAL_USE_GEOTIFF=ON \
+	-DGDAL_USE_JPEG=ON \
+	-DGDAL_USE_JSONC=ON \
+	-DGDAL_USE_ZLIB=ON \
+	-DGDAL_USE_PNG=ON \
+	-DGDAL_USE_ARMADILLO=OFF \
+	-DGDAL_USE_BLOSC=OFF \
+	-DGDAL_USE_BRUNSLI=OFF \
+	-DGDAL_USE_CFITSIO=OFF \
+	-DGDAL_USE_OPENSSL=OFF \
+	-DGDAL_USE_CRYPTOPP=OFF \
+	-DGDAL_USE_CRNLIB=OFF \
+	-DGDAL_USE_CURL=OFF \
+	-DGDAL_USE_ECW=OFF \
+	-DGDAL_USE_EXPAT=OFF \
+	-DGDAL_USE_FILEGDB=OFF \
+	-DGDAL_USE_FREEXL=OFF \
+	-DGDAL_USE_GEOS=OFF \
+	-DGDAL_USE_LIBKML=OFF \
+	-DGDAL_USE_LZ4=OFF \
+	-DGDAL_USE_GTA=OFF \
+	-DGDAL_USE_HDF4=OFF \
+	-DGDAL_USE_HDF5=OFF \
+	-DGDAL_USE_HDFS=OFF \
+	-DGDAL_USE_HEIF=OFF \
+	-DGDAL_USE_IDB=OFF \
+	-DGDAL_USE_LURATECH=OFF \
+	-DGDAL_USE_JPEG12_INTERNAL=OFF \
+	-DGDAL_USE_JXL=OFF \
+	-DGDAL_USE_KDU=OFF \
+	-DGDAL_USE_KEA=OFF \
+	-DGDAL_USE_LERC=OFF \
+	-DGDAL_USE_GIF=OFF \
+	-DGDAL_USE_LIBLZMA=OFF \
+	-DGDAL_USE_DEFLATE=OFF \
+	-DGDAL_USE_MONGOCXX=OFF \
+	-DGDAL_USE_MRSID=OFF \
+	-DGDAL_USE_PUBLICDECOMPWT=OFF \
+	-DGDAL_USE_MYSQL=OFF \
+	-DGDAL_USE_NETCDF=OFF \
+	-DGDAL_USE_ORACLE=OFF \
+	-DGDAL_USE_ODBC=OFF \
+	-DGDAL_USE_OGDI=OFF \
+	-DGDAL_USE_OPENCL=OFF \
+	-DGDAL_USE_OPENEXR=OFF \
+	-DGDAL_USE_OPENJPEG=OFF \
+	-DGDAL_USE_PCRE=OFF \
+	-DGDAL_USE_PCRE2=OFF \
+	-DGDAL_USE_PDFIUM=OFF \
+	-DGDAL_USE_PODOFO=OFF \
+	-DGDAL_USE_POPPLER=OFF \
+	-DGDAL_USE_QHULL=OFF \
+	-DGDAL_USE_RASDAMAN=OFF \
+	-DGDAL_USE_RASTERLITE2=OFF \
+	-DGDAL_USE_RDB=OFF \
+	-DGDAL_USE_SFCGAL=OFF \
+	-DGDAL_USE_FYBA=OFF \
+	-DGDAL_USE_SPATIALITE=OFF \
+	-DGDAL_USE_SQLITE3=OFF \
+	-DGDAL_USE_TEIGHA=OFF \
+	-DGDAL_USE_TILEDB=OFF \
+	-DGDAL_USE_WEBP=OFF \
+	-DGDAL_USE_XERCESC=OFF \
+	-DGDAL_USE_ZSTD=OFF \
+	-DGDAL_ENABLE_DRIVER_PCIDSK=OFF \
+	-DGDAL_ENABLE_DRIVER_PCRASTER=OFF \
+	-DGDAL_ENABLE_DRIVER_NULL=OFF \
+	-DGDAL_ENABLE_MACOSX_FRAMEWORK=OFF \
+	-DENABLE_GNM=OFF \
+	-DENABLE_PAM=OFF \
+	-DBUILD_JAVA_BINDINGS=OFF \
+	-DBUILD_PYTHON_BINDINGS=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 GDAL_DEPENDENCIES += libxml2
-GDAL_CONF_OPTS += --with-xml2
+GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=ON
 else
-GDAL_CONF_OPTS += --without-xml2
+GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 GDAL_DEPENDENCIES += postgresql
-GDAL_CONF_OPTS += --with-pg
+GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
 else
-GDAL_CONF_OPTS += --without-pg
+GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
