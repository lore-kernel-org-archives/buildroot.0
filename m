From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:49:30 +0200
Subject: [Buildroot] [git commit] pkg-cmake: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
Message-ID: <20170705095036.45C6A817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b1255d8895beb9d7e27227a00856001e846620e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Build-tested with a bunch of cmake packages.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 0897430..0606d26 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -115,7 +115,7 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
-		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)" \
 		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
