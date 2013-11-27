From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 10:24:17 -0300
Subject: [Buildroot] [PATCHv2] iptables: patch another static linking issue
Message-ID: <1385558657-17556-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e4a/e4a0f93e2abdad0222063b3f71970ee1c5940f3a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ip-6-tables-save.c-remove-dlfcn.h-include.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch

diff --git a/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch b/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
new file mode 100644
index 0000000..1cdc6c0
--- /dev/null
+++ b/package/iptables/iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch
@@ -0,0 +1,47 @@
+From 2efdcf332a40431c6584970bb0c68712d14d409b Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 27 Nov 2013 10:18:11 -0300
+Subject: [PATCH] iptables/ip(6)tables-save.c: remove dlfcn.h include
+
+It's not required and breaks on static-only uClibc builds which don't
+have the header file.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ iptables/ip6tables-save.c | 4 ----
+ iptables/iptables-save.c  | 4 ----
+ 2 files changed, 8 deletions(-)
+
+diff --git a/iptables/ip6tables-save.c b/iptables/ip6tables-save.c
+index d819b30..a86a64a 100644
+--- a/iptables/ip6tables-save.c
++++ b/iptables/ip6tables-save.c
+@@ -18,10 +18,6 @@
+ #include "ip6tables.h"
+ #include "ip6tables-multi.h"
+ 
+-#ifndef NO_SHARED_LIBS
+-#include <dlfcn.h>
+-#endif
+-
+ static int show_counters = 0;
+ 
+ static const struct option options[] = {
+diff --git a/iptables/iptables-save.c b/iptables/iptables-save.c
+index e599fce..2999c7f 100644
+--- a/iptables/iptables-save.c
++++ b/iptables/iptables-save.c
+@@ -17,10 +17,6 @@
+ #include "iptables.h"
+ #include "iptables-multi.h"
+ 
+-#ifndef NO_SHARED_LIBS
+-#include <dlfcn.h>
+-#endif
+-
+ static int show_counters = 0;
+ 
+ static const struct option options[] = {
+-- 
+1.8.3.2
+
-- 
1.8.3.2
