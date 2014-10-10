From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Oct 2014 08:36:09 +0200
Subject: [Buildroot] [git commit] libgeotiff: explicit optional dependencies
	on zlib and jpeg
Message-ID: <20141010100415.94EDEB1D2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ec261b3a9a123e6f384ab30f89689f2cf90003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to provide consistent behavior, this commit explicits the
optional dependencies of libgeotiff on zlib and jpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeotiff/libgeotiff.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

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
