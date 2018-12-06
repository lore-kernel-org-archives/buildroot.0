From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:15:57 +0100
Subject: [Buildroot] [git commit] package/lxc: fix missing include for
 va_list
Message-ID: <20181206201228.B9F4E8B429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c9c6e2685b7b376420eda814d249ac393aadbfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: update upstream status]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-stringutils-include-stdarg-for-va_list.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch b/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch
new file mode 100644
index 0000000000..b1fe989237
--- /dev/null
+++ b/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch
@@ -0,0 +1,30 @@
+From b7df06ad14c04f18b7db5b64d5142b802bf64cb2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Dec 2018 22:18:16 +0100
+Subject: [PATCH] stringutils: include stdarg for va_list
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/lxc/lxc/commit/b7df06ad14c04f18b7db5b64d5142b802bf64cb2]
+---
+ src/lxc/string_utils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/lxc/string_utils.h b/src/lxc/string_utils.h
+index 4065e4e6..d4e633cc 100644
+--- a/src/lxc/string_utils.h
++++ b/src/lxc/string_utils.h
+@@ -20,6 +20,8 @@
+ #ifndef __LXC_STRING_UTILS_H
+ #define __LXC_STRING_UTILS_H
+ 
++#include <stdarg.h>
++
+ #include "config.h"
+ 
+ #include "initutils.h"
+-- 
+2.14.1
+
