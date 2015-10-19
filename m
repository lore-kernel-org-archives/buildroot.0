From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:33:36 +0200
Subject: [Buildroot] [git commit] board/boundarydevices: update
	6x_bootscript to use zImage
Message-ID: <20151019203344.6C4A97FDA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2367a9966185af44efe6baa0cc68bb4989c0901c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2015-September/139884.html

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript.txt |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript.txt b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
index 694a9b6..4a9be0b 100644
--- a/board/boundarydevices/nitrogen6x/6x_bootscript.txt
+++ b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
@@ -1,7 +1,7 @@
 setenv bootargs ''
 
 a_script=0x10800000
-a_uImage=0x10800000
+a_zImage=0x10800000
 a_fdt=0x13000000
 
 setenv initrd_high 0xffffffff
@@ -20,7 +20,7 @@ if itest.s "x" == "x${dtbname}" ; then
 			dtbname=imx6sx-${board}-m4.dtb;
 		fi
 		a_script=0x80800000
-		a_uImage=0x80800000
+		a_zImage=0x80800000
 		a_fdt=0x83000000
 	else
 		dtbname=imx6q-${board}.dtb;
@@ -125,7 +125,7 @@ if itest.s "x" != "x${show_env}" ; then
 	printenv
 fi
 
-if load ${dtype} ${disk}:${bootpart} ${a_uImage} ${bootdir}/uImage ; then
-	bootm ${a_uImage} - ${a_fdt}
+if load ${dtype} ${disk}:${bootpart} ${a_zImage} ${bootdir}/zImage ; then
+	bootz ${a_zImage} - ${a_fdt}
 fi
 echo "Error loading kernel image"
