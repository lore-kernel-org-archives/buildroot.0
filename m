From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:43:42 +0200
Subject: [Buildroot] [git commit] protobuf: fix musl build
Message-ID: <20170429134352.1EAC58270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0922bc690de886acb81ab1327e70d07ad369ff2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing conflict with musl defined major/minor macros.

Fixes:
http://autobuild.buildroot.net/results/fc5/fc5ea266eecb6ecab011ea3542f0bb680fb8fb3b/
http://autobuild.buildroot.net/results/3b3/3b3fe16978f19e65a6c6dc1712d72cb349eed0d5/
http://autobuild.buildroot.net/results/1da/1dac9d5e49342700036c90ed4785fff7398b8966/

Cc: Mario J. Rugiero <mrugiero@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Mario J. Rugiero <mrugiero@gmail.com>
Tested-by: Mario J. Rugiero <mrugiero@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/protobuf.hash | 1 +
 package/protobuf/protobuf.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 9ec6bc7..8c2ade3 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
+sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index a3e96d4..610da8c 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -19,6 +19,8 @@ PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
 
+PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
