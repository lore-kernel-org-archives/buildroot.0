From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 18:10:46 +0200
Subject: [Buildroot] [PATCH 3/5] libgeotiff: explicit optional dependencies
	on zlib and jpeg
In-Reply-To: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412871048-28981-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to provide consistent behavior, this commit explicits the
optional dependencies of libgeotiff on zlib and jpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgeotiff/libgeotiff.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 722e71c..61f5c21 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -10,4 +10,18 @@ LIBGEOTIFF_DEPENDENCIES = tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
 LIBGEOTIFF_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBGEOTIFF_DEPENDENCIES += zlib
+LIBGEOTIFF_CONF_OPTS += --with-zlib
+else
+LIBGEOTIFF_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBGEOTIFF_DEPENDENCIES += jpeg
+LIBGEOTIFF_CONF_OPTS += --with-jpeg
+else
+LIBGEOTIFF_CONF_OPTS += --without-jpeg
+endif
+
 $(eval $(autotools-package))
-- 
2.0.0
