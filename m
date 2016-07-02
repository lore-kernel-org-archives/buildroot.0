From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:19:12 +0200
Subject: [Buildroot] [git commit] orangepipc: Accommodate U-Boot environment
	on SD-card
Message-ID: <20160702111923.C22517FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42c882ba21f72dcc9315a926eccc67587630704e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described by http://linux-sunxi.org/Bootable_SD_card#SD_Card_Layout

The space betweem 544KB..1MB is reserved / used for the u-boot environment,
so mark it as such to make sure genimage doesn't put other partitions here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepipc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/orangepi/orangepipc/genimage.cfg b/board/orangepi/orangepipc/genimage.cfg
index 1200d3b..932d81c 100644
--- a/board/orangepi/orangepipc/genimage.cfg
+++ b/board/orangepi/orangepipc/genimage.cfg
@@ -19,6 +19,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
+		size = 1040384 # 1MB - 8192
 	}
 
 	partition boot {
