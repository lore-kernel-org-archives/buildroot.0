From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:33:37 +0200
Subject: [Buildroot] [git commit] support/misc/toolchainfile.cmake.in: use
 TARGET_LDFLAGS for shared and module libraries
Message-ID: <20180719072924.AD8CA88DE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8c0faa980df32622d5f1964892ba84fa4f17a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With cmake packages, we are only using TARGET_LDFLAGS for executables
and not for shared libraries.

This patch adds CMAKE_SHARED_LINKER_FLAGS and
CMAKE_MODULE_LINKER_FLAGS to the cmake toolchain file so that
buildroot TARGET_LDFLAGS are used for shared and module libraries.

Signed-off-by: Damien Th??bault <damien.thebault@vitec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/toolchainfile.cmake.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 1f5d2371ed..6f3c8ca971 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -45,6 +45,8 @@ set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configur
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
 set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
+set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
+set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
 
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
