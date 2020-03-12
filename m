From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 11:29:40 -0700
Subject: [Buildroot] [PATCH 3/3] fss/yaffs2: add depends on
 !BR2_PACKAGE_LIBSELINUX
In-Reply-To: <20200312182941.3322627-1-aduskett@gmail.com>
References: <20200312182941.3322627-1-aduskett@gmail.com>
Message-ID: <20200312182941.3322627-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

yaffs2 does not support extended attributes (xattrs) needed for SELinux to
function.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 fs/yaffs2/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/yaffs2/Config.in b/fs/yaffs2/Config.in
index 27da4ba638..99c25c4066 100644
--- a/fs/yaffs2/Config.in
+++ b/fs/yaffs2/Config.in
@@ -1,4 +1,8 @@
 config BR2_TARGET_ROOTFS_YAFFS2
 	bool "yaffs2 root filesystem"
+	depends on !BR2_PACKAGE_LIBSELINUX
 	help
 	  Build a yaffs2 root filesystem
+
+comment "yaffs2 does not support SELinux"
+	depends on BR2_PACKAGE_LIBSELINUX
-- 
2.24.1
