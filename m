From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:13:09 +0100
Subject: [Buildroot] [git commit] package/eudev: fix build with kernel < 4.8
Message-ID: <20181206200938.4575C8793F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b4fd3db85e958ee1f5e2c3b0ec65b5d7f81a2fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

KEY_ALS_TOGGLE has been added in kernel 4.8 with
https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c

So add it to missing.h to fix build with kernel older than 4.8

Fixes:
 - http://autobuild.buildroot.org/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.con>
[Thomas: update upstream status.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch b/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
new file mode 100644
index 0000000000..97dac3fe81
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
+[Upstream: https://github.com/gentoo/eudev/commit/2cb6b734de901dda6e631de5dffbd4cb8e165cbb]
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
