From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 22:03:00 +0100
Subject: [Buildroot] [PATCH] board/ci20/genimage.cfg: drop hardcoded rootfs
 partition size
Message-ID: <20200121210301.28973-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As recently reported to the list:
http://lists.busybox.net/pipermail/buildroot/2020-January/271937.html

The hardcoded rootfs partition size can lead to hard to understand build
failures if more packages are added.

So drop the hardcoded partition size.  Genimage will then size the partition
to match the size of the rootfs image (which by default is also 60MB for ext4).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/ci20/genimage.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/ci20/genimage.cfg b/board/ci20/genimage.cfg
index fa3e7368d3..5f8a16c610 100644
--- a/board/ci20/genimage.cfg
+++ b/board/ci20/genimage.cfg
@@ -24,6 +24,5 @@ image sdcard.img {
         partition-type = 0x83
         image = "rootfs.ext4"
         offset = 2M
-        size = 60M
     }
 }
-- 
2.20.1
