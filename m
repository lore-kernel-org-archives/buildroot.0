From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  3 May 2015 23:14:20 +0200
Subject: [Buildroot] [PATCH] package/autoconf-archive: fix ax_tls syntax
	error
Message-ID: <1430687660-29414-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ax_tls.m4 serial 11 produce a syntax error
in configure scripts.

Fixes:
http://autobuild.buildroot.net/results/619/619339810617212a667fe72278ec727ee992ffbf/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0001-AX_TLS-fix-syntax-error.patch             | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch

diff --git a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
new file mode 100644
index 0000000..431b6c5
--- /dev/null
+++ b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
@@ -0,0 +1,47 @@
+From cb6a769ba7ea8ff03849c455bbce4c5e9bdfa5a5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 3 May 2015 23:02:34 +0200
+Subject: [PATCH] AX_TLS: fix syntax error
+
+The commit e012eb17b3d67f31dee477592328207437206c33 introduce
+a syntax error due to an empty "else" statement.
+
+confifure:
+if test "$ac_cv_tls" != "none"; then :
+cat >>confdefs.h <<_ACEOF
+_ACEOF
+else
+
+fi
+
+Remove the third part of AS_IF
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ m4/ax_tls.m4 | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/m4/ax_tls.m4 b/m4/ax_tls.m4
+index 809b761..5d43e57 100644
+--- a/m4/ax_tls.m4
++++ b/m4/ax_tls.m4
+@@ -44,7 +44,7 @@
+ #   modified version of the Autoconf Macro, you may extend this special
+ #   exception to the GPL to apply to your modified version as well.
+ 
+-#serial 11
++#serial 12
+ 
+ AC_DEFUN([AX_TLS], [
+   AC_MSG_CHECKING([for thread local storage (TLS) class])
+@@ -69,6 +69,5 @@ AC_DEFUN([AX_TLS], [
+ 
+   AS_IF([test "$ac_cv_tls" != "none"],
+     [AC_DEFINE_UNQUOTED([TLS],[$ac_cv_tls],[If the compiler supports a TLS storage class define it to that here])
+-     m4_ifnblank([$1],[$1])],
+-    [m4_ifnblank([$2],[$2])])
++     m4_ifnblank([$1],[$1])])
+ ])
+-- 
+1.9.3
+
-- 
1.9.3
