From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 May 2016 14:13:20 +0300
Subject: [Buildroot] [PATCH] xorriso: fix musl build
Message-ID: <851221e66c460e766b01cb962c4a2f0c39863284.1464088400.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that adds the missing header for ssize_t.

Fixes:
http://autobuild.buildroot.net/results/820/82014874f5b97de8504d8409b286889b582a7454/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/xorriso/0001-fix-musl-build.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/xorriso/0001-fix-musl-build.patch

diff --git a/package/xorriso/0001-fix-musl-build.patch b/package/xorriso/0001-fix-musl-build.patch
new file mode 100644
index 000000000000..86d251d747a4
--- /dev/null
+++ b/package/xorriso/0001-fix-musl-build.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Add missing header needed for ssize_t.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: posted upstream
+(http://lists.gnu.org/archive/html/bug-xorriso/2016-05/msg00000.html)
+
+diff -Nuar xorriso-1.4.2-orig/libisofs/aaip_0_2.h xorriso-1.4.2/libisofs/aaip_0_2.h
+--- xorriso-1.4.2-orig/libisofs/aaip_0_2.h	2015-11-28 16:41:33.000000000 +0200
++++ xorriso-1.4.2/libisofs/aaip_0_2.h	2016-05-24 11:40:43.874191174 +0300
+@@ -16,6 +16,7 @@
+ #ifndef Aaip_h_is_includeD
+ #define Aaip_h_is_includeD yes
+ 
++#include <unistd.h>
+ 
+ /* --------------------------------- Encoder ---------------------------- */
+ 
-- 
2.8.1
