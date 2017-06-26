From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 26 Jun 2017 10:10:35 -0400
Subject: [Buildroot] [PATCH 1/1] protobuf: version bump to 3.3.0
Message-ID: <20170626141035.28299-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove 416f90939d4de58fe1a4e2489120010313183291.patch as it is
part of 3.3.0.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/protobuf/protobuf.hash | 3 +--
 package/protobuf/protobuf.mk   | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 8c2ade3..1c7bd43 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
-sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
+sha256 5e2587dea2f9287885e3b04d3a94ed4e8b9b2d2c5dd1f0032ceef3ea1d153bd7 protobuf-cpp-3.3.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 2cd10eb..fc2fd1a 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.2.0
+PROTOBUF_VERSION = 3.3.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
@@ -23,8 +23,6 @@ endif
 
 PROTOBUF_INSTALL_STAGING = YES
 
-PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
-- 
2.9.4
