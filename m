From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 13:38:49 +0200
Subject: [Buildroot] [git commit] util-linux: add option for libmount
Message-ID: <20110729114227.119B88B568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=55cea3b5ef3bd5464420fd610c73e150443d0e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in     |    4 ++++
 package/util-linux/util-linux.mk |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index f4be2b7..816130d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -24,6 +24,10 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "build \"fsck\""
 
+config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	bool "build libmount"
+
 config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	bool "build libuuid and uuid utilities"
 	default y
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 72dabaf..570a1d1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -33,6 +33,7 @@ endif
 UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),,--disable-mount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUID),,--disable-uuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),,--disable-libblkid) \
-- 
1.7.3.4
