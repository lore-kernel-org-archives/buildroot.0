From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Oct 2019 22:59:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libmspack: new package
Message-ID: <20191005205921.31593-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming clamav version bump to 0.102.0.

Package passed test-pkg:

                             andes-nds32 [ 1/44]: OK
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: OK
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: OK
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: OK
                      br-arm-full-static [11/44]: OK
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: OK
                       br-m68k-5208-full [14/44]: OK
                      br-m68k-68040-full [15/44]: OK
                    br-microblazeel-full [16/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
               br-powerpc-603e-basic-cpp [23/44]: OK
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: OK
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: OK
                          br-xtensa-full [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 0 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libmspack/Config.in      |  7 +++++++
 package/libmspack/libmspack.hash |  3 +++
 package/libmspack/libmspack.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/libmspack/Config.in
 create mode 100644 package/libmspack/libmspack.hash
 create mode 100644 package/libmspack/libmspack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d9f580a8a5..7ec94cfa38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -349,6 +349,7 @@ F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
+F:	package/libmspack/
 F:	package/libnatpmp/
 F:	package/libnpth/
 F:	package/libogg/
diff --git a/package/Config.in b/package/Config.in
index 77207854cd..8a9634a743 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1210,6 +1210,7 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
+	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
 	source "package/lzo/Config.in"
diff --git a/package/libmspack/Config.in b/package/libmspack/Config.in
new file mode 100644
index 0000000000..e2b1a9059a
--- /dev/null
+++ b/package/libmspack/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMSPACK
+	bool "libmspack"
+	help
+	  libmspack is a portable library for some loosely related
+	  Microsoft compression formats
+
+	  https://www.cabextract.org.uk/libmspack
diff --git a/package/libmspack/libmspack.hash b/package/libmspack/libmspack.hash
new file mode 100644
index 0000000000..b12e9b6280
--- /dev/null
+++ b/package/libmspack/libmspack.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 bac862dee6e0fc10d92c70212441d9f8ad9b0222edc9a708c3ead4adb1b24a8e  libmspack-0.10.1alpha.tar.gz
+sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
new file mode 100644
index 0000000000..e9fdc3ca8d
--- /dev/null
+++ b/package/libmspack/libmspack.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libmspack
+#
+################################################################################
+
+LIBMSPACK_VERSION = 0.10.1alpha
+LIBMSPACK_SITE = https://www.cabextract.org.uk/libmspack
+LIBMSPACK_LICENSE = LGPL-2.1
+LIBMSPACK_LICENSE_FILES = COPYING.LIB
+LIBMSPACK_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.20.1
