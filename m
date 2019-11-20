From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:43 +0000
Subject: [Buildroot] [RFC PATCH v3 29/30] package/mesa3d: Add host package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-30-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/mesa3d/mesa3d.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6e7fa7692c..75e19fbfb8 100644
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
