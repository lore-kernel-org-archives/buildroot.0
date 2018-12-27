From: David Lechner <david@lechnology.com>
Date: Thu, 27 Dec 2018 13:53:04 -0600
Subject: [Buildroot] [PATCH 2/3] board/lego/ev3: fix max U-Boot flash size
In-Reply-To: <20181227195305.5329-1-david@lechnology.com>
References: <20181227195305.5329-1-david@lechnology.com>
Message-ID: <20181227195305.5329-3-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first stage bootloader on LEGO MINDSTORMS EV3 only loads the first
256K of the flash memory (this is hard-coded in an EEPROM). So, the
second stage bootloader (U-Boot) cannot exceed this size.

Signed-off-by: David Lechner <david@lechnology.com>
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
-- 
2.17.1
