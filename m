From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Nov 2017 10:00:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: needs threads
Message-ID: <20171112090000.8976-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added a mandatory pthread check:
https://github.com/libimobiledevice/libplist/commit/eec2e855b4f192cb1808d1f02b6bc8935a979025

Fixes
http://autobuild.buildroot.net/results/863/863bb43db222f8e63d60b1fc4a53299575727de1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplist/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index 4a9575f545..5a246b4ecd 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBPLIST
 	bool "libplist"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
 
 	  http://www.libimobiledevice.org/
 
-comment "libplist needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libplist needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
