From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:37 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-cmake.mk: globally disable
	doc, examples and tests
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch globally disables doc, examples and tests build for both the
target and host packages.

If needed, these configure flags can be overloaded in the per-package
*_CONF_OPTS variables.

This makes the cmake-package infrastructure even closer to the autotools
one.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 92574e2..3c5d4fe 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -66,6 +66,12 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
@@ -89,6 +95,12 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPTS) \
 	)
-- 
2.1.2
