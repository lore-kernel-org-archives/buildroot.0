From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:19:15 +0100
Subject: [Buildroot] [PATCH 3/3] board/minnowboard: grub.cfg: disable eudev
 network interface renaming
In-Reply-To: <20210130101915.18423-1-peter@korsgaard.com>
References: <20210130101915.18423-1-peter@korsgaard.com>
Message-ID: <20210130101915.18423-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So the normal DHCP-on-eth0 logic works for the graphical defconfig where
eudev is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/minnowboard/grub.cfg b/board/minnowboard/grub.cfg
index 206f734f13..1f75f4d7ca 100644
--- a/board/minnowboard/grub.cfg
+++ b/board/minnowboard/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=PARTLABEL=rootfs rootwait console=tty0 console=ttyS0,115200
+	linux /bzImage root=PARTLABEL=rootfs rootwait console=tty0 console=ttyS0,115200 net.ifnames=0
 }
-- 
2.20.1
