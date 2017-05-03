From: Mario J. Rugiero <mrugiero@gmail.com>
Date: Tue,  2 May 2017 21:14:24 -0300
Subject: [Buildroot] [PATCH] package: protobuf: fix build on gcc < 4.5.0
Message-ID: <20170503001424.13534-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch working around a gcc bug which got fixed in version 4.5.0.

Fixes:
http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/protobuf/protobuf.hash | 1 +
 package/protobuf/protobuf.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 8c2ade37e..9b8e1e86d 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
 sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
+sha256 309c8fd476863ddf9726a9700023d6349f7305e05bec071a06f4ccf7e90a7053 a83ac8663fb8042a881bc60b12a8bd3a0c03a3ff.patch
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 610da8c04..92b6fe344 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -20,6 +20,7 @@ PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 PROTOBUF_INSTALL_STAGING = YES
 
 PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
+PROTOBUF_PATCH += https://github.com/google/protobuf/commit/a83ac8663fb8042a881bc60b12a8bd3a0c03a3ff.patch
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
-- 
2.12.2
