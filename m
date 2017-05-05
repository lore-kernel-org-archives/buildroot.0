From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 21:42:20 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] nvidia-driver: use
	http:// instead of ftp://
Message-ID: <20170505194757.21CB97FF19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09fd512c8a15f157ee38597c67488e21f10d1117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the download, which currently times out on ftp://.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2068c7c6a810cdaf55240faf15c226ce3b308f1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/nvidia-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index cb9b7fa..20beec8 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -6,7 +6,7 @@
 
 NVIDIA_DRIVER_VERSION = 375.20
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
-NVIDIA_DRIVER_SITE = ftp://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
 NVIDIA_DRIVER_LICENSE = NVIDIA Software License
 NVIDIA_DRIVER_LICENSE_FILES = LICENSE
