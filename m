From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 17:26:22 +0200
Subject: [Buildroot] [git commit] packags: fix typo in gcc version dependency
Message-ID: <20200420151306.CE2FF8F498@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb4b143a092f69780d1e9aa4441edef1389d3f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 24c66484e1 (package/qt5: bump minimum gcc requirement to 5.0)
increased the dependency on the gcc version, but used the incorrect
BR2_TOOLCHAIN_GCC_AT_LEAST_5_0, instead of BR2_TOOLCHAIN_GCC_AT_LEAST_5.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - also fix pinentry and wireshark
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pinentry/Config.in  | 4 ++--
 package/qt5/Config.in       | 4 ++--
 package/wireshark/Config.in | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 23f532e2e6..40e5b3eedd 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -61,7 +61,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5
@@ -73,7 +73,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		BR2_STATIC_LIBS
 
 endif
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index cd9c93735d..c716919476 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -16,14 +16,14 @@ comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # C++11, GCC_BUG_57694
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index f55cfeb497..383897c5dd 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qt5
 	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
@@ -39,7 +39,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 5.0"
 	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_WIRESHARK
 
