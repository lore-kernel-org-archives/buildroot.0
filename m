From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Jun 2018 20:06:40 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: fix build with some glibc
Message-ID: <20180618180640.12324-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to define _GNU_SOURCE before using S_IF{DIR,REG}

Fixes:
 - http://autobuild.buildroot.net/results/7dcfb6ca9d14a5cd6872590065549356f1ab42a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ckets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch

diff --git a/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch b/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch
new file mode 100644
index 0000000000..88f9cbd94a
--- /dev/null
+++ b/package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch
@@ -0,0 +1,34 @@
+From d4442c3df7552756f53e656e446bc1bd7dc79a88 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 18 Jun 2018 19:52:58 +0200
+Subject: [PATCH] websockets: _GNU_SOURCE needed for S_IF{DIR,REG}
+
+Define of _GNU_SOURCE is needed to be able to use S_IFDIR and S_IFREG in
+src/websockets.c
+
+Fixes:
+ - http://autobuild.buildroot.net/results/7dcfb6ca9d14a5cd6872590065549356f1ab42a0
+
+[Upstream status: https://github.com/eclipse/mosquitto/pull/862]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/websockets.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/websockets.c b/src/websockets.c
+index 1e513ae..7722b4d 100644
+--- a/src/websockets.c
++++ b/src/websockets.c
+@@ -29,6 +29,8 @@ POSSIBILITY OF SUCH DAMAGE.
+ 
+ #ifdef WITH_WEBSOCKETS
+ 
++#define _GNU_SOURCE
++
+ #include "config.h"
+ 
+ #include <libwebsockets.h>
+-- 
+2.14.1
+
-- 
2.14.1
