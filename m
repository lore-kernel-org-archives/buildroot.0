From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 09:43:27 +0100
Subject: [Buildroot] [git commit] parted: add readline bump fix patch
Message-ID: <20140302084407.9ADAE9936E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d89fd2b7c09af47f2d1b81cfa4de45a421d8a83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1e9/1e90929bfaf617381d490dc0b99f333968624ce7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../parted/parted-001-readline-deprecated.patch    |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/parted/parted-001-readline-deprecated.patch b/package/parted/parted-001-readline-deprecated.patch
new file mode 100644
index 0000000..a3f40c8
--- /dev/null
+++ b/package/parted/parted-001-readline-deprecated.patch
@@ -0,0 +1,19 @@
+The CPPFunction typedef (among others) have been deprecated in favour of
+specific prototyped typedefs since readline 4.2.
+It's been working since because compatibility typedefs have been
+in place until they were removed in readline 6.3.
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
