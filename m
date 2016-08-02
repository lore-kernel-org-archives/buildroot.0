From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:38:52 +0200
Subject: [Buildroot] [git commit] libseccomp: bump version to 2.3.1
Message-ID: <20160802194207.A179881871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32b416d51f4a2638493f68b433dd493c654778aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libseccomp version to 2.3.1 to enable power architectures.

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/0002-musl.patch | 28 ----------------------------
 package/libseccomp/Config.in       |  3 ++-
 package/libseccomp/libseccomp.hash |  2 +-
 package/libseccomp/libseccomp.mk   |  2 +-
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/package/libseccomp/0002-musl.patch b/package/libseccomp/0002-musl.patch
deleted file mode 100644
index 9858d76..0000000
--- a/package/libseccomp/0002-musl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From eb5382287cd25235e760b5da4939510b11bbf2a1 Mon Sep 17 00:00:00 2001
-From: Kylie McClain <somasis@exherbo.org>
-Date: Fri, 1 Jan 2016 13:12:59 -0500
-Subject: [PATCH] system.h: Remove conflicting kernel header include
-
-This fixes building on musl libc, since musl does not include kernel
-headers. I've tested this as working on both glibc and musl.
-
-Signed-off-by: Kylie McClain <somasis@exherbo.org>
-[Bernd: downloaded from upstream PR:
- https://github.com/seccomp/libseccomp/pull/23]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/system.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/system.h b/src/system.h
-index 4660679..e84b0a0 100644
---- a/src/system.h
-+++ b/src/system.h
-@@ -23,7 +23,6 @@
- #define _SYSTEM_H
- 
- #include <linux/filter.h>
--#include <linux/prctl.h>
- 
- #include "configure.h"
- 
diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 4c34c54..ddfe9f0 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
 	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		BR2_mips64el || BR2_i386 || BR2_x86_64
+		BR2_mips64el || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || \
+		BR2_powerpc
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  High level interface to the Linux Kernel's seccomp filter
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index b0e145f..ef390ff 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fee0a6671f160481dcd07760ea0df8b6d954bdd8b4ab20a423ac9ade5e4feced  libseccomp-v2.2.3.tar.gz
+sha256 09864282ae579c34bd5ef75ef3487200adfecaa51f5cffc7c7ad1ed2f89f5d6c libseccomp-v2.3.1.tar.gz
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 69559f7..03fc6cf 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.2.3
+LIBSECCOMP_VERSION = v2.3.1
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
