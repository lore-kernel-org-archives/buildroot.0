From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:24:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/linknx: fix musl build
Message-ID: <1453587879-22068-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3f0/3f0269a7b71c6d022d4ba1868b3beffdd21617a4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linknx/0001-musl-cdefs.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/linknx/0001-musl-cdefs.patch

diff --git a/package/linknx/0001-musl-cdefs.patch b/package/linknx/0001-musl-cdefs.patch
new file mode 100644
index 0000000..0304752
--- /dev/null
+++ b/package/linknx/0001-musl-cdefs.patch
@@ -0,0 +1,32 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr linknx-0.0.1.32.org/include/eibclient.h linknx-0.0.1.32/include/eibclient.h
+--- linknx-0.0.1.32.org/include/eibclient.h	2007-10-11 01:55:33.000000000 +0200
++++ linknx-0.0.1.32/include/eibclient.h	2016-01-23 23:21:17.315006629 +0100
+@@ -27,11 +27,12 @@
+ #ifndef EIBCLIENT_H
+ #define EIBCLIENT_H
+ 
+-#include "sys/cdefs.h"
+ #include "stdint.h"
+ #include <pthsem.h>
+ 
+-__BEGIN_DECLS;
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ #include "eibloadresult.h"
+ 
+@@ -705,5 +706,8 @@
+  */
+ int EIB_LoadImage_async (EIBConnection * con, const uint8_t * image, int len);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++
+ #endif
-- 
2.7.0.rc3
