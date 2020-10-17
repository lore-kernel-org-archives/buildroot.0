From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 21:26:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix build with UTP
Message-ID: <20201017192651.3739425-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update first patch to fix build of transmission 3.00 with UTP

Fixes:
 - http://autobuild.buildroot.org/results/bbfb61cf911fb29dcc02626f6eb47fff9e5e64f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/transmission/0001-fix-utypes.patch | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/transmission/0001-fix-utypes.patch b/package/transmission/0001-fix-utypes.patch
index 96403a6c36..e0bc633bd4 100644
--- a/package/transmission/0001-fix-utypes.patch
+++ b/package/transmission/0001-fix-utypes.patch
@@ -6,10 +6,13 @@ The corresponding upstream bug report (unfixed) can be found here:
 https://trac.transmissionbt.com/ticket/5232
 
 Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+[Fabrice: remove HAVE_STDBOOL_H as it is never defined since
+https://github.com/transmission/transmission/commit/f27596238d37f14477cc474c62c52eb53c4dcea6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 --- transmission-2.82.org/third-party/libutp/utypes.h	2013-08-09 04:47:43.000000000 +0200
 +++ transmission-2.82/third-party/libutp/utypes.h	2014-01-02 20:17:18.000000000 +0100
-@@ -35,8 +35,15 @@
+@@ -35,8 +35,11 @@
  typedef const char * cstr;
  typedef char * str;
  
@@ -20,11 +23,7 @@ Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 +//typedef uint8 bool;
 +//#endif
 +#ifndef __cplusplus
-+#ifdef HAVE_STDBOOL_H
 +#include <stdbool.h>
-+#else
-+typedef uint8 bool;
-+#endif
 +#endif
  
  #endif //__UTYPES_H__
-- 
2.28.0
