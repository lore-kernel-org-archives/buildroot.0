From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 22 Oct 2019 12:51:24 -0300
Subject: [Buildroot] [PATCH] package/util-linux: make wipefs depend on
 BR2_USE_MMU
Message-ID: <20191022155124.29479-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

It depends on libblkid and libsmartcols, which use fork().

Fixes:
  http://autobuild.buildroot.net/results/82f9712bc90377c625caeb5b175e83a03d5b9d75/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3c64a19d84..3609da79ad 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -409,6 +409,7 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 
 config BR2_PACKAGE_UTIL_LINUX_WIPEFS
 	bool "wipefs"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
-- 
2.18.1
