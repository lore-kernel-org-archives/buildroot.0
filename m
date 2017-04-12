From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:48 +0200
Subject: [Buildroot] [PATCH 14/53] pkg-cmake: programs are now installed in
	$(HOST_DIR)/bin
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-15-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/toolchainfile.cmake.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index c8c710bddd..1f5d2371ed 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -48,7 +48,7 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS
 
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
-set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
+set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
 set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
-- 
2.11.0
