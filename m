From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Mar 2018 20:16:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.0
Message-ID: <20180328181643.25623-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased 0002-Fix-endianess-detection-with-musl-based-toolchains.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk                      |  2 +-
 ...2-Fix-endianess-detection-with-musl-based-toolchains.patch | 11 +++++++----
 package/mesa3d/mesa3d.hash                                    | 10 +++++-----
 package/mesa3d/mesa3d.mk                                      |  2 +-
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 50dcb67278..b48d965d8a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.7
+MESA3D_HEADERS_VERSION = 18.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
index 4846b34c9d..4c46593456 100644
--- a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
+++ b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
@@ -16,6 +16,7 @@ http://autobuild.buildroot.net/results/e27/e27a9a95f72dba3076549beb2a2ccfdbea2fc
 
 Patch sent upstream: https://patchwork.freedesktop.org/patch/119961/
 
+[Bernd: rebase on mesa 18.0.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Romain: rebase on mesa 17.3.1]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
@@ -41,14 +42,16 @@ diff --git a/src/amd/Makefile.addrlib.am b/src/amd/Makefile.addrlib.am
 index 46689637f9..508edfd0d5 100644
 --- a/src/amd/Makefile.addrlib.am
 +++ b/src/amd/Makefile.addrlib.am
-@@ -30,6 +30,7 @@ addrlib_libamdgpu_addrlib_la_CPPFLAGS = \
+@@ -29,7 +29,8 @@
+ 	-I$(srcdir)/addrlib/inc/chip/gfx9 \
  	-I$(srcdir)/addrlib/inc/chip/r800 \
  	-I$(srcdir)/addrlib/gfx9/chip \
- 	-I$(srcdir)/addrlib/r800/chip \
-+	$(DEFINES) \
- 	-DBRAHMA_BUILD=1
+-	-I$(srcdir)/addrlib/r800/chip
++	-I$(srcdir)/addrlib/r800/chip \
++	$(DEFINES)
  
  addrlib_libamdgpu_addrlib_la_CXXFLAGS = \
+ 	$(VISIBILITY_CXXFLAGS) $(CXX11_CXXFLAGS)
 diff --git a/src/util/u_endian.h b/src/util/u_endian.h
 index 9e09f80181..038a28fac9 100644
 --- a/src/util/u_endian.h
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 4bc4e820b8..ed88910bab 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-March/000410.html
-md5 769137f2538562c300c4b76bcb097377  mesa-17.3.7.tar.xz
-sha1 c66108a562cc94a9559357ca2b424f99c7f995e8  mesa-17.3.7.tar.xz
-sha256 0595904a8fba65a8fe853a84ad3c940205503b94af41e8ceed245fada777ac1e  mesa-17.3.7.tar.xz
-sha512 ec48565556aa4281056cee5dbef140553651fdfbb76ce32397de048db1cf65f5e18787c72b998de7da2de795d27e7040bde84651ade4726fc3a69a23b166ba4e  mesa-17.3.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-March/000412.html
+md5 c2a59fc5b56de3e197fa3a6023409e23  mesa-18.0.0.tar.xz
+sha1 361ed565bb7d243c251bfccd4fe2776f54c6d968  mesa-18.0.0.tar.xz
+sha256 694e5c3d37717d23258c1f88bc134223c5d1aac70518d2f9134d6df3ee791eea  mesa-18.0.0.tar.xz
+sha512 1494bb09357896a2505b3dcfec772268e28c765804f21e144948a314f1d79d99ff9f21062ef5860eb5a5a568b305a9c954585924a7ac8890fe1ebd8df3bcc396  mesa-18.0.0.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e4aa7d5ac..1d88fd8480 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.7
+MESA3D_VERSION = 18.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.14.2
