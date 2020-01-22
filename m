From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:50:02 +0100
Subject: [Buildroot] [git commit] board/ci20/genimage.cfg: drop hardcoded
 rootfs partition size
Message-ID: <20200122194112.0E00C836E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d1967422170b73ed7401eeb142a6b7a541dbec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
