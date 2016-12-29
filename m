From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Thu, 29 Dec 2016 12:46:49 -0200
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
Message-ID: <20161229144649.29850-1-barbieri@profusion.mobi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing defines so eudev builds for older kernels such as 2.6

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
---
 package/eudev/0002-missing-defines-for-old-kernels.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/eudev/0002-missing-defines-for-old-kernels.patch

diff --git a/package/eudev/0002-missing-defines-for-old-kernels.patch b/package/eudev/0002-missing-defines-for-old-kernels.patch
new file mode 100644
index 000000000..d34020f04
--- /dev/null
+++ b/package/eudev/0002-missing-defines-for-old-kernels.patch
@@ -0,0 +1,16 @@
+--- a/src/udev/udev-builtin-input_id.c	2016-12-23 16:43:55.398985478 +0000
++++ b/src/udev/udev-builtin-input_id.c	2016-12-23 16:48:40.907182701 +0000
+@@ -33,6 +33,13 @@
+ #include "udev.h"
+ #include "util.h"
+ 
++#ifndef BTN_TRIGGER_HAPPY
++#define BTN_TRIGGER_HAPPY 0x2c0
++#endif
++#ifndef INPUT_PROP_MAX
++#define INPUT_PROP_MAX 0x1f
++#endif
++
+ /* we must use this kernel-compatible implementation */
+ #define BITS_PER_LONG (sizeof(unsigned long) * 8)
+ #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
-- 
2.11.0
