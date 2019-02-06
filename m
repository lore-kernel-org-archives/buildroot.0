From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:11:38 +0100
Subject: [Buildroot] [git commit] system: allow selecting merged /usr along
 with custom rootfs skeleton
Message-ID: <20190206161331.A3A738121D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dd0a583510f72ef14b73e4fa2d44ff65febd833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the user is brave enough to use a custom rootfs skeleton then we must
not prevent using merged /usr too. Actually it is already possible to do
this, although indirectly, by selecting BR2_INIT_SYSTEMD.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 system/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 9941807e5d..498b56e222 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -31,10 +31,6 @@ config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	help
 	  Path to custom target skeleton.
 
-# dummy config so merged /usr workarounds can also be activated for
-# custom rootfs skeleton
-config BR2_ROOTFS_MERGED_USR
-
 endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
@@ -192,8 +188,6 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	help
 	  Support extended attributes handling in device tables
 
-if BR2_ROOTFS_SKELETON_DEFAULT
-
 config BR2_ROOTFS_MERGED_USR
 	bool "Use symlinks to /usr for /bin, /sbin and /lib"
 	help
@@ -206,6 +200,8 @@ config BR2_ROOTFS_MERGED_USR
 	  symlinks to their counterparts in /usr. In this case, /usr can
 	  not be a separate filesystem.
 
+if BR2_ROOTFS_SKELETON_DEFAULT
+
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
 	default y
