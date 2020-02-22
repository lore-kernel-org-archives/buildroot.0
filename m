From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 19:39:50 +0100
Subject: [Buildroot] [git commit] package/bash: fix build on uclibc
Message-ID: <20200222182808.1F87888E6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03ec10a70f2a7fe7d587b15a04e71c9624cd85bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/2ae2eca969e6d1febcacb8b0423ced3aad7505a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...17-input.h-add-missing-include-on-stdio.h.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/bash/0017-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0017-input.h-add-missing-include-on-stdio.h.patch
new file mode 100644
index 0000000000..fd008e9472
--- /dev/null
+++ b/package/bash/0017-input.h-add-missing-include-on-stdio.h.patch
@@ -0,0 +1,38 @@
+From 4fa85c85b9a76afd3b19ed75bf17ccd2940f1f55 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 16 Feb 2020 16:18:48 +0100
+Subject: [PATCH] input.h: add missing include on stdio.h
+
+This will fix the following build failure on uclibc:
+
+test -n "/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/bin/arm-linux-ranlib" && /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/host/bin/arm-linux-ranlib libsh.a
+In file included from ./exec.def:71:
+../input.h:76:3: error: unknown type name 'FILE'
+   FILE *file;
+   ^~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bfca306868df54c567215c45c8cdac838d02f567
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://savannah.gnu.org/support/?110196]
+---
+ input.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/input.h b/input.h
+index 6aef1269..08b0fdea 100644
+--- a/input.h
++++ b/input.h
+@@ -21,6 +21,8 @@
+ #if !defined (_INPUT_H_)
+ #define _INPUT_H_
+ 
++#include <stdio.h>
++
+ #include "stdc.h"
+ 
+ /* Function pointers can be declared as (Function *)foo. */
+-- 
+2.24.1
+
