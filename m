From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jun 2019 22:19:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: remove patches
Message-ID: <20190624201941.13287-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both were committed upstream:
https://github.com/gentoo/eudev/commit/2cb6b734de901dda6e631de5dffbd4cb8e165cbb
https://github.com/gentoo/eudev/commit/906654a0ab73dd488b101a2047c3c6a1205f7548

Reported-by: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-missing.h-add-KEY_ALS_TOGGLE.patch   | 34 ------------------
 .../0003-missing.h-add-BTN_DPAD_UP.patch      | 35 -------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
 delete mode 100644 package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch

diff --git a/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch b/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
deleted file mode 100644
index 97dac3fe81..0000000000
--- a/package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cad87bd3d8aa9046af0872e8c22f4a3c8fafdc78 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 4 Dec 2018 22:38:37 +0100
-Subject: [PATCH] missing.h: add KEY_ALS_TOGGLE
-
-KEY_ALS_TOGGLE has been added in kernel 4.8 with
-https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
-
-So add it to missing.h to fix build with kernel older than 4.8
-
-Fixes:
- - http://autobuild.buildroot.org/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream: https://github.com/gentoo/eudev/commit/2cb6b734de901dda6e631de5dffbd4cb8e165cbb]
----
- src/shared/missing.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index bebbb42be..b5b2e1194 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -179,3 +179,7 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
- #ifndef INPUT_PROP_MAX
- #define INPUT_PROP_MAX 0x1f
- #endif
-+
-+#ifndef KEY_ALS_TOGGLE
-+#define KEY_ALS_TOGGLE 0x7a
-+#endif
--- 
-2.14.1
-
diff --git a/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch b/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch
deleted file mode 100644
index 08e5fd2b71..0000000000
--- a/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 981b8b997e119a117fada2731eeeb0475c511c8a Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Tue, 11 Dec 2018 07:56:20 +0100
-Subject: [PATCH] missing.h: add BTN_DPAD_UP
-
-As explained in issue 6267 of systemd [1], Linux < 3.11 does not
-provide definitions for BTN_DPAD_{UP,RIGHT}, which were introduced in
-[2].
-
-This patch fixes this issue.
-
-[1] https://github.com/systemd/systemd/pull/6267
-[2] https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/shared/missing.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index b5b2e1194..3a83c91a6 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -183,3 +183,8 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
- #ifndef KEY_ALS_TOGGLE
- #define KEY_ALS_TOGGLE 0x7a
- #endif
-+
-+#ifndef BTN_DPAD_UP
-+#define BTN_DPAD_UP 0x220
-+#define BTN_DPAD_RIGHT 0x223
-+#endif
--- 
-2.17.2
-
-- 
2.20.1
