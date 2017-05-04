From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:14:39 +0200
Subject: [Buildroot] [git commit] package/nvidia-driver: bump version to
	381.09
Message-ID: <20170504212140.970AB828BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47ef5def00f5d991dafe53a6eb6566147124444e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnvidia-egl-wayland.so was renamed in upstream archive.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 04a44b8..7fa729e 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 cc79d3ac2b688009ed2e47a1cf27557aea5dd745b3b6e9b83945c359ddab4335  NVIDIA-Linux-x86-375.20.run
-sha256 d10e40a19dc57ac958567a2b247c2b113e5f1e4186ad48e9a58e70a46d07620b  NVIDIA-Linux-x86_64-375.20.run
+sha256 c39805e6610f710d16acf57c9d09cb5504d33c557e634e632079d46f18da4268  NVIDIA-Linux-x86-381.09.run
+sha256 04ec99f6d621adc464314adc82a92009e071a301a773487df7f460333e04e98c  NVIDIA-Linux-x86_64-381.09.run
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 6ed7d52..d8dedd9 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 375.20
+NVIDIA_DRIVER_VERSION = 381.09
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
@@ -58,7 +58,7 @@ NVIDIA_DRIVER_LIBS_GLES = \
 
 NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-egl-wayland.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-egl-wayland.so.1.0.1 \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
 	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
