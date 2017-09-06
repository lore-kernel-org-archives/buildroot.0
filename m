From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:15:15 +0200
Subject: [Buildroot] [git commit] libcoap: bump to version 4.1.2
Message-ID: <20170906201134.DD5427FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee4679c7bb24c0a2564356a9774d6b34dd65c7d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nly-add-Wunused-result-if-supported-by-th.patch | 38 ----------------------
 package/libcoap/libcoap.hash                       |  2 +-
 package/libcoap/libcoap.mk                         |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch b/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch
deleted file mode 100644
index bc93890..0000000
--- a/package/libcoap/0001-configure-only-add-Wunused-result-if-supported-by-th.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d5914ecbb0285aea1eb2b9432d6e91155877fd95 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 9 Jun 2016 21:53:59 +0200
-Subject: [PATCH] configure: only add -Wunused-result if supported by the
- compiler
-
-Old gcc versions such as 4.3.x do not support -Wunused-result, so
-instead of unconditionally using this warning, only use it if supported
-by the compiler.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Submitted upstream: https://github.com/obgm/libcoap/pull/32
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f4452ac..6354fcf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,12 +110,12 @@ WARNING_CFLAGS="\
- -Wswitch-default \
- -Wswitch-enum \
- -Wunused \
---Wunused-result \
- "
- 
- # check whether or not the compiler supports -Wlogical-op (clang does not...)
- AX_CHECK_COMPILE_FLAG([-Wlogical-op], [WARNING_CFLAGS="$WARNING_CFLAGS -Wlogical-op"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-fdiagnostics-color], [CFLAGS="$CFLAGS -fdiagnostics-color"],,[-Werror])
-+AX_CHECK_COMPILE_FLAG([-Wunused-result], [WARNING_CFLAGS="$WARNING_CFLAGS -Wunused-result"])
- 
- AC_SUBST([WARNING_CFLAGS])
- 
--- 
-2.7.4
-
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index dce491b..708ca1b 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f66e91742c2b027fcd7c575d8e7b53d79d3624aad1b3baba481dd88f6e2bc44d libcoap-c909bf802034b7762a2182848304b2530e58444f.tar.gz
+sha256 f7e26dc232c177336474a14487771037a8fb32e311f5ccd076a00dc04b6d7b7a libcoap-v4.1.2.tar.gz
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index fb5d2bf..31a6822 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = c909bf802034b7762a2182848304b2530e58444f
+LIBCOAP_VERSION = v4.1.2
 LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
