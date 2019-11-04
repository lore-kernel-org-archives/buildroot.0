From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  4 Nov 2019 15:20:02 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.32.0-0
Message-ID: <20191104142002.7618-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop hook to add pc-file. Correct installation of the pc-file is
included in the new version.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luv/libluv.pc.in | 12 ------------
 package/luv/luv.hash     |  2 +-
 package/luv/luv.mk       |  8 +-------
 3 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 package/luv/libluv.pc.in

diff --git a/package/luv/libluv.pc.in b/package/luv/libluv.pc.in
deleted file mode 100644
index d1544f6504..0000000000
--- a/package/luv/libluv.pc.in
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=@prefix@
-exec_prefix=${prefix}
-libdir=@libdir@
-includedir=@includedir@
-
-Name: libluv
-Version: @LUV_VERSION@
-Description: Bare and full libuv bindings for Lua/LuaJIT.
-URL: https://github.com/luvit/luv
-
-Libs: -L${libdir} -lluv @LIBS@
-Cflags: -I${includedir}
diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index c3a3062e1c..1f1d65c3f9 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 420fc299f3b25aff55b839e9fe590982f45045b3e53ebeab2449eca7e23a106a  luv-1.30.1-0.tar.gz
+sha256 25a34b2aecf02d1fd32352c855577dcecd20c756dee9eb7ebecd206bf1de26d3  luv-1.32.0-0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index c6a8eab158..5723bc02e4 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.30.1-0
+LUV_VERSION = 1.32.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
 LUV_DEPENDENCIES = libuv
 LUV_INSTALL_STAGING = YES
 
-# Archive 1.30.1-0 doesn't contain libluv.pc.in so install it in this hook
-define LUV_INSTALL_PC_IN
-	cp package/luv/libluv.pc.in $(@D)/
-endef
-LUV_POST_EXTRACT_HOOKS += LUV_INSTALL_PC_IN
-
 LUV_CONF_OPTS += \
 	-DBUILD_MODULE=OFF \
 	-DWITH_SHARED_LIBUV=ON \
-- 
2.23.0
