From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 17 Jan 2016 20:25:51 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-cmake: use MinSizeRel for size
	optimized build
Message-ID: <1453058751-9489-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MinSizeRel sets the gcc compiler optimization level to '-Os' whereas Release
sets it to '-O3'.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v2:
 - fix typo
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..43da079 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
+		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,$$(if $$(BR2_OPTIMIZE_S),MinSizeRel,Release)) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
-- 
2.7.0
