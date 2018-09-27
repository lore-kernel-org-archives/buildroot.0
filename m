From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 13:59:56 +0200
Subject: [Buildroot] [git commit] nilfs-utils: no comment if BR2_USE_MMU is
 true
Message-ID: <20180927121255.6F95E88F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dbab1bb45d0eb1bf37e693b0ad9ca95831d5180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't display comment if BR2_USE_MMU is true
Moreover, move BR2_USE_MMU dependency at the top of dependency list

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nilfs-utils/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index e49cab369b..e245dc4656 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
+	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
-	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -13,5 +13,6 @@ config BR2_PACKAGE_NILFS_UTILS
 	  https://github.com/nilfs-dev/nilfs-utils
 
 comment "nilfs-utils needs a toolchain w/ threads, NPTL"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
