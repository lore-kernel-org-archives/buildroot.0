From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu,  4 Jan 2018 11:10:51 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
Message-ID: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nilfs-utils use clock_nanosleep(), which comes with NPTL threads

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/nilfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index 0c6b7a0..9dda27c 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-- 
1.8.5.rc3
