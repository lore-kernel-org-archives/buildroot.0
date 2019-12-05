From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:16 +0000
Subject: [Buildroot] [PATCH v1 29/30] package/mesa3d: Add host package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-30-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/mesa3d/mesa3d.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fff498e777..1c0c592f61 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -13,6 +13,23 @@ MESA3D_LICENSE_FILES = docs/license.html
 
 MESA3D_INSTALL_STAGING = YES
 
+HOST_MESA3D_DEPENDENCIES += \
+	host-libdrm \
+	host-libxcb \
+	host-xlib_libX11 \
+	host-xlib_libXext \
+	host-xlib_libXfixes \
+	host-xlib_libXrandr \
+	host-xorgproto
+
+HOST_MESA3D_CONF_OPTS = \
+	-Dplatforms=x11 \
+	-Dgles2=true \
+	-Dglx=xlib \
+	-Dgallium-drivers= \
+	-Dvulkan-drivers= \
+	-Ddri-drivers=
+
 MESA3D_PROVIDES =
 
 MESA3D_DEPENDENCIES = \
@@ -242,3 +259,4 @@ MESA3D_CONF_OPTS += -Dlmsensors=false
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.20.1
