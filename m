From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 19 Apr 2017 14:32:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/nvidia-driver: add glesv2.pc
In-Reply-To: <20170419123214.18835-1-bernd.kuhls@t-online.de>
References: <20170419123214.18835-1-bernd.kuhls@t-online.de>
Message-ID: <20170419123214.18835-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc needs glesv2.pc to detect libgles support.

Fixes
http://autobuild.buildroot.net/results/03c/03cbabacf3f2d665266b468c4ffcd1a1ea1b31af/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nvidia-driver/glesv2.pc        | 10 ++++++++++
 package/nvidia-driver/nvidia-driver.mk |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 package/nvidia-driver/glesv2.pc

diff --git a/package/nvidia-driver/glesv2.pc b/package/nvidia-driver/glesv2.pc
new file mode 100644
index 000000000..273f47db3
--- /dev/null
+++ b/package/nvidia-driver/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: Nvidia OpenGL ES library
+Version: 10.4.2
+Libs: -L${libdir} -lGLESv1_CM
+Cflags: -I${includedir}/GLES  -DMESA_EGL_NO_X11_HEADERS
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 2e72cceb8..f54a07ca6 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -78,6 +78,7 @@ define NVIDIA_DRIVER_INSTALL_GL_DEV
 	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
 	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+	$(INSTALL) -D -m 0644 package/nvidia-driver/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
 endef
 
 # Those libraries are 'private' libraries requiring an agreement with
-- 
2.11.0
