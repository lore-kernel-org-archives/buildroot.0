From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 23:34:36 +0100
Subject: [Buildroot] [PATCH/next v1 5/5] package/libcamera: add optional
 lttng-libust dependency
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <20201117223436.24036-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add optional lttng-libust support and enable tracing support
in case.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.29.2
