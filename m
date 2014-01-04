From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 09:51:10 +0100
Subject: [Buildroot] [PATCH 1/1] transmission: Fix line feeds in patch file
Message-ID: <BLU0-SMTP20778F191E3944FD27E1226D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream code has DOS line endings...

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---

fixes http://autobuild.buildroot.net/results/f24/f245aab1dad05340a50a6f4c42c8b40ffde836ea/

 .../transmission/transmission-01-fix-utypes.patch  |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/transmission/transmission-01-fix-utypes.patch b/package/transmission/transmission-01-fix-utypes.patch
index e67ba6a..96403a6 100644
--- a/package/transmission/transmission-01-fix-utypes.patch
+++ b/package/transmission/transmission-01-fix-utypes.patch
@@ -10,12 +10,12 @@ Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 --- transmission-2.82.org/third-party/libutp/utypes.h	2013-08-09 04:47:43.000000000 +0200
 +++ transmission-2.82/third-party/libutp/utypes.h	2014-01-02 20:17:18.000000000 +0100
 @@ -35,8 +35,15 @@
- typedef const char * cstr;
- typedef char * str;
- 
--#ifndef __cplusplus
--typedef uint8 bool;
--#endif
+ typedef const char * cstr;
+ typedef char * str;
+ 
+-#ifndef __cplusplus
+-typedef uint8 bool;
+-#endif
 +//#ifndef __cplusplus
 +//typedef uint8 bool;
 +//#endif
@@ -26,5 +26,5 @@ Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 +typedef uint8 bool;
 +#endif
 +#endif
- 
- #endif //__UTYPES_H__
+ 
+ #endif //__UTYPES_H__
-- 
1.7.9.5
