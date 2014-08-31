From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 22:25:37 +0200
Subject: [Buildroot] [git commit] package/cmake: add host-pkgconf as
	dependency
Message-ID: <20140831214441.122949D330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d475ee0ba4d6eea6aca25594cfe5bb153ac804f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since some CMake modules (even upstream ones) use pgk_check_modules
primitives to find {C,LD}FLAGS, add it to the dependency list.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6987f09..bfeb147 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,6 +10,8 @@ CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
+HOST_CMAKE_DEPENDENCIES = host-pkgconf
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
