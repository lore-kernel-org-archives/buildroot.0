From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 20:33:50 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libv4l: fix musl
 build
Message-ID: <20191222204327.90B108D6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7a3aa800181d46bbc43175cf50a00f11ed1d6f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes:
http://autobuild.buildroot.net/results/bf8/bf88f89bdb966ef54938e4274114d4afe5668b1f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5a33f5e73df7f0a12d11a3a542d7f158b9ce0684)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....h-add-missing-includes-to-fix-musl-build.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
new file mode 100644
index 0000000000..238f8fc377
--- /dev/null
+++ b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
@@ -0,0 +1,68 @@
+From baba68cdcb44fc11d0ba8ce2c13eb5b06bbd9b33 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 30 Oct 2019 07:15:23 +0100
+Subject: [PATCH] keymap.h: add missing includes to fix musl build
+
+Needed to fix these build errors:
+
+In file included from keymap.c:13:0:
+keymap.h:23:2: error: unknown type name 'u_int32_t'
+  u_int32_t scancode;
+
+keymap.h:36:1: error: unknown type name 'error_t'
+ error_t parse_keymap(char *fname, struct keymap **keymap, bool verbose);
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch was not sent upstream due to broken mailing list setup:
+
+<majordomo@vger.kernel.org>: host vger.kernel.org[209.132.180.67] said: 553
+    5.7.1 Hello [xx.xx.xx.xx], for your MAIL FROM address
+    <bernd.kuhls@t-online.de> policy analysis reported: Your address is not
+    liked source for email (in reply to MAIL FROM command)
+
+Hello [xx.xx.xx.xx], for your MAIL FROM address <berndkuhls@hotmail.com>
+ policy analysis reported: Your address is not liked source for email 
+
+ utils/common/keymap.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utils/common/keymap.h b/utils/common/keymap.h
+index f2b29632..bb1edce9 100644
+--- a/utils/common/keymap.h
++++ b/utils/common/keymap.h
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
++
++#include <argp.h>
++#include <sys/types.h>
++
+ #ifndef __KEYMAP_H
+ #define __KEYMAP_H
+ 
+diff -uNr v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h v4l-utils-1.18.0/utils/ir-ctl/keymap.h
+--- v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h	2019-09-22 11:22:54.000000000 +0200
++++ v4l-utils-1.18.0/utils/ir-ctl/keymap.h	2019-10-30 07:06:18.250548011 +0100
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
++
++#include <argp.h>
++#include <sys/types.h>
++
+ #ifndef __KEYMAP_H
+ #define __KEYMAP_H
+ 
+diff -uNr v4l-utils-1.18.0.orig/utils/keytable/keymap.h v4l-utils-1.18.0/utils/keytable/keymap.h
+--- v4l-utils-1.18.0.orig/utils/keytable/keymap.h	2019-09-22 11:22:54.000000000 +0200
++++ v4l-utils-1.18.0/utils/keytable/keymap.h	2019-10-30 07:06:56.218816126 +0100
+@@ -1,4 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
++
++#include <argp.h>
++#include <sys/types.h>
++
+ #ifndef __KEYMAP_H
+ #define __KEYMAP_H
+ 
+-- 
+2.20.1
