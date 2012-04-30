From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Apr 2012 19:08:37 +0200
Subject: [Buildroot] [git commit] uboot-tools: fix build breakage
Message-ID: <20120430184249.9C5CF96C30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a389ebb12c256f210c0a82bf594fcd5c0efa096a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix uboot-tools build breakage as reported by Peter Korsgaard.
Previously config.h was included in imximage.h but not the fw_env tool.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-tools-2012.04.01-drop-configh-from-tools.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch
new file mode 100644
index 0000000..2b3a0e5
--- /dev/null
+++ b/package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch
@@ -0,0 +1,31 @@
+From 39857718f4df9b40a7acf38b73140fd86c628ef0 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 30 Apr 2012 09:07:38 -0300
+Subject: [PATCH] fw_env: allow it to build without a config
+
+We need to build u-boot tools without a board configuration for the
+target packages.
+fw_env just uses config.h to define the default environment of the
+created image, so it really isn't mandatory.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tools/env/fw_env.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index e292d2b..2bb061a 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -45,8 +45,6 @@
+ 
+ #include "fw_env.h"
+ 
+-#include <config.h>
+-
+ #define WHITESPACE(c) ((c == '\t') || (c == ' '))
+ 
+ #define min(x, y) ({				\
+-- 
+1.7.3.4
+
