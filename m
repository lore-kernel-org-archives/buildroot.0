From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:30:35 +0100
Subject: [Buildroot] [git commit] package/wireshark: add missing qt5
 dependencies
Message-ID: <20200315222221.5D3F181848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fade0f6088c4ef41733da5e72e1ed567b67e6db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
- !BR2_arc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 382e429a9c..e52edb9f69 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -21,6 +21,8 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5
+	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
@@ -34,9 +36,10 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
+	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif # BR2_PACKAGE_WIRESHARK
 
