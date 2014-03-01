From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 16:21:03 -0300
Subject: [Buildroot] [PATCH 1/2] lvm2: add readline bump fix patch
Message-ID: <1393701664-7513-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d6f/d6f4d388c62ec2137560aabbff46c4a30c584e18/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lvm2/lvm2-001-readline-deprecated.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/lvm2/lvm2-001-readline-deprecated.patch

diff --git a/package/lvm2/lvm2-001-readline-deprecated.patch b/package/lvm2/lvm2-001-readline-deprecated.patch
new file mode 100644
index 0000000..15dc626
--- /dev/null
+++ b/package/lvm2/lvm2-001-readline-deprecated.patch
@@ -0,0 +1,19 @@
+The CPPFunction typedef (among others) have been deprecated in favour of
+specific prototyped typedefs since readline 4.2.
+They've been working since because compatibility typedefs have been
+until they were removed in readline 6.3.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura LVM2.2.02.103.orig/tools/lvm.c LVM2.2.02.103/tools/lvm.c
+--- LVM2.2.02.103.orig/tools/lvm.c	2014-03-01 16:10:57.902422044 -0300
++++ LVM2.2.02.103/tools/lvm.c	2014-03-01 16:11:34.791598230 -0300
+@@ -185,7 +185,7 @@
+ 	char *input = NULL, *args[MAX_ARGS], **argv;
+ 
+ 	rl_readline_name = "lvm";
+-	rl_attempted_completion_function = (CPPFunction *) _completion;
++	rl_attempted_completion_function = (rl_completion_func_t *) _completion;
+ 
+ 	_read_history(cmd);
+ 
-- 
1.8.3.2
