From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:09:37 +0100
Subject: [Buildroot] [git commit] board/boundarydevices: fix boot partition
	number in bootscript
Message-ID: <20161107210944.714B68183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adf31efcd433712f546f2a3bcdb18abe650db27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was previously hardcoded to use the 1st partition although the
bootpart variable was used to download kernel/dtb from any partition.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/common/6x_bootscript.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/board/boundarydevices/common/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
index e8a08aa..2fc687a 100644
--- a/board/boundarydevices/common/6x_bootscript.txt
+++ b/board/boundarydevices/common/6x_bootscript.txt
@@ -92,14 +92,12 @@ fi
 
 setenv bootargs "${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc"
 
-bpart=1
-
 if test "sata" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
+	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
 elif test "usb" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
+	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
 else
-	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bpart}"
+	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bootpart}"
 fi
 
 if itest.s "x" != "x${disable_giga}" ; then
