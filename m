From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 13:13:37 +0200
Subject: [Buildroot] [git commit] glibmm: bump required gcc version to 4.9
Message-ID: <20171021112312.1152280AD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffdd67faee5b29e61cbb20e0965eb708f9746acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/052905b339c6aecc33e9b91d9cc658baeb51ed8f/

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: propagate to pulseview.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atkmm/Config.in     | 6 +++---
 package/glibmm/Config.in    | 6 +++---
 package/gtkmm3/Config.in    | 6 +++---
 package/libsigrok/Config.in | 6 +++---
 package/libxmlpp/Config.in  | 6 +++---
 package/pangomm/Config.in   | 6 +++---
 package/pulseview/Config.in | 6 +++---
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index edc8383..ce1e24d 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ATKMM
 	bool "atkmm"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
 	depends on BR2_USE_MMU # atk/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ATKMM
 
 	  http://www.gtkmm.org/
 
-comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index 7218db2..c7b4082 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # regex_replace
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBMM
 
 	  http://www.gtkmm.org/
 
-comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index ef62a1f..8762c72 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,7 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 658d029..fb74bea 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -24,14 +24,14 @@ if BR2_PACKAGE_LIBSIGROK
 config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # glibmm
 	select BR2_PACKAGE_GLIBMM
 	help
 	  Build libsigrok C++ bindings as well.
 
-comment "C++ bindings need a toolchain w/ C++, gcc >= 4.8"
+comment "C++ bindings need a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
 
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 6d957ff..7244586 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBXMLPP
 	bool "libxml++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBXMLPP
 
 	  http://libxmlplusplus.sourceforge.net/
 
-comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		||!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 08c6064..0702b8c 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PANGOMM
 	bool "pangomm"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
@@ -15,8 +15,8 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 926376e..301acf7 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_PULSEVIEW
 	# libsigrok->libzip
 	depends on !BR2_STATIC_LIBS
 	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5BASE_WIDGETS
@@ -26,8 +26,8 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ wchar, threads, dynamic library, C++, gcc >= 4.8"
+comment "pulseview needs a toolchain w/ wchar, threads, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
