From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 16:43:43 +0100
Subject: [Buildroot] [PATCH 4/4] package/dvblast: fix musl build
In-Reply-To: <cover.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <a138be83167445a8f88e8b028725cf6a48d45b37.1446219805.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix integer types: use intXX_t, not u_intXX_t.

Fixes:
    http://autobuild.buildroot.org/results/a43/a434372d84544116e7bb4a88c0ee437ae0578007/
    http://autobuild.buildroot.org/results/167/167efb284be47ae3e90fe7a8e6316e757b59cd3e/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
---
 package/dvblast/0002-fix-int-types.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/dvblast/0002-fix-int-types.patch

diff --git a/package/dvblast/0002-fix-int-types.patch b/package/dvblast/0002-fix-int-types.patch
new file mode 100644
index 0000000..0324f39
--- /dev/null
+++ b/package/dvblast/0002-fix-int-types.patch
@@ -0,0 +1,22 @@
+Integer types are uintXX_t not u_intXX_t
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN dvblast-3.0.orig/dvblast.h dvblast-3.0/dvblast.h
+--- dvblast-3.0.orig/dvblast.h	2015-10-05 17:51:14.000000000 +0200
++++ dvblast-3.0/dvblast.h	2015-10-30 16:29:25.586125193 +0100
+@@ -49,10 +49,10 @@
+  * Raw udp packet structure with flexible-array payload
+  *****************************************************************************/
+ struct udpheader { // FAVOR_BSD hell ...
+-  u_int16_t source;
+-  u_int16_t dest;
+-  u_int16_t len;
+-  u_int16_t check;
++  uint16_t source;
++  uint16_t dest;
++  uint16_t len;
++  uint16_t check;
+ };
+ 
+ #if defined(__FreeBSD__) || defined(__APPLE__)
-- 
1.9.1
