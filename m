From: Mario J. Rugiero <mrugiero@gmail.com>
Date: Fri, 12 May 2017 04:35:03 -0300
Subject: [Buildroot] [PATCH v2] package: protobuf,
	python-protobuf: bump to v3.3.0
In-Reply-To: <20170511230019.3f18b34a@free-electrons.com>
References: <20170511230019.3f18b34a@free-electrons.com>
Message-ID: <20170512073503.601-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes upstream patch working around a gcc bug which got fixed in version 4.5.0.

Fixes:
http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/

Tested with:
qemu_aarch64_virt_defconfig

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/protobuf/protobuf.hash               | 3 +--
 package/protobuf/protobuf.mk                 | 4 +---
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 8c2ade37e..1c7bd43b0 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
-sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
+sha256 5e2587dea2f9287885e3b04d3a94ed4e8b9b2d2c5dd1f0032ceef3ea1d153bd7 protobuf-cpp-3.3.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 610da8c04..556773106 100644
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
@@ -19,8 +19,6 @@ PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
 
-PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index c87403f24..7da2fed03 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c574e2b2178ffe66599274e8cfa11ecf83799a7992be30f0b68fb33ea0a0f1af protobuf-python-3.2.0.tar.gz
+sha256 3fd180eee78c7ee2e7a1b2f02657ef61ccbc2537a6767cd2493077d3b38c9d2d protobuf-python-3.3.0.tar.gz
-- 
2.13.0
