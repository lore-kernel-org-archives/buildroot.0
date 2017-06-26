From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Jun 2017 15:21:42 +0200
Subject: [Buildroot] [PATCH 1/4] libsigrok: bump version to 0.5.0
In-Reply-To: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
References: <1498483305-17826-1-git-send-email-brgl@bgdev.pl>
Message-ID: <1498483305-17826-2-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch is now upstream and can be removed.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 36 ----------------------
 package/libsigrok/libsigrok.hash                   |  2 +-
 package/libsigrok/libsigrok.mk                     |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch

diff --git a/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch b/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
deleted file mode 100644
index 2b20680..0000000
--- a/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 83bf4762e42a4d4a5c077f48d8f5715c9147d9b8 Mon Sep 17 00:00:00 2001
-From: Aurelien Jacobs <aurel@gnuage.org>
-Date: Mon, 1 Feb 2016 22:37:36 +0100
-Subject: [PATCH] beaglelogic: use standard # operator instead of ugly __STRING
- macro
-
-Also note that the __ namespace is reserved by POSIX for its private
-usage, so user land software should never rely on any kind of API
-with a __ prefix.
-
-Signed-off-by: Aurelien Jacobs <aurel@gnuage.org>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch downloaded from upstream git:
-http://sigrok.org/gitweb/?p=libsigrok.git;a=commit;h=83bf4762e42a4d4a5c077f48d8f5715c9147d9b8
-
- src/hardware/beaglelogic/beaglelogic.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/hardware/beaglelogic/beaglelogic.h b/src/hardware/beaglelogic/beaglelogic.h
-index 9015c61..96713ba 100644
---- a/src/hardware/beaglelogic/beaglelogic.h
-+++ b/src/hardware/beaglelogic/beaglelogic.h
-@@ -30,8 +30,7 @@
- 
- /* BeagleLogic device node name */
- #define BEAGLELOGIC_DEV_NODE        "/dev/beaglelogic"
--#define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/"\
--					__STRING(a)
-+#define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/" #a
- 
- /* Reproduced verbatim from beaglelogic.h in the kernel tree until the kernel
-  * module hits the mainline. Contains the ABI, so DO NOT TOUCH this section */
--- 
-2.6.2
-
diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
index 999cef5..47ad612 100644
--- a/package/libsigrok/libsigrok.hash
+++ b/package/libsigrok/libsigrok.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	5f291f3fee36e6dab1336f1c78596e50588831bc5ebd7cddc2a95fe8c71d669e	libsigrok-0.4.0.tar.gz
+sha256	4c8c86779b880a5c419f6c77a08b1147021e5a19fa83b0f3b19da27463c9f3a4	libsigrok-0.5.0.tar.gz
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 9137165..fe7d6c4 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 0.4.0
+LIBSIGROK_VERSION = 0.5.0
 LIBSIGROK_SITE = http://sigrok.org/download/source/libsigrok
 LIBSIGROK_LICENSE = GPL-3.0+
 LIBSIGROK_LICENSE_FILES = COPYING
-- 
2.9.3
