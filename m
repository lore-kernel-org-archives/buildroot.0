From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  5 Dec 2018 08:25:30 +0100
Subject: [Buildroot] [PATCH 1/1] eudev: fix build with kernel < 4.8
Message-ID: <20181205072530.23932-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

KEY_ALS_TOGGLE has been added in kernel 4.8 with
https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c

So add it to missing.h to fix build with kernel older than 4.8

Fixes:
 - http://autobuild.buildroot.org/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch

diff --git a/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch b/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
new file mode 100644
index 0000000000..93d3f6d696
--- /dev/null
+++ b/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
@@ -0,0 +1,34 @@
+From cad87bd3d8aa9046af0872e8c22f4a3c8fafdc78 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 4 Dec 2018 22:38:37 +0100
+Subject: [PATCH] missing.h: add KEY_ALS_TOGGLE
+
+KEY_ALS_TOGGLE has been added in kernel 4.8 with
+https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
+
+So add it to missing.h to fix build with kernel older than 4.8
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/gentoo/eudev/pull/162]
+---
+ src/shared/missing.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index bebbb42be..b5b2e1194 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -179,3 +179,7 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+ #ifndef INPUT_PROP_MAX
+ #define INPUT_PROP_MAX 0x1f
+ #endif
++
++#ifndef KEY_ALS_TOGGLE
++#define KEY_ALS_TOGGLE 0x7a
++#endif
+-- 
+2.14.1
+
-- 
2.14.1
