From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:08:46 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] board/lego/ev3: fix max
 U-Boot flash size
Message-ID: <20190118130821.36CFB815A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7261302b49a5e4109cd10b45b496ff4fc91e28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The first stage bootloader on LEGO MINDSTORMS EV3 only loads the first
256K of the flash memory (this is hard-coded in an EEPROM). So, the
second stage bootloader (U-Boot) cannot exceed this size.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2e5014af5a4fe773b8bf1dd1a3fef31214eb4a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/lego/ev3/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 3da3048d8d..65d9714650 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -16,7 +16,7 @@ image flash.bin {
 	flashtype = "nor-16M-256"
 	partition uboot {
 		image = "u-boot.bin"
-		size = 320K
+		size = 256K
 	}
 	partition uimage {
 		image = "uImage.da850-lego-ev3"
