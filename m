From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2021 18:39:26 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to 3.2.10
Message-ID: <20210212173926.41684-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was applied upstream:
https://github.com/gentoo/eudev/commit/799591c57368bbe47667f5b696050247a766b117

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...dev-monitor.c-do-not-check-if-dev-is.patch | 33 -------------------
 package/eudev/eudev.hash                      |  6 ++--
 package/eudev/eudev.mk                        |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch

diff --git a/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch b/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch
deleted file mode 100644
index 3027ad7f17..0000000000
--- a/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 799591c57368bbe47667f5b696050247a766b117 Mon Sep 17 00:00:00 2001
-From: "Anthony G. Basile" <blueness@gentoo.org>
-Date: Mon, 6 Jan 2020 11:14:47 -0500
-Subject: [PATCH] src/libudev/libudev-monitor.c: do not check if /dev is tmpfs
-
-This check fails for buildroot systems where /dev is not mounted
-as a tmpfs filesystem.  Dropping this check should be safe even
-on regular systems.
-
-This solves issue #172.
-
-Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- src/libudev/libudev-monitor.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libudev/libudev-monitor.c b/src/libudev/libudev-monitor.c
-index 614149c6243c..060ba733f33b 100644
---- a/src/libudev/libudev-monitor.c
-+++ b/src/libudev/libudev-monitor.c
-@@ -186,7 +186,7 @@ struct udev_monitor *udev_monitor_new_from_netlink_fd(struct udev *udev, const c
-                  * We do not set a netlink multicast group here, so the socket
-                  * will not receive any messages.
-                  */
--                if (access(UDEV_ROOT_RUN "/udev/control", F_OK) < 0 || !udev_has_devtmpfs(udev)) {
-+                if (access(UDEV_ROOT_RUN "/udev/control", F_OK) < 0) {
-                         log_debug("the udev service seems not to be active, disable the monitor");
-                         group = UDEV_MONITOR_NONE;
-                 } else
--- 
-2.25.0
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index e6a319ac44..fda0481351 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 dedfb1964f6098fe9320de827957331f  eudev-3.2.9.tar.gz
+md5  60b135a189523f333cea5f71a3345c8d  eudev-3.2.10.tar.gz
 # Locally calculated
-sha256 89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc  eudev-3.2.9.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034  eudev-3.2.10.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d4133a5ace..5d18b388c7 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.9
+EUDEV_VERSION = 3.2.10
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.29.2
