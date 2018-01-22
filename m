From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon, 22 Jan 2018 11:30:01 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: add patch to remove pid_t error
Message-ID: <20180122103001.26798-1-laurent_pubs@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added #include <sys/types.h> to fix unknown type 'pid_t' errors.

Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
---
 .../open-lldp/0004-fixed-unknown-type-pid_t.patch  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/open-lldp/0004-fixed-unknown-type-pid_t.patch

diff --git a/package/open-lldp/0004-fixed-unknown-type-pid_t.patch b/package/open-lldp/0004-fixed-unknown-type-pid_t.patch
new file mode 100644
index 0000000000..2d3b9148e0
--- /dev/null
+++ b/package/open-lldp/0004-fixed-unknown-type-pid_t.patch
@@ -0,0 +1,41 @@
+From 41e9e6b5aa13d65480cc960a7f15f97d74d64090 Mon Sep 17 00:00:00 2001
+From: Laurent Charpentier <laurent_pubs@yahoo.com>
+Date: Mon, 22 Jan 2018 10:49:45 +0100
+Subject: [PATCH] fixed unknown type pid_t
+
+Fixed 'unknown type pid_t' gcc compile error in dcbtool_cmds.c and
+lldptool_cmds.c
+
+Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
+---
+ dcbtool_cmds.c  | 1 +
+ lldptool_cmds.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/dcbtool_cmds.c b/dcbtool_cmds.c
+index a5cd0fe..ee5c144 100644
+--- a/dcbtool_cmds.c
++++ b/dcbtool_cmds.c
+@@ -27,6 +27,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <ctype.h>
++#include <sys/types.h>
+ #include "clif.h"
+ #include "dcbtool.h"
+ #include "lldp_dcbx_cmds.h"
+diff --git a/lldptool_cmds.c b/lldptool_cmds.c
+index daef8c8..c793e34 100644
+--- a/lldptool_cmds.c
++++ b/lldptool_cmds.c
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <ctype.h>
++#include <sys/types.h>
+ #include "clif.h"
+ #include "dcb_types.h"
+ #include "lldptool.h"
+-- 
+2.14.3
+
-- 
2.14.3
