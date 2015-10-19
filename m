From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 19 Oct 2015 17:02:32 +0200
Subject: [Buildroot] [PATCH 1/3] board/boundarydevices: update 6x_bootscript
	to use zImage
In-Reply-To: <1445266954-15149-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1445266954-15149-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1445266954-15149-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2015-September/139884.html

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.6.1
