From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Sat, 20 Dec 2014 15:22:12 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: make LOGIN_FAIL_DELAY configurable
Message-ID: <1419085332-379-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass LOGIN_FAIL_DELAY=<seconds> in busybox's CONFIG_EXTRA_CFLAGS
to change default delay of 3 seconds.

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 .../busybox/busybox-0007-login-fail-delay.patch    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/busybox/busybox-0007-login-fail-delay.patch

diff --git a/package/busybox/busybox-0007-login-fail-delay.patch b/package/busybox/busybox-0007-login-fail-delay.patch
new file mode 100644
index 0000000..158088d
--- /dev/null
+++ b/package/busybox/busybox-0007-login-fail-delay.patch
@@ -0,0 +1,28 @@
+From 782002e319d01aba1ddf77419ace633998320866 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Sat, 20 Dec 2014 14:35:56 +0100
+Subject: [PATCH] make LOGIN_FAIL_DELAY configurable
+
+Pass LOGIN_FAIL_DELAY=<seconds> in busybox's CONFIG_EXTRA_CFLAGS
+to change default delay of 3 seconds.
+---
+ include/libbb.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/libbb.h b/include/libbb.h
+index 64167bb..60c7013 100644
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -1252,7 +1252,9 @@ char *bb_simplify_path(const char *path) FAST_FUNC;
+ /* Returns ptr to NUL */
+ char *bb_simplify_abs_path_inplace(char *path) FAST_FUNC;
+ 
++#ifndef LOGIN_FAIL_DELAY
+ #define LOGIN_FAIL_DELAY 3
++#endif
+ extern void bb_do_delay(int seconds) FAST_FUNC;
+ extern void change_identity(const struct passwd *pw) FAST_FUNC;
+ extern void run_shell(const char *shell, int loginshell, const char *command, const char **additional_args) NORETURN FAST_FUNC;
+-- 
+1.9.1
+
-- 
1.9.1
