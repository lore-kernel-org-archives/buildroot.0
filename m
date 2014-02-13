From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 14:22:07 +0100
Subject: [Buildroot] [PATCH 6/6] qt5: needs NPTL threads
In-Reply-To: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392297727-17627-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/70b/70b77e7a5b292e3fcbcf8cab4651c48220f2bd17/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b62a810..597dbd1 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -6,10 +6,10 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y
 
-comment "Qt5 needs a toolchain w/ wchar, IPv6, threads, C++"
+comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL threads, C++"
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
-- 
1.8.3.2
