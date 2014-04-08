From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 13:30:49 +0200
Subject: [Buildroot] [git commit] libuci: bump version and remove obsolete
	patch
Message-ID: <20140408113542.8E2B69C692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d3c0b5c22514bf70e048d2c16645e5d2c7004be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uci-fix-Lua-finding.patch was upstreamed, so remove it.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuci/libuci-01-uci-fix-Lua-finding.patch |   31 --------------------
 package/libuci/libuci.mk                           |    2 +-
 2 files changed, 1 insertions(+), 32 deletions(-)

diff --git a/package/libuci/libuci-01-uci-fix-Lua-finding.patch b/package/libuci/libuci-01-uci-fix-Lua-finding.patch
deleted file mode 100644
index f37e136..0000000
--- a/package/libuci/libuci-01-uci-fix-Lua-finding.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 980432ce260020ed8a907b3bbc1334845ba4c4a9 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Sat, 5 Apr 2014 19:18:10 +0200
-Subject: [PATCH] uci: fix Lua finding
-
-If ${LUAPATH} is not quoted and Lua is not provided, then following
-error occurs:
-
-"NOT" "No such file or directory" "EQUAL" "0" "OR" "EQUAL" ""
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- lua/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lua/CMakeLists.txt b/lua/CMakeLists.txt
-index e4295d7..4ba8e37 100644
---- a/lua/CMakeLists.txt
-+++ b/lua/CMakeLists.txt
-@@ -36,7 +36,7 @@ IF(NOT LUAPATH)
- 	)
- 
- 	IF(BUILD_LUA)
--		IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR ${LUAPATH} EQUAL "")
-+		IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")
- 			MESSAGE(SEND_ERROR "Lua was not found on your system")
- 		ENDIF()
- 	ENDIF()
--- 
-1.8.3.2
-
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index adc7bce..ff50874 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 262fede3e8c8c08c1eb0d1be9bf102232fb86cb9
+LIBUCI_VERSION = ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10
 LIBUCI_SITE = git://nbd.name/uci.git
 LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
