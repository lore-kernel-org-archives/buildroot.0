From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 15:59:38 +0100
Subject: [Buildroot] [git commit] fs/ext2: default to ext2 rev1
Message-ID: <20161214150003.6AAAA81E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=219d0b5db2b9f36c34d750e5c3567f9002eed9db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rev0 is very old (E.G. from before Linux was maintained in git), the kernel
prints a scary warning when used:

EXT4-fs warning (device sda): ext4_update_dynamic_rev:746: updating to rev 1
because of new feature flag, running e2fsck is recommended

And rev0 support is broken in u-boot 2016.11:
http://lists.denx.de/pipermail/u-boot/2016-December/275916.html

So default to rev1 instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 1e7f719..b8eeed2 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -11,7 +11,7 @@ config BR2_TARGET_ROOTFS_EXT2_2
 
 choice
 	bool "ext2/3/4 variant"
-	default BR2_TARGET_ROOTFS_EXT2_2r0
+	default BR2_TARGET_ROOTFS_EXT2_2r1
 
 config BR2_TARGET_ROOTFS_EXT2_2r0
 	bool "ext2 (rev0)"
