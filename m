From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 07:36:05 +0200
Subject: [Buildroot] [PATCH 1/4] board: raspberrypi: use regular kernel image
Message-ID: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since release 4.4 a kernel without a trailer is assumed to be device tree
capable. Since our Raspberry Pi defconfigs all use the newer firmware we can
just use the regular kernel image.

https://www.raspberrypi.org/documentation/configuration/device-tree.md

Tested on Raspberry Pi 3.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/raspberrypi/genimage-raspberrypi.cfg  | 2 +-
 board/raspberrypi/genimage-raspberrypi0.cfg | 2 +-
 board/raspberrypi/genimage-raspberrypi2.cfg | 2 +-
 board/raspberrypi/genimage-raspberrypi3.cfg | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
index 74758f5e25b7..bd5166a0f313 100644
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ b/board/raspberrypi/genimage-raspberrypi.cfg
@@ -9,7 +9,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
-      "kernel-marked/zImage"
+      "zImage"
     }
   }
   size = 32M
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
index a38840c829af..a9d4c4501fd9 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -7,7 +7,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
-      "kernel-marked/zImage"
+      "zImage"
     }
   }
   size = 32M
diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
index 443c821872f5..a3be2a34426e 100644
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ b/board/raspberrypi/genimage-raspberrypi2.cfg
@@ -7,7 +7,7 @@ image boot.vfat {
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
-      "kernel-marked/zImage"
+      "zImage"
     }
   }
   size = 32M
diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
index baab0c4cc108..3c9f1e5e2a22 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -8,7 +8,7 @@ image boot.vfat {
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
       "rpi-firmware/overlays",
-      "kernel-marked/zImage"
+      "zImage"
     }
   }
   size = 32M
-- 
2.11.0
