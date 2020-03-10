From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 09:19:02 +0100
Subject: [Buildroot] [PATCH v1 4/4] package/wireshark: add missing qt5
 dependencies
In-Reply-To: <20200310081902.3488-1-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
Message-ID: <20200310081902.3488-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  - BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
  - !BR2_arc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wireshark/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 382e429a9c..8e3bc7aad5 100644
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
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_arc
 
 endif # BR2_PACKAGE_WIRESHARK
 
-- 
2.25.1
