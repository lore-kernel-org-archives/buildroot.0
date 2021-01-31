From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:18:23 +0100
Subject: [Buildroot] [git commit] package/efl: drop dependency on gcc >= 4.8
Message-ID: <20210131215826.662E981442@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5183d04270882c7da7fb77c8a4b26b9522cba0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop dependency on gcc >= 4.8 for efl options as it is guaranted since
commit dbe2d2e686281c19739824d4d4faec62187d1779 which added a dependency
on gcc >= 4.9 for efl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index d4a8762de0..305d1469a7 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -143,15 +143,11 @@ comment "Warning: one of the recommended option for EFL is not enabled"
 
 config BR2_PACKAGE_EFL_EOLIAN_CPP
 	bool "Enable Eolian C++ bindings"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # Eolian needs C++11
 	help
 	  Eolian is an EO object parser and code generator.
 	  With this option enabled Eolian will handle automatic
 	  generation of EFL bindings for the C++11 language.
 
-comment "Eolian needs gcc >= 4.8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
 comment "libecore video support"
 
 config BR2_PACKAGE_EFL_FB
@@ -270,17 +266,11 @@ config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
-comment "SVG loader needs a toolchain w/ gcc >= 4.8"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
 endif # BR2_PACKAGE_EFL
 
 comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar"
