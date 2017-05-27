From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 19:27:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/openpowerlink: disable demos for
	static builds
Message-ID: <20170527172745.9020-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f43/f437d09ac6c689c911e1885b95da33b692f2cb3c/
http://autobuild.buildroot.net/results/385/3859dc0f4de7e3284a96d5841f040f69f71842df/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openpowerlink/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 68ea75195..f00d6377b 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -113,6 +113,8 @@ config BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER
 	bool "PCIe Powerlink Driver"
 	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
 
+if !BR2_STATIC_LIBS
+
 menu "demos"
 
 config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
@@ -125,4 +127,13 @@ config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
 
 endmenu
 
+endif
+
+if BR2_STATIC_LIBS
+
+comment "demos needs a toolchain w/ dynamic library"
+	depends on  BR2_STATIC_LIBS
+
+endif
+
 endif # BR2_PACKAGE_OPENPOWERLINK
-- 
2.11.0
