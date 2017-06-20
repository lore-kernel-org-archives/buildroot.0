From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:12:16 +0200
Subject: [Buildroot] [git commit] package: remove CodeSourcery sh
	dependencies
Message-ID: <20170620201444.D21AB81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b051112506d0b8df48cf2b742d5dc8d2f9d80a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CodeSourcery sh toolchain has been removed. Drop negative dependencies on
that toolchain.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/domoticz/Config.in   | 3 ---
 package/liquid-dsp/Config.in | 1 -
 package/prboom/Config.in     | 2 --
 package/qt/Config.in         | 7 ++-----
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c6550d2..c03f84a 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
-	# These result in internal compiler error
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -30,7 +28,6 @@ config BR2_PACKAGE_DOMOTICZ
 comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index dca3915..59ee7ed 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -18,7 +18,6 @@ if BR2_PACKAGE_LIQUID_DSP
 
 config BR2_PACKAGE_LIQUID_DSP_FAST
 	bool "optimize for speed over accuracy"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	help
 	  Optimize for speed over accuracy.
 
diff --git a/package/prboom/Config.in b/package/prboom/Config.in
index 6884f31..8e445e9 100644
--- a/package/prboom/Config.in
+++ b/package/prboom/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PRBOOM
 	bool "prboom"
-	# These result in internal compiler error
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_SDL_MIXER
 	select BR2_PACKAGE_SDL_NET
diff --git a/package/qt/Config.in b/package/qt/Config.in
index fe0b0e9..7710b09 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -444,11 +444,8 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
-	# The CodeSourcery SuperH toolchain fails to build Webkit,
-	# with an assertion failure in binutils.
-	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+		BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || \
+		BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_QT_WEBKIT
