From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:18:25 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: globally disable
	BUILD_TESTING flag
Message-ID: <20140601202128.430389CE48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=257a82031ebeb1e155ce74b9cfe87add8b223d66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CMake flag is used to enable tests. It may not disable the test
programs from being built, but it controls the test execution.

Since we don't care about building the tests (and usually disable them
when possible), make sure Buildroot won't try to run them.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 56a93c7..6331e0f 100644
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
@@ -85,6 +86,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
 		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
+		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
