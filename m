From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2020 00:15:05 +0200
Subject: [Buildroot] [git commit branch/next] system: set default PATH
 according to BR2_ROOTFS_MERGED_USR
Message-ID: <20200816220853.C3C3D8214E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11654b1e9ef30764d5ea5330b1d0b7d9bb10fd8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use "/usr/bin:/usr/sbin" as the default path if BR2_ROOTFS_MERGED_USR
is enabled, otherwise use "/bin:/sbin:/usr/bin:/usr/sbin".

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 system/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 5063797976..b8b7c16529 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -402,7 +402,8 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
-	default "/bin:/sbin:/usr/bin:/usr/sbin"
+	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
 	help
 	  Sets the system's default PATH. It is being used in
 	  /etc/profile in the skeleton-init-common package and by some
