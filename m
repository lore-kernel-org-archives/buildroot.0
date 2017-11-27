From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 16:43:52 +0100
Subject: [Buildroot] [PATCH] package/systemd-bootchart: fix build w/ glibc
 2.26
Message-ID: <20171127154352.25169-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/7f7af0d41120626edbbca839c9fdbb5c6bd259c2/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 .../0001-parse-util-Don-t-use-xlocale.h-35.patch   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch

diff --git a/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch b/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch
new file mode 100644
index 0000000000..4eae7e65e4
--- /dev/null
+++ b/package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch
@@ -0,0 +1,32 @@
+From 15062a4501a1dffccd7cb6374b415693fa4435bf Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 18 Jul 2017 22:55:50 +0300
+Subject: [PATCH] parse-util: Don't use xlocale.h (#35)
+
+glibc 2.26 no longer contains the non-standard xlocale.h
+(http://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27)
+
+This change shouldn't break anything as xlocale.h was a subset of
+locale.h.
+
+[yann.morin.1998 at free.fr: backported from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/parse-util.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/parse-util.c b/src/parse-util.c
+index 5635a68..1b2169c 100644
+--- a/src/parse-util.c
++++ b/src/parse-util.c
+@@ -21,7 +21,6 @@
+ #include <locale.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <xlocale.h>
+ 
+ #include "macro.h"
+ #include "parse-util.h"
+-- 
+2.11.0
+
-- 
2.11.0
