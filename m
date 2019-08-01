From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:49:32 +0200
Subject: [Buildroot] [git commit] package/libpciaccess: bump version to 0.16
Message-ID: <20190801074737.DCBE888573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0abd6d11539483acd6e73226d4abaf9eafecb63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/commit/1d71669e577f5f2eb02542851696d3bcb722a80b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpciaccess/0001-musl-arm.patch | 20 --------------------
 package/libpciaccess/libpciaccess.hash   | 11 +++++------
 package/libpciaccess/libpciaccess.mk     |  2 +-
 3 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/package/libpciaccess/0001-musl-arm.patch b/package/libpciaccess/0001-musl-arm.patch
deleted file mode 100644
index 0077f451bf..0000000000
--- a/package/libpciaccess/0001-musl-arm.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix musl build
-
-Inspired by http://patchwork.openembedded.org/patch/111661/
-"inb/outb are implemented for ARM on glibc but not on linux in general
-therefore the conditional has to reflect that"
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libpciaccess-0.13.4.org/src/linux_sysfs.c libpciaccess-0.13.4/src/linux_sysfs.c
---- libpciaccess-0.13.4.org/src/linux_sysfs.c	2015-05-01 06:44:47.000000000 +0200
-+++ libpciaccess-0.13.4/src/linux_sysfs.c	2016-01-24 15:27:57.141562678 +0100
-@@ -49,7 +49,7 @@
- #include <dirent.h>
- #include <errno.h>
- 
--#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
-+#if defined(__i386__) || defined(__x86_64__)
- #include <sys/io.h>
- #else
- #define inb(x) -1
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 36ca2d7e47..23823bb07f 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,8 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003004.html
-md5 843e92d0eef94684a4eb9a2d311bfb12  libpciaccess-0.15.tar.bz2
-sha1 e89fe53622533650203271945759e5e397cdbe10  libpciaccess-0.15.tar.bz2
-sha256 a75643bb5cd02f6da8667d437b76492842dd56bc88e3dfb8410f5d535b99f5dc  libpciaccess-0.15.tar.bz2
-sha512 c34abc438c549db22d27d71d63e13f93cb547eaea238ff2d193627b83a5877e2b34f6fcf4cdaf9b4f0c6b78206447fd9a578454783cfb4e9010e8de20de1364e  libpciaccess-0.15.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2019-July/003014.html
+md5 b34e2cbdd6aa8f9cc3fa613fd401a6d6  libpciaccess-0.16.tar.bz2
+sha1 ffaa13f2df5f822da1089b55223b217c142ef919  libpciaccess-0.16.tar.bz2
+sha256 214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489  libpciaccess-0.16.tar.bz2
+sha512 2f250048a270dfc0823d4bdd613aa272c58a80eaafd922850f56c4b6f7a45a263ed4cf521b52b49f04484ea44ebefb7407d079aa058318a5751ffb181e38fed1  libpciaccess-0.16.tar.bz2
 # Hash for license file:
 sha256 47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 5a95ae1338..d9a3a4e481 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.15
+LIBPCIACCESS_VERSION = 0.16
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
