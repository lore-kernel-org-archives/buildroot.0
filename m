From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:06:20 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] board/raspberrypi: fix
 rpi4/rpi4-64 genimage config files
Message-ID: <20200722085626.182AB880B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47da3f925b1e7526dee2e6c5c67c2d3bc75460a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Since commit 'package/rpi-firmware: fix startup file names' ([1]) the
start and fixup file names are normalized to start.elf/fixup.dat,
adjust the rpi4 genimage config files accordingly.

Fixes:

  ERROR: file(rpi-firmware/fixup4.dat): stat(.../images/rpi-firmware/fixup4.dat) failed: No such file or directory
  ERROR: vfat(boot.vfat): could not setup rpi-firmware/fixup4.dat

[1] https://git.buildroot.net/buildroot/commit/?id=1bdc0334ff6273761b2e7fda730cdcc7e1f46862

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 59c3426c5197fc2df1c8307543ed54edbb22f595)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi4-64.cfg | 4 ++--
 board/raspberrypi/genimage-raspberrypi4.cfg    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
index 3c480e98f0..854e0c7e31 100644
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup4.dat",
-      "rpi-firmware/start4.elf",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
index 4e4742f3ef..60e1f23bcc 100644
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup4.dat",
-      "rpi-firmware/start4.elf",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
