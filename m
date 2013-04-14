From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 14 Apr 2013 08:36:04 +0100
Subject: [Buildroot] [PATCH] udev: fix avr32 and microblaze build failures
Message-ID: <1365924964-2907-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Adjust compiler flags for avr32 and microblaze, where the -Wtype-limits flag
is not available.

Fixes avr32 build failure http://autobuild.buildroot.net/results/5cbc55b8da883e6f30ecfa1295be0dc2a16ad58b

Fixes microblaze build failure http://autobuild.buildroot.net/results/7d98351aad27c9e5f7bfcdac0c243c1c6e0451f9

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/udev/udev-adjust-CFLAGS.patch |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/udev/udev-adjust-CFLAGS.patch

diff --git a/package/udev/udev-adjust-CFLAGS.patch b/package/udev/udev-adjust-CFLAGS.patch
new file mode 100644
index 0000000..6e4e110
--- /dev/null
+++ b/package/udev/udev-adjust-CFLAGS.patch
@@ -0,0 +1,33 @@
+Adjust compiler flags for avr32 and microblaze, where the -Wtype-limits flag
+is not available.
+
+Fixes avr32 build failure http://autobuild.buildroot.net/results/5cbc55b8da883e6f30ecfa1295be0dc2a16ad58b
+
+Fixes microblaze build failure http://autobuild.buildroot.net/results/7d98351aad27c9e5f7bfcdac0c243c1c6e0451f9
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/configure b/configure
+--- a/configure	2012-03-18 19:00:27.002435918 +0000
++++ b/configure	2013-04-13 09:15:14.652577458 +0100
+@@ -13430,7 +13430,7 @@ my_CFLAGS="-Wall \
+ -Wnested-externs -Wpointer-arith \
+ -Wpointer-arith -Wsign-compare -Wchar-subscripts \
+ -Wstrict-prototypes -Wshadow \
+--Wformat-security -Wtype-limits"
++-Wformat-security"
+ 
+ 
+ ac_config_headers="$ac_config_headers config.h"
+diff -Nurp a/configure.ac b/configure.ac
+--- a/configure.ac	2012-03-18 17:26:27.301301530 +0000
++++ b/configure.ac	2013-04-13 09:14:53.824627175 +0100
+@@ -189,7 +189,7 @@ my_CFLAGS="-Wall \
+ -Wnested-externs -Wpointer-arith \
+ -Wpointer-arith -Wsign-compare -Wchar-subscripts \
+ -Wstrict-prototypes -Wshadow \
+--Wformat-security -Wtype-limits"
++-Wformat-security"
+ AC_SUBST([my_CFLAGS])
+ 
+ AC_CONFIG_HEADERS(config.h)
-- 
1.7.10.4
