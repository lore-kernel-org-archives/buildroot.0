From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:32:50 +0100
Subject: [Buildroot] [git commit] boards/raspberrypi: update readme with
	RPi-2 specifics
Message-ID: <20150308173258.A5BFD807AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97aaf8b7a27afc87b2fa62197869c3790325147b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RPi-2 has its own DTB, so document it in the list of generated
files.

Also, not all DTBs need to be present on the boot partition, so add a
comment that identifies which should be copied for each model.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/readme.txt |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 9bab374..b513ca3 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -62,8 +62,9 @@ After building, you should obtain this tree:
     output/images/
     +-- rootfs.tar                              [0]
     +-- rpi-firmware/
-    |   +-- bcm2708-rpi-b.dtb                   [1]
-    |   +-- bcm2708-rpi-b-plus.dtb              [1]
+    |   +-- bcm2708-rpi-b.dtb
+    |   +-- bcm2708-rpi-b-plus.dtb
+    |   +-- bcm2709-rpi-2-b.dtb
     |   +-- bootcode.bin
     |   +-- config.txt
     |   +-- fixup.dat
@@ -73,10 +74,6 @@ After building, you should obtain this tree:
 [0] Note for Volatile: rootfs.tar will only be there if you kept
     "tar the root filesystem" option selected in "Filesystem images".
 
-[1] The DTBs (Device Tree Blobs) will only be present if you setup
-    Buildroot to install the DTBs from the rpi-firmware package, and
-    will only be used if your kernel has support for the Device Tree.
-
 Prepare you SDCard
 ==================
 
@@ -104,15 +101,18 @@ Install the binaries to the SDCard
 At the root of the boot partition, the Raspberry Pi must find the following
 files:
 
-    * bcm2708-rpi-b.dtb         [2]
+    * bcm2708-rpi-b.dtb         [1]
     * bcm2708-rpi-b-plus.dtb    [2]
+    * bcm2709-rpi-2-b.dtb       [3]
     * bootcode.bin
     * config.txt
     * fixup.dat
     * start.elf
     * zImage
 
-[2] Only needed if your kernel has support for the Device Tree.
+[1] For models A and B
+[2] For models A+ and B+
+[3] For model 2
 
 For example:
 
