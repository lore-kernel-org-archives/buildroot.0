From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Dec 2019 22:24:14 +0100
Subject: [Buildroot] [PATCH v1] package/libv4l: fix musl compile (missing
 includes)
Message-ID: <20191207212414.27888-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/f6d14fa0827d5eba9e020f238399396a121a45d6

  keymap.h:23:2: error: unknown type name 'u_int32_t'
  keymap.h:36:1: error: unknown type name 'error_t'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...eymap.h-needs-sys-types.h-and-argp.h.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libv4l/0001-keymap.h-needs-sys-types.h-and-argp.h.patch

diff --git a/package/libv4l/0001-keymap.h-needs-sys-types.h-and-argp.h.patch b/package/libv4l/0001-keymap.h-needs-sys-types.h-and-argp.h.patch
new file mode 100644
index 0000000000..3d84744618
--- /dev/null
+++ b/package/libv4l/0001-keymap.h-needs-sys-types.h-and-argp.h.patch
@@ -0,0 +1,61 @@
+From a653aec55bdfa0edd2f7e4887edbbce16f792164 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 7 Dec 2019 22:02:17 +0100
+Subject: [PATCH] keymap.h needs sys/types.h and argp.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  keymap.h:23:2: error: unknown type name ?u_int32_t?
+  keymap.h:36:1: error: unknown type name ?error_t?
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/ir-ctl/bpf_encoder.c | 1 +
+ utils/ir-ctl/keymap.c      | 2 ++
+ utils/keytable/keymap.c    | 2 ++
+ 3 files changed, 5 insertions(+)
+
+diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
+index 82d12cc..e3e705e 100644
+--- a/utils/ir-ctl/bpf_encoder.c
++++ b/utils/ir-ctl/bpf_encoder.c
+@@ -5,6 +5,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <argp.h>
+ 
+ #include "keymap.h"
+ 
+diff --git a/utils/ir-ctl/keymap.c b/utils/ir-ctl/keymap.c
+index f574f24..d06deb5 100644
+--- a/utils/ir-ctl/keymap.c
++++ b/utils/ir-ctl/keymap.c
+@@ -9,6 +9,8 @@
+ #include <string.h>
+ #include <limits.h>
+ #include <stdbool.h>
++#include <sys/types.h>
++#include <argp.h>
+ 
+ #include "keymap.h"
+ #include "toml.h"
+diff --git a/utils/keytable/keymap.c b/utils/keytable/keymap.c
+index f574f24..d06deb5 100644
+--- a/utils/keytable/keymap.c
++++ b/utils/keytable/keymap.c
+@@ -9,6 +9,8 @@
+ #include <string.h>
+ #include <limits.h>
+ #include <stdbool.h>
++#include <sys/types.h>
++#include <argp.h>
+ 
+ #include "keymap.h"
+ #include "toml.h"
+-- 
+2.24.0
+
-- 
2.24.0
