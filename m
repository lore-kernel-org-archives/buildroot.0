From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 00:15:55 +0200
Subject: [Buildroot] [git commit] target/iso9660: needs a linux kernel
Message-ID: <20090726221821.92C5A777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4311822b14c1634e3f408e0f5a90f716a3bb64f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #403.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    1 +
 target/iso9660/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2e1ccd1..ebea17b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,6 +22,7 @@
 	#391: gstreamer: Bump version to 0.10.23
 	#393: gst-plugins-base: Bump version to 0.10.23
 	#395: gst-plugins-bad: New package
+	#403: Error while building iso9660 image
 	#409: Bump php package to 5.2.10
 	#411: ipsec-tools: Bump version to 0.7.2
 	#417: New package spawn-fcgi
diff --git a/target/iso9660/Config.in b/target/iso9660/Config.in
index 6c580d8..0b82063 100644
--- a/target/iso9660/Config.in
+++ b/target/iso9660/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on BR2_i386
+	depends on !BR2_KERNEL_none
 	select BR2_TARGET_ROOTFS_EXT2
 	select BR2_TARGET_GRUB
 	select BR2_HOST_FAKEROOT
@@ -16,3 +17,6 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	depends on BR2_TARGET_ROOTFS_ISO9660
 	default "target/iso9660/menu.lst"
+
+comment "iso image requires a Linux kernel to be built"
+	depends on BR2_i386 && BR2_KERNEL_none
-- 
1.6.3.3
