From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Sep 2018 20:20:45 +0200
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: drop NPTL dependency
In-Reply-To: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
Message-ID: <20180926182045.28484-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nilfs-utils/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index e245dc4656..7b239b1af5 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
 	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -12,7 +11,6 @@ config BR2_PACKAGE_NILFS_UTILS
 
 	  https://github.com/nilfs-dev/nilfs-utils
 
-comment "nilfs-utils needs a toolchain w/ threads, NPTL"
+comment "nilfs-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.17.1
