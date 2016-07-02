From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:19:12 +0200
Subject: [Buildroot] [git commit] a20_ollinuxino: Accommodate U-Boot
	environment on SD-card
Message-ID: <20160702111923.E991A8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1034c11efbc2c6a1c0aa2d5e60db3093e4ad4b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described by http://linux-sunxi.org/Bootable_SD_card#SD_Card_Layout

The space betweem 544KB..1MB is reserved / used for the u-boot environment,
so mark it as such to make sure genimage doesn't put other partitions here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/olimex/a20_olinuxino/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
index 8ea24cc..fc2f7f8 100644
--- a/board/olimex/a20_olinuxino/genimage.cfg
+++ b/board/olimex/a20_olinuxino/genimage.cfg
@@ -6,6 +6,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
+		size = 1040384 # 1MB - 8192
 	}
 
 	partition rootfs {
