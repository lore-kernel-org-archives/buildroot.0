From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Sep 2019 22:09:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/luv: fix build without lua-compat53
In-Reply-To: <20190904200903.5198-1-fontaine.fabrice@gmail.com>
References: <20190904200903.5198-1-fontaine.fabrice@gmail.com>
Message-ID: <20190904200903.5198-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../luv/0001-src-luv.c-include-lua.h.patch    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/luv/0001-src-luv.c-include-lua.h.patch

diff --git a/package/luv/0001-src-luv.c-include-lua.h.patch b/package/luv/0001-src-luv.c-include-lua.h.patch
new file mode 100644
index 0000000000..ab3bd4c412
--- /dev/null
+++ b/package/luv/0001-src-luv.c-include-lua.h.patch
@@ -0,0 +1,29 @@
+From 3f2a0da968c6f438f422264a7e3e515e89247a22 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Sep 2019 21:39:40 +0200
+Subject: [PATCH] src/luv.c: include lua.h
+
+lua.h must be included before checking for LUA_VERSION_H otherwise we
+won't get the version and compat-5.3.h will always be needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/luvit/luv/pull/373]
+---
+ src/luv.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/luv.c b/src/luv.c
+index c009d76..284dd32 100644
+--- a/src/luv.c
++++ b/src/luv.c
+@@ -15,6 +15,7 @@
+  *
+  */
+ 
++#include <lua.h>
+ #if (LUA_VERSION_NUM != 503)
+ #include "c-api/compat-5.3.h"
+ #endif
+-- 
+2.23.0.rc1
+
-- 
2.23.0.rc1
