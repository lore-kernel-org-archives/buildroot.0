From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue,  7 Jun 2016 10:58:01 -0300
Subject: [Buildroot] [PATCH] configs/beaglebone: Add missing genimage.cfg
	file
Message-ID: <1465307881-2101-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7d0b7d3c27a6 ("configs/beaglebone: Use genimage
to produce the SD card image") introduce genimage usage,
but forgot to add the genimage config file. Fix it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/beaglebone/genimage.cfg | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 board/beaglebone/genimage.cfg

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
new file mode 100644
index 000000000000..0c29a804d53b
--- /dev/null
+++ b/board/beaglebone/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-bone.dtb",
+			"am335x-boneblack.dtb"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
-- 
2.7.0
