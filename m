From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Feb 2020 19:06:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: depends on host gcc >=
 4.9
Message-ID: <20200216180613.908370-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 88bb278d5ac790bee0c3a438464da82ee7625cff forgot to propagate the
new host gcc >= 4.9 dependency from BR2_PACKAGE_LIBSIGROKCXX

Fixes:
 - http://autobuild.buildroot.org/results/5dc9dc95d0534b35e2443c120162b5176edafe0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseview/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 01e522e1c5..ea9bdc2605 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on !BR2_STATIC_LIBS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
@@ -26,9 +27,10 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 4.9"
+comment "pulseview needs a toolchain w/ locale, wchar, threads, dynamic library, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE
+		|| BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.24.1
