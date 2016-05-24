From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 13:21:26 +0200
Subject: [Buildroot] [git commit] xorriso: fix musl build
Message-ID: <20160524112145.2E1A481D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea3264fad0687186d30cb9fd8ab9832e79529d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that adds the missing header for ssize_t.

Fixes:
http://autobuild.buildroot.net/results/820/82014874f5b97de8504d8409b286889b582a7454/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xorriso/0001-fix-musl-build.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/xorriso/0001-fix-musl-build.patch b/package/xorriso/0001-fix-musl-build.patch
new file mode 100644
index 0000000..86d251d
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
