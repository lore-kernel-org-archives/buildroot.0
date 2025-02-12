Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF1EC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B775071C;
	Fri, 28 Feb 2025 17:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQU2R0jv40P5; Fri, 28 Feb 2025 17:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46D425002D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D425002D;
	Fri, 28 Feb 2025 17:17:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20BA81DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B3642D44
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vorDuJrBIOy3 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D4645315
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D4645315
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A39D587AD6; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 23:25:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3fb075afad96a8d6f1877c0c2b202f61cb5993aa
X-Git-Newrev: 9ee7374098ca517c7d6e759121cfd4e225e64053
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.A39D587AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/beagleboard/beaglev_fire: cleanup gatewate update
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ee7374098ca517c7d6e759121cfd4e225e64053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the README following the update gateware fix and optimise the
script, making it easier for the user to use.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/beagleboard/beaglev_fire/README.txt          | 15 ++++---------
 .../usr/share/microchip/update-gateware.sh         | 25 ++++++++++++++--------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/README.txt b/board/beagleboard/beaglev_fire/README.txt
index c9a824b67f..18b6e761ea 100644
--- a/board/beagleboard/beaglev_fire/README.txt
+++ b/board/beagleboard/beaglev_fire/README.txt
@@ -108,12 +108,12 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   Unzip the downloaded artifacts.zip file.
 
   Go to the custom FPGA design directory:
-    'cd artifacts/bitstreams/my_custom_fpga_design'
+    'cd artifacts/bitstreams/my_custom_fpga_design/LinuxProgramming/'
 
   On your Linux host development computer, copy the bitstream to BeagleV-Fire
   board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
   system.
-    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/etc/'
+    'cp ./* /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/lib/firmware/'
 
   To apply these changes to your image, make sure to re-build it with:
     `make`
@@ -121,14 +121,7 @@ https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gate
   Then, re-flash your image - to ensure you have the necessary firmware files - by
   following the above section "Flashing the image to your eMMC".
 
-  On BeagleV-Fire,
-    1. Make your update gateware script executable
-      'chmod +x /usr/share/microchip/update-gateware.sh'
-    2. Create a firmware directory
-      'mkdir /lib/firmware'
-    3. Change to the directory of your gateware script
-      `cd /usr/share/microchip/`
-    3. initiate the reprogramming of the FPGA with your gateware bitstream:
-      './update-gateware.sh /etc/LinuxProgramming/'
+  On BeagleV-Fire initiate the reprogramming of the FPGA with your gateware bitstream:
+    `/usr/share/microchip/update-gateware.sh`
 
   Wait for a couple of minutes for the BeagleV-Fire to reprogram itself.
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
index 249c5bd260..6d92dec012 100755
--- a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -1,18 +1,25 @@
 #!/bin/sh
 
-if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+if [ $# -eq 0 ]; then
+    echo "No gateware location provided. Checking default location."
+    if [ ! -e /lib/firmware/mpfs_bitstream.spi ]; then
         echo "No gateware file found."
         exit 1
+    fi
+else
+    echo "Gateware location provided: $1"
+    if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+        echo "No gateware file found."
+        exit 1
+    else
+        if [ ! -d /lib/firmware ]; then
+            mkdir /lib/firmware
+        fi
+        cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
+        cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
+    fi
 fi
 
-if [ ! -d /lib/firmware ]
-then
-    mkdir /lib/firmware
-fi
-
-cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
-cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
-
 # Trash existing device tree overlay in case the rest of the process fails:
 flash_erase /dev/mtd0 0 16
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
