From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:13:08 +0200
Subject: [Buildroot] [git commit] package/nvidia-driver: bump version to
 390.67
Message-ID: <20180610121110.895F588071@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc864a5b55577bfdaf7823e052bab9a22a576604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, adjusted upstream library names.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvidia-driver/nvidia-driver.hash |  5 +++--
 package/nvidia-driver/nvidia-driver.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index e05b8f04d5..79ac052610 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256 3b70587582220ab1102bcb8386f206f89e6b146856af41f16eaa5910e54ef8fd  NVIDIA-Linux-x86-384.69.run
-sha256 a7b7984fc532be17c262bc4353e279824ae63625d8ae9f1016cb66d199b97650  NVIDIA-Linux-x86_64-384.69.run
+sha256 6f4af70ee3d03ed31c497a5d555164c56057b53ecedfc0d2c8de4b0b90728805  NVIDIA-Linux-x86-390.67.run
+sha256 6df2ca1a7420b6751bcaf257d321b14f4e5f7ca54d77a43514912a3792ece65a  NVIDIA-Linux-x86_64-390.67.run
+sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 404fa881ec..a595aed4f7 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 384.69
+NVIDIA_DRIVER_VERSION = 390.67
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
@@ -46,19 +46,19 @@ NVIDIA_DRIVER_LIBS_GL = \
 	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_EGL = \
-	libEGL.so.1 \
+	libEGL.so.1.1.0 \
 	libGLdispatch.so.0 \
 	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_GLES = \
-	libGLESv1_CM.so.1 \
-	libGLESv2.so.2 \
+	libGLESv1_CM.so.1.2.0 \
+	libGLESv2.so.2.1.0 \
 	libGLESv1_CM_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
 	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-egl-wayland.so.1.0.1 \
+	libnvidia-egl-wayland.so.1.0.2 \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
 	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
