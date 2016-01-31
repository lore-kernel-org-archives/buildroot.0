From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:50:30 +0100
Subject: [Buildroot] [git commit] package/libraw1394: fix musl build
Message-ID: <20160201224705.25E347F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b0933f201952bd7a933659335c9226842f28b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/33c/33cac2bda4890b6050c71734b2c36a77db3d3a09/
http://autobuild.buildroot.net/results/9b5/9b56c1eb7a790d6df6665e8592004f20ed3f0693/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.hash | 2 ++
 package/libraw1394/libraw1394.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
index 3674ad7..b785995 100644
--- a/package/libraw1394/libraw1394.hash
+++ b/package/libraw1394/libraw1394.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
 sha256	1bab9780189f9d1eb4e973df12679c04f979c21e024240fc98e536ff5b680ee9	libraw1394-2.1.1.tar.xz
+# Locally computed
+sha256	39369c65fbed7fccc2e6d8e645f258f101c414107d67238f10996e6c2009f20d	fix-types.patch
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index c9bc0b1..7123ac7 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -7,6 +7,7 @@
 LIBRAW1394_VERSION = 2.1.1
 LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
+LIBRAW1394_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/libraw1394/fix-types.patch
 LIBRAW1394_INSTALL_STAGING = YES
 LIBRAW1394_LICENSE = LGPLv2.1+
 LIBRAW1394_LICENSE_FILES = COPYING.LIB
