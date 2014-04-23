From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:28 +0200
Subject: [Buildroot] [PATCH 09/14] pkg-cmake.mk: globally disable
	BUILD_TESTING flag
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CMake flag is used to enable tests. It may not disable the test
programs from being built, but it controls the test execution.

Since we don't care about building the tests (and usually disable them
when possible), make sure Buildroot won't try to run them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index d6dadbe..e0efccb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,6 +65,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPT) \
-- 
1.9.2
