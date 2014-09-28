From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 20:51:31 +0200
Subject: [Buildroot] [git commit] package/pkg-cmake.mk: set the {C, CXX,
	LD}FLAGS for host packages
Message-ID: <20140928191300.1F26B9D786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b10e0cf573e732e7e723041d958f519e88524c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f5aefae..3655751 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,6 +86,9 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
