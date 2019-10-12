From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 17:33:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump version to
 390.129 (x86)/435.21 (x86_64)
Message-ID: <20191012153356.10045-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest 32bit version is 390.129:
https://www.nvidia.com/en-gb/drivers/unix/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 79ac052610..8377f0a61e 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 6f4af70ee3d03ed31c497a5d555164c56057b53ecedfc0d2c8de4b0b90728805  NVIDIA-Linux-x86-390.67.run
-sha256 6df2ca1a7420b6751bcaf257d321b14f4e5f7ca54d77a43514912a3792ece65a  NVIDIA-Linux-x86_64-390.67.run
+sha256 5854268c26f112a16c6fd7ded0031bf95cc8f4dab617ac5d701090fec19d6f36  NVIDIA-Linux-x86-390.129.run
+sha256 fac7c02ccd35c7043f4e1add0224a7380d0bd1e4aa15ca6bc3012c758ec1776c  NVIDIA-Linux-x86_64-435.21.run
 sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index baf2ba2be5..056f39abea 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.67
-NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
+ifeq ($(BR2_i386),y)
+NVIDIA_DRIVER_VERSION = 390.129
+else
+NVIDIA_DRIVER_VERSION = 435.21
+NVIDIA_DRIVER_SUFFIX = _64
+endif
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
 NVIDIA_DRIVER_LICENSE = NVIDIA Software License
-- 
2.20.1
