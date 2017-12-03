From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Dec 2017 22:24:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mediaportal-tvserver: fix
 build with glibc 2.26
Message-ID: <20171203212417.1569-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that this package includes its own copy of live555:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/52#issuecomment-258505810

 ...1-live555-remove-xlocale.h-from-Locale.hh.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch

diff --git a/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch b/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
new file mode 100644
index 0000000000..7abb153b0e
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
@@ -0,0 +1,33 @@
+From 64b264d141fd80991ac071c5370802e2d7394f6d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 3 Dec 2017 22:17:12 +0100
+Subject: [PATCH] live555: remove xlocale.h from Locale.hh
+
+Fixes build error with glibc 2.26:
+https://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27
+
+Patch sent upstream:
+https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/79
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/live555/liveMedia/include/Locale.hh | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/lib/live555/liveMedia/include/Locale.hh b/src/lib/live555/liveMedia/include/Locale.hh
+index b327948..c4b4f4a 100644
+--- a/src/lib/live555/liveMedia/include/Locale.hh
++++ b/src/lib/live555/liveMedia/include/Locale.hh
+@@ -43,9 +43,6 @@ along with this library; if not, write to the Free Software Foundation, Inc.,
+ 
+ #ifndef LOCALE_NOT_USED
+ #include <locale.h>
+-#ifndef XLOCALE_NOT_USED
+-#include <xlocale.h> // because, on some systems, <locale.h> doesn't include <xlocale.h>; this makes sure that we get both
+-#endif
+ #endif
+ 
+ 
+-- 
+2.11.0
+
-- 
2.11.0
