From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:49 +0300
Subject: [Buildroot] [PATCH 04/14] package: remove CodeSourcery sh
	dependencies
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <b09ce2c6f232b9b936e11d581c9e04071b59d371.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CodeSourcery sh toolchain has been removed. Drop negative dependencies on
that toolchain.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/domoticz/Config.in   | 3 ---
 package/liquid-dsp/Config.in | 1 -
 package/prboom/Config.in     | 2 --
 package/qt/Config.in         | 7 ++-----
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c6550d2ad07c..c03f84ae44bc 100644
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
index dca39153bb07..59ee7edb523f 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -18,7 +18,6 @@ if BR2_PACKAGE_LIQUID_DSP
 
 config BR2_PACKAGE_LIQUID_DSP_FAST
 	bool "optimize for speed over accuracy"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	help
 	  Optimize for speed over accuracy.
 
diff --git a/package/prboom/Config.in b/package/prboom/Config.in
index 6884f31e4635..8e445e98b85f 100644
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
index fe0b0e978780..7710b09d29e1 100644
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
-- 
2.11.0
