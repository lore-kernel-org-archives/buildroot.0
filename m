From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 23:25:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: bump version
In-Reply-To: <cover.1457907876.git.yann.morin.1998@free.fr>
References: <cover.1457907876.git.yann.morin.1998@free.fr>
Message-ID: <8ddd3062cb5b95d9922760d6a86541ced163d627.1457907876.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and ditch an upstreamed patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ting-type-qualifiers-errors-when-building.patch | 23 ----------------------
 package/rpi-userland/rpi-userland.mk               |  2 +-
 2 files changed, 1 insertion(+), 24 deletions(-)
 delete mode 100644 package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch

diff --git a/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
deleted file mode 100644
index 4db6014..0000000
--- a/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix conflicting type qualifiers errors when building with musl.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- host_applications/linux/apps/raspicam/RaspiVidYUV.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/host_applications/linux/apps/raspicam/RaspiVidYUV.c b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
-index b340d63c913f..13e6a6ccf5bf 100644
---- a/host_applications/linux/apps/raspicam/RaspiVidYUV.c
-+++ b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
-@@ -106,8 +106,6 @@ const int ABORT_INTERVAL = 100; // ms
- /// Run/record forever
- #define WAIT_METHOD_FOREVER        4
- 
--extern FILE *stderr, *stdout;
--
- int mmal_status_to_int(MMAL_STATUS_T status);
- static void signal_handler(int signal_number);
- 
--- 
-1.9.1
-
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index fbf6fb4..c0a0186 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8306b7c757f4b8e8d9148789eeb64c666d9244a5
+RPI_USERLAND_VERSION = 8369e390999f4a7c3bc57e577247e0dd502c51f7
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.9.1
