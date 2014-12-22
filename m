From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 14:57:53 +0100
Subject: [Buildroot] [git commit] busybox: Make it possible to override
	LOGIN_FAIL_DELAY in CONFIG_EXTRA_CFLAGS
Message-ID: <20141222140013.DCACB8072E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5305e1898f05a1a7ce4c3ce55393e6d8a5300909
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../busybox/busybox-0007-login-fail-delay.patch    |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-0007-login-fail-delay.patch b/package/busybox/busybox-0007-login-fail-delay.patch
new file mode 100644
index 0000000..0e2bb2e
--- /dev/null
+++ b/package/busybox/busybox-0007-login-fail-delay.patch
@@ -0,0 +1,32 @@
+From a6588fa10230e7b87990482773a445701abbaae8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Mon, 22 Dec 2014 01:55:54 +0100
+Subject: [PATCH 1/1] Make it possible to override LOGIN_FAIL_DELAY in
+ CONFIG_EXTRA_CFLAGS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ include/libbb.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/libbb.h b/include/libbb.h
+index 8e8b9ca..68a7cf0 100644
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -1271,7 +1271,9 @@ char *bb_simplify_path(const char *path) FAST_FUNC;
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
