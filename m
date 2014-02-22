From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:46:02 +0100
Subject: [Buildroot] [git commit] qt5: needs NPTL threads
Message-ID: <20140228133416.2C0B79BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0f42cdd3701ab424b7f4232d736c75f38afb549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/70b/70b77e7a5b292e3fcbcf8cab4651c48220f2bd17/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b62a810..5713c41 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -6,10 +6,10 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
+comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++"
 	depends on !BR2_PACKAGE_QT
 	depends on !BR2_avr32
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
@@ -17,7 +17,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_PACKAGE_QT
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
