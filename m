From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:02:46 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: globally disable doc,
	examples and tests
Message-ID: <20141026160659.E6B9EB0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c99a1ab3b412c2af1d92a492aee48ca825ba6dfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch globally disables doc, examples and tests build for both the
target and host packages.

If needed, these configure flags can be overloaded in the per-package
*_CONF_OPTS variables.

This makes the cmake-package infrastructure even closer to the autotools
one.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

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
