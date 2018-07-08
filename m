From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:31 +0200
Subject: [Buildroot] [PATCH 06/50 v2] package/busybox: invert dependency
 with usbutils
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <6ac04d8cb610e870963a889ddad33a54ac2a166a.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk   | 1 +
 package/usbutils/usbutils.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 38f0246b4f..817f7a9c63 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 43322e4a65..4bd12f34ff 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -11,11 +11,6 @@ USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
 USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
 USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0.txt LICENSES/GPL-3.0.txt
 
-# Build after busybox since it's got a lightweight lsusb
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-USBUTILS_DEPENDENCIES += busybox
-endif
-
 # Nice lsusb.py script only if there's python 3.x
 ifeq ($(BR2_PACKAGE_PYTHON3),)
 define USBUTILS_REMOVE_PYTHON
-- 
2.14.1
