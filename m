From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 20 May 2018 22:05:47 -0700
Subject: [Buildroot] [PATCH 1/4] protobuf, python-protobuf: bump to v3.5.1
Message-ID: <20180521050550.11898-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

Also, add a patch to compile for mips big endian
in addition to mips little endian.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/protobuf/0001-convert-mipsel-to-mips.patch | 12 ++++++++++++
 package/protobuf/protobuf.hash                     |  2 +-
 package/protobuf/protobuf.mk                       |  6 +++---
 3 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 package/protobuf/0001-convert-mipsel-to-mips.patch

diff --git a/package/protobuf/0001-convert-mipsel-to-mips.patch b/package/protobuf/0001-convert-mipsel-to-mips.patch
new file mode 100644
index 0000000000..005d818d9d
--- /dev/null
+++ b/package/protobuf/0001-convert-mipsel-to-mips.patch
@@ -0,0 +1,12 @@
+diff -Naur protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h
+--- protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h	2017-12-20 23:07:13.000000000 +0000
++++ protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h	2018-05-21 03:46:58.580000399 +0000
+@@ -56,7 +56,7 @@
+ #elif defined(__aarch64__)
+ #define GOOGLE_PROTOBUF_ARCH_AARCH64 1
+ #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
+-#elif defined(__MIPSEL__)
++#elif defined(__mips__)
+ #if defined(__LP64__)
+ #define GOOGLE_PROTOBUF_ARCH_MIPS64 1
+ #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index fa02440a40..d86f9758f3 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2bb34b4a8211a30d12ef29fd8660995023d119c99fbab2e5fe46f17528c9cc78 protobuf-cpp-3.4.1.tar.gz
+sha256 826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f  protobuf-v3.5.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index d2782ddcfd..6120d6030d 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,11 +7,11 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.4.1
-PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
-PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
+PROTOBUF_VERSION = v3.5.1
+PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
+PROTOBUF_AUTORECONF = YES
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.15.1 (Apple Git-101)
