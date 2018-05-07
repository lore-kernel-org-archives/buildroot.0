From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  7 May 2018 11:44:31 -0300
Subject: [Buildroot] [PATCH v3 5/5] system: allow selecting merged /usr
 along with custom rootfs skeleton
In-Reply-To: <20180507144431.14488-1-casantos@datacom.ind.br>
References: <20180507144431.14488-1-casantos@datacom.ind.br>
Message-ID: <20180507144431.14488-6-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the user is brave enough to use a custom rootfs skeleton then we must
not prevent using merged /usr too. Actually it is already possible to do
this, although indirectly, by selecting BR2_INIT_SYSTEMD.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:

- Rebase series to HEAD of master branch
---
 system/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index d14a864ca5..911cd424ba 100644
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
@@ -209,8 +205,6 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	help
 	  Support extended attributes handling in device tables
 
-if BR2_ROOTFS_SKELETON_DEFAULT
-
 config BR2_ROOTFS_MERGED_USR
 	bool "Use symlinks to /usr for /bin, /sbin and /lib"
 	help
@@ -223,6 +217,8 @@ config BR2_ROOTFS_MERGED_USR
 	  symlinks to their counterparts in /usr. In this case, /usr can
 	  not be a separate filesystem.
 
+if BR2_ROOTFS_SKELETON_DEFAULT
+
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
 	default y
-- 
2.14.3
