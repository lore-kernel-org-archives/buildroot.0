From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2014 14:56:22 +0100
Subject: [Buildroot] [git commit] transmission: Fix line feeds in patch file
Message-ID: <20140106135710.D6DE09C25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c991fabfcfb1984befc7a9ea5701f7de507b16fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream code has DOS line endings...

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../transmission/transmission-01-fix-utypes.patch  |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

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
