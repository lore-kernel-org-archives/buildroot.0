From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:19:12 +0200
Subject: [Buildroot] [git commit] pcduino: Accommodate U-Boot environment on
	SD-card
Message-ID: <20160702111923.DB1697FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc0eab7d1d4889200c7ebc6b3b7141d0b791ad91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described by http://linux-sunxi.org/Bootable_SD_card#SD_Card_Layout

The space betweem 544KB..1MB is reserved / used for the u-boot environment,
so mark it as such to make sure genimage doesn't put other partitions here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/linksprite/pcduino/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/linksprite/pcduino/genimage.cfg b/board/linksprite/pcduino/genimage.cfg
index 0ff0434..9cbc383 100644
--- a/board/linksprite/pcduino/genimage.cfg
+++ b/board/linksprite/pcduino/genimage.cfg
@@ -25,6 +25,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
+		size = 1040384 # 1MB - 8192
 	}
 
 	partition boot {
