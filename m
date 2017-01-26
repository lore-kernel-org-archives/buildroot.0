From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 22:35:05 +0100
Subject: [Buildroot] [git commit] board: raspberrypi: use regular kernel
	image
Message-ID: <20170126214426.32BD1820EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a09c1990808908416b6435e24a2ee10d7b3d7d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since release 4.4 a kernel without a trailer is assumed to be device tree
capable. Since our Raspberry Pi defconfigs all use the newer firmware we can
just use the regular kernel image.

https://www.raspberrypi.org/documentation/configuration/device-tree.md

Tested on Raspberry Pi 3.

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi.cfg  | 2 +-
 board/raspberrypi/genimage-raspberrypi0.cfg | 2 +-
 board/raspberrypi/genimage-raspberrypi2.cfg | 2 +-
 board/raspberrypi/genimage-raspberrypi3.cfg | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
index 74758f5..bd5166a 100644
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
index a38840c..a9d4c45 100644
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
index 443c821..a3be2a3 100644
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
index baab0c4..3c9f1e5 100644
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
