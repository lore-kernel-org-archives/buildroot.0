From: =?utf-8?B?RGFtaWVuIFRow6liYXVsdA==?= <damien.thebault@vitec.com>
Date: Thu, 12 Jul 2018 06:52:13 +0000
Subject: [Buildroot] [PATCH] Use TARGET_LDFLAGS for cmake shared and module
 libraries
Message-ID: <205aa775588289b4db7f1ce200b32a9c1500b6ba.camel@vitec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With cmake packages, we are only using TARGET_LDFLAGS for executables
and not for shared libraries.

This patch adds CMAKE_SHARED_LINKER_FLAGS and CMAKE_MODULE_LINKER_FLAGS
to the cmake toolchain file so that buildroot TARGET_LDFLAGS are used
for shared and module libraries.

Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>
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
 
-- 
2.18.0
