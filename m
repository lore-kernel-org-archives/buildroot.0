From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 14:11:43 +0200
Subject: [Buildroot] [git commit] nilfs-utils: drop NPTL dependency
Message-ID: <20180927121256.A358388F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64673d4cfb7fd33f99e94eec3c7d4118278b2cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
