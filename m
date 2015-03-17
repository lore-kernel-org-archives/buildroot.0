From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Mar 2015 10:30:38 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/cmake: disable on unsupported
	architectures
Message-ID: <1426584639-22786-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supported architectures are listed at [1].

Fixes:
  http://autobuild.buildroot.net/results/de9/de9021fdc63600536ffa91e4b8718584e3e5702c/
  http://autobuild.buildroot.net/results/0f1/0f1afc62e91ab798fa65685af3dea3caac663f11/

[1] https://github.com/Kitware/CMake/blob/master/Utilities/KWIML/ABI.h.in#L339

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
changes v1->v2:
- use positive logic (ThomasP)
- add depends on statement to the comment (Baruch)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cmake/Config.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 0b5bba9..9c0b75a 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -10,6 +10,13 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
+	depends on BR2_arm || BR2_armeb || \
+		BR2_aarch64 || \
+		BR2_m68k || \
+		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sparc || \
+		BR2_i386 || BR2_x86_64
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
@@ -22,4 +29,11 @@ config BR2_PACKAGE_CMAKE_CTEST
 	  http://www.cmake.org/
 
 comment "ctest needs a toolchain w/ C++, wchar"
+	depends on BR2_arm || BR2_armeb || \
+		BR2_aarch64 || \
+		BR2_m68k || \
+		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sparc || \
+		BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
2.1.0
