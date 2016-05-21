From: Charles Hardin <ckhardin@exablox.com>
Date: Sat, 21 May 2016 13:08:34 -0700
Subject: [Buildroot] [PATCH 1/1] package/cmake: with BR2_ENABLE_DEBUG use
	RelWithDebInfo
Message-ID: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the documentation on BR2_ENABLE_DEBUG, the intention is to get
a build with debug symbols and not a "debug build" since that can have
the unintended consequence of being a different code path then a
release build type definition.

Switch the "Debug" to "RelWithDebInfo" in the cmake package support
to accomodate getting the debug symbols and still be a release
build.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..bca3603 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
+		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
-- 
2.7.4 (Apple Git-66)
