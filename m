From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Apr 2017 10:44:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bump version to 0.13.5
Message-ID: <20170408084406.2881-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add additional md5, sha1 & sha256 hashes according to buildroot docs:
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash

> If upstream provides more than one type of hash (e.g. sha1 and sha512),
> then it is best to add all those hashes in the .hash file.

Removed patch 0001, applied upstream:
https://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=6bd2f7f92eae713663f4e13f6e2cb23526607b8c

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/0001-limits_h.patch           | 22 ----------------------
 .../{0002-musl-arm.patch => 0001-musl-arm.patch}   |  0
 package/libpciaccess/libpciaccess.hash             |  7 +++++--
 package/libpciaccess/libpciaccess.mk               |  2 +-
 4 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 package/libpciaccess/0001-limits_h.patch
 rename package/libpciaccess/{0002-musl-arm.patch => 0001-musl-arm.patch} (100%)

diff --git a/package/libpciaccess/0001-limits_h.patch b/package/libpciaccess/0001-limits_h.patch
deleted file mode 100644
index c5c8444a5..000000000
--- a/package/libpciaccess/0001-limits_h.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix compilation error with musl-based toolchain
-
-linux_sysfs.c:751:15: error: 'PATH_MAX' undeclared (first use in this function)
-     char name[PATH_MAX];
-
-Patch applied upstream:
-http://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=8ea3af620a2d4ad5648917b4a0ef2b23ff566774
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libpciaccess-0.13.3.org/src/linux_sysfs.c libpciaccess-0.13.3/src/linux_sysfs.c
---- libpciaccess-0.13.3.org/src/linux_sysfs.c	2015-02-04 00:59:14.000000000 +0100
-+++ libpciaccess-0.13.3/src/linux_sysfs.c	2015-04-10 21:57:35.000000000 +0200
-@@ -44,6 +44,7 @@
- #include <sys/mman.h>
- #include <dirent.h>
- #include <errno.h>
-+#include <limits.h>
- 
- #if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
- #include <sys/io.h>
diff --git a/package/libpciaccess/0002-musl-arm.patch b/package/libpciaccess/0001-musl-arm.patch
similarity index 100%
rename from package/libpciaccess/0002-musl-arm.patch
rename to package/libpciaccess/0001-musl-arm.patch
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 0483c4c81..b060e02ed 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002590.html
-sha256	07f864654561e4ac8629a0ef9c8f07fbc1f8592d1b6c418431593e9ba2cf2fcf	libpciaccess-0.13.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-April/002791.html
+md5 d810ab17e24c1418dedf7207fb2841d4  libpciaccess-0.13.5.tar.bz2
+sha1 ea98c13623e218359ca6d9af9ab9aa4780201a5b  libpciaccess-0.13.5.tar.bz2
+sha256 752c54e9b3c311b4347cb50aea8566fa48eab274346ea8a06f7f15de3240b999  libpciaccess-0.13.5.tar.bz2
+sha512 4b77aa66b3429fd5f9bff0408b0624305e766bf209f3fa2a0a9024df55bf87ca68f9a5aa34f97ffe131997e0669c65cf542210cf308c0de09842424968c5a159  libpciaccess-0.13.5.tar.bz2
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index ced0786a1..1ff2d4a76 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.13.4
+LIBPCIACCESS_VERSION = 0.13.5
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
2.11.0
