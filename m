From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:58:29 +0200
Subject: [Buildroot] [git commit] package/libblockdev: fs needs libmount
Message-ID: <20201015204707.93F07814C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=004b466f310ba0d38544d0aa1145cb2469130ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/1f83436a84046da753a2ebf2aac7c0f0cc188fe0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 2 ++
 package/libblockdev/libblockdev.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 3c501b7871..4389fd794c 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -28,6 +28,8 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
 	depends on BR2_ENABLE_LOCALE # parted
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
 
 comment "filesystem plugin needs a toolchain w/ locale"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 1b094555d2..a38912514c 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -39,7 +39,7 @@ LIBBLOCKDEV_CONF_OPTS += --without-crypto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_FS),y)
-LIBBLOCKDEV_DEPENDENCIES += parted
+LIBBLOCKDEV_DEPENDENCIES += parted util-linux
 LIBBLOCKDEV_CONF_OPTS += --with-fs
 else
 LIBBLOCKDEV_CONF_OPTS += --without-fs
