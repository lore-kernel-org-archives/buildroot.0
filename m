From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jan 2017 21:01:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/eudev: fix build with gperf 3.1
Message-ID: <20170121200112.12593-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1a0/1a0e76e2782a63e2b2fc2fc0d79471802afa4d35/

Tested on current buildroot master (eb6bb3411) with and without
http://patchwork.ozlabs.org/patch/716134/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/0003-fix-build-with-gperf31.patch | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/eudev/0003-fix-build-with-gperf31.patch

diff --git a/package/eudev/0003-fix-build-with-gperf31.patch b/package/eudev/0003-fix-build-with-gperf31.patch
new file mode 100644
index 000000000..bec9565c3
--- /dev/null
+++ b/package/eudev/0003-fix-build-with-gperf31.patch
@@ -0,0 +1,27 @@
+From 5bab4d8de0dcbb8e2e7d4d5125b4aea1652a0d60 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Thu, 5 Jan 2017 16:21:17 -0500
+Subject: [PATCH] src/udev/udev-builtin-keyboard.c: fix build with gperf 3.1
+
+Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
+
+Downloaded from upstream commit:
+https://github.com/gentoo/eudev/commit/5bab4d8de0dcbb8e2e7d4d5125b4aea1652a0d60
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/udev/udev-builtin-keyboard.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/udev/udev-builtin-keyboard.c b/src/udev/udev-builtin-keyboard.c
+index 73171c3..fad3520 100644
+--- a/src/udev/udev-builtin-keyboard.c
++++ b/src/udev/udev-builtin-keyboard.c
+@@ -28,7 +28,6 @@
+ 
+ #include "udev.h"
+ 
+-static const struct key *keyboard_lookup_key(const char *str, unsigned len);
+ #include "keyboard-keys-from-name.h"
+ #include "keyboard-keys-to-name.h"
+ 
-- 
2.11.0
