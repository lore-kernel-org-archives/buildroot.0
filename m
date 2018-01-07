From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:28:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 build with composite support disabled
Message-ID: <20180107203114.97BFC80753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=932f11152018e1f49750ed763e1213ff92e76c75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream to fix
http://autobuild.buildroot.net/results/44e/44e29c2fb5d236a66e0466698fbc9201a37dbc63/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...clude-compositeext.h-if-COMPOSITE-is-supp.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch b/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch
new file mode 100644
index 0000000..93be91a
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch
@@ -0,0 +1,31 @@
+From d16133e3e293fe16b291114d344fbd5a61d5ed65 Mon Sep 17 00:00:00 2001
+From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Date: Thu, 20 Jul 2017 19:48:26 -0700
+Subject: [PATCH] glx: Only include compositeext.h if COMPOSITE is
+ supported
+
+Regressed-in: ea483af99a6351323afe00a0b630cd63310efdb1
+Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ glx/glxscreens.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/glx/glxscreens.c b/glx/glxscreens.c
+index 78e0aaff9..609661274 100644
+--- a/glx/glxscreens.c
++++ b/glx/glxscreens.c
+@@ -43,7 +43,10 @@
+ #include "glxutil.h"
+ #include "glxext.h"
+ #include "protocol-versions.h"
++
++#ifdef COMPOSITE
+ #include "compositeext.h"
++#endif
+ 
+ static DevPrivateKeyRec glxScreenPrivateKeyRec;
+ 
+-- 
+2.11.0
+
