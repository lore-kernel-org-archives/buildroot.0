From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:57:51 +0100
Subject: [Buildroot] [git commit] package/libcamera: add optional
 lttng-libust dependency
Message-ID: <20210119213844.9187280845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cab81477dcd4450e2c56464155f7296b495ef7ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional lttng-libust support and enable tracing support
in case.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index aed5c6e83c..ae074c2893 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -18,7 +18,6 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
 	-Dtest=false \
-	-Dtracing=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
@@ -86,4 +85,11 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCAMERA_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
+LIBCAMERA_CONF_OPTS += -Dtracing=enabled
+LIBCAMERA_DEPENDENCIES += lttng-libust
+else
+LIBCAMERA_CONF_OPTS += -Dtracing=disabled
+endif
+
 $(eval $(meson-package))
