From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 20 Feb 2020 13:57:30 -0600
Subject: [Buildroot] [PATCH 2/2] package/nvidia-driver: bump version to
 390.132
In-Reply-To: <20200220195730.5011-1-vfazio@xes-inc.com>
References: <20200220195730.5011-1-vfazio@xes-inc.com>
Message-ID: <20200220195730.5011-2-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Zach Vargas <zvargas@xes-inc.com>

Support Linux kernel 5.4.

Change the 64bit download to exclude 32bit compatibility libs.

Signed-off-by: Zach Vargas <zvargas@xes-inc.com>
[vfazio: 64bit package change]
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Depends on http://patchwork.ozlabs.org/patch/1181847/

 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 79ac052610..7f2248d0f9 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 6f4af70ee3d03ed31c497a5d555164c56057b53ecedfc0d2c8de4b0b90728805  NVIDIA-Linux-x86-390.67.run
-sha256 6df2ca1a7420b6751bcaf257d321b14f4e5f7ca54d77a43514912a3792ece65a  NVIDIA-Linux-x86_64-390.67.run
+sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
+sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
 sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index b0ff277640..a13c0a88f4 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.67
+NVIDIA_DRIVER_VERSION = 390.132
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
-NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
+NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
 NVIDIA_DRIVER_LICENSE = NVIDIA Software License
 NVIDIA_DRIVER_LICENSE_FILES = LICENSE
 NVIDIA_DRIVER_REDISTRIBUTE = NO
-- 
2.25.1
