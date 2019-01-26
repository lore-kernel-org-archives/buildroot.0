From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Fri, 25 Jan 2019 19:19:01 -0500
Subject: [Buildroot] [PATCH] initramfs: drop comment against multiple formats
Message-ID: <20190126001901.3090-1-vivien.didelot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes an old comment against having multiple filesystem
formats which doesn't bring any value.

It is also wrong per-se: one may want to use Buildroot to prepare a
custom distribution containing a kernel+initramfs and a persistent
default rootfs to pivot to.

Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
---
 fs/initramfs/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index 9d5a3f92e6..42a9d60524 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -13,10 +13,5 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  is used, regardless of how buildroot's cpio archive is
 	  configured.
 
-	  Note that enabling initramfs together with another filesystem
-	  formats doesn't make sense: you would end up having two
-	  identical root filesystems, one embedded inside the kernel
-	  image, and one separately.
-
 comment "initramfs needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
-- 
2.20.1
