From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 11:29:39 -0700
Subject: [Buildroot] [PATCH 2/3] fs/romfs: add depends on
 !BR2_PACKAGE_LIBSELINUX
In-Reply-To: <20200312182941.3322627-1-aduskett@gmail.com>
References: <20200312182941.3322627-1-aduskett@gmail.com>
Message-ID: <20200312182941.3322627-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

romfs does not support extended attributes (xattrs) needed for SELinux to
function.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 fs/romfs/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
index 84944a0fc0..055f5eedd7 100644
--- a/fs/romfs/Config.in
+++ b/fs/romfs/Config.in
@@ -1,4 +1,8 @@
 config BR2_TARGET_ROOTFS_ROMFS
 	bool "romfs root filesystem"
+	depends on !BR2_PACKAGE_LIBSELINUX
 	help
 	  Build a romfs image of the root filesystem.
+
+comment "romfs does not support SELinux"
+	depends on BR2_PACKAGE_LIBSELINUX
-- 
2.24.1
