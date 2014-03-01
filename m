From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 16:21:04 -0300
Subject: [Buildroot] [PATCH 2/2] parted: add readline bump fix patch
In-Reply-To: <1393701664-7513-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393701664-7513-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393701664-7513-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1e9/1e90929bfaf617381d490dc0b99f333968624ce7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/parted/parted-001-readline-deprecated.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/parted/parted-001-readline-deprecated.patch

diff --git a/package/parted/parted-001-readline-deprecated.patch b/package/parted/parted-001-readline-deprecated.patch
new file mode 100644
index 0000000..989c029
--- /dev/null
+++ b/package/parted/parted-001-readline-deprecated.patch
@@ -0,0 +1,19 @@
+The CPPFunction typedef (among others) have been deprecated in favour of
+specific prototyped typedefs since readline 4.2.
+They've been working since because compatibility typedefs have been
+until they were removed in readline 6.3.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura parted-3.1.orig/parted/ui.c parted-3.1/parted/ui.c
+--- parted-3.1.orig/parted/ui.c	2014-03-01 16:11:41.970827134 -0300
++++ parted-3.1/parted/ui.c	2014-03-01 16:11:55.540259786 -0300
+@@ -1474,7 +1474,7 @@
+ #ifdef HAVE_LIBREADLINE
+   if (!opt_script_mode) {
+     rl_initialize ();
+-    rl_attempted_completion_function = (CPPFunction*) complete_function;
++    rl_attempted_completion_function = (rl_completion_func_t *) complete_function;
+     readline_state.in_readline = 0;
+   }
+ #endif
-- 
1.8.3.2
