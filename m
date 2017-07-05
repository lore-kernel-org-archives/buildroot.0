From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:50:21 +0200
Subject: [Buildroot] [git commit] pkg-cmake: programs are now installed in
	$(HOST_DIR)/bin
Message-ID: <20170705095036.62DC281979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58fd643d522b64f796cd06e6f18f231006859dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index c8c710b..1f5d237 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -48,7 +48,7 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS
 
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
-set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
+set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
 set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
