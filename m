From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:26:03 +0100
Subject: [Buildroot] [git commit] package/libraw: add optional support for
	lcms2
Message-ID: <20160201224712.C981A7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40353e3e13e9b1c7ad95237fbc745f914bfa50ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also needs host-pkgconf]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 5ebc4a2..03f09f9 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -12,7 +12,6 @@ LIBRAW_INSTALL_STAGING = YES
 LIBRAW_AUTORECONF = YES
 LIBRAW_CONF_OPTS += \
 	--disable-examples \
-	--disable-lcms \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
@@ -33,4 +32,11 @@ else
 LIBRAW_CONF_OPTS += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBRAW_CONF_OPTS += --enable-lcms
+LIBRAW_DEPENDENCIES += lcms2 host-pkgconf
+else
+LIBRAW_CONF_OPTS += --disable-lcms
+endif
+
 $(eval $(autotools-package))
