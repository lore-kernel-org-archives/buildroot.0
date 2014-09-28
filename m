From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 20:50:15 +0200
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: remove the
	USE_CCACHE CMake flag for host-package
Message-ID: <20140928191300.18BD99D4E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f6f21444f696f977e2f4ad01430b6d0a8634f82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The USE_CCACHE CMake flag is only useful when building target package
(only the toolchainfile.cmake uses it).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 30198a9..f5aefae 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,7 +86,6 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
-		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
