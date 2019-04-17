From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 22:46:57 +0200
Subject: [Buildroot] [git commit] board/freescale: single T1xxx/2xxx
 readme.txt
Message-ID: <20190417204710.AF1FA8F015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a12ea24aeddffe85ef898810f3025bf4dbee4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The readme.txt would contain similar content for either processor
family, so this patch consolidates the usage and adds the new
T2080 notes.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../{t1040d4rdb => t1040_t2080}/readme.txt         | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/board/freescale/t1040d4rdb/readme.txt b/board/freescale/t1040_t2080/readme.txt
similarity index 55%
rename from board/freescale/t1040d4rdb/readme.txt
rename to board/freescale/t1040_t2080/readme.txt
index 04d6b01531..65695295f6 100644
--- a/board/freescale/t1040d4rdb/readme.txt
+++ b/board/freescale/t1040_t2080/readme.txt
@@ -4,8 +4,12 @@ release notes for reflashing.
 
 To program the kernel and rootfs created by buildroot into the flash. The
 fast way is to tftp transfer the files via one of the network interfaces.
-Make sure your devkit has ipaddr and serverip defined to reach your tftp
-server.
+Make sure your devkit has ipaddr, netmask, and serverip defined to reach your
+tftp server. Verify bootargs are reasonable (console=ttyS0,115200).
+
+------------------------------------------------------------------------------
+
+Devkit: T1040RDB
 
 (Assuming the default u-boot env from NXP)
 1. Program the DTB to NOR flash
@@ -22,3 +26,26 @@ server.
     => boot
 
     You can login with user "root".
+------------------------------------------------------------------------------
+
+Devkit: T2080 QDS or RDB
+
+(Assuming the default u-boot env from NXP)
+1. Netboot the kernel/rootfs/dtb
+
+    => tftp 0x1000000 uImage && tftp 0x2000000 rootfs.cpio.uboot
+
+    RDB => tftp 0x3000000 t2080rdb.dtb
+     or
+    QDS => tftp 0x3000000 t2080qds.dtb
+
+2. Booting your new system
+
+    => bootm 0x1000000 0x2000000 0x3000000
+
+    You can login with user "root".
+
+3. If flashing is desired, a similar approach to the T1040 can be followed
+   with updated addresses for the flash layout.  Example is in the NXP default
+   env.
+------------------------------------------------------------------------------
