From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:55:06 +0200
Subject: [Buildroot] [git commit] package/autoconf-archive: fix ax_tls
	syntax error
Message-ID: <20150505205547.A719980116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f55934c8adbf3146e622abfdab9173d63169347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ax_tls.m4 serial 11 procude a syntax error
in configure scripts.

Fixes:
http://autobuild.buildroot.net/results/619/619339810617212a667fe72278ec727ee992ffbf/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-AX_TLS-fix-syntax-error.patch             |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
new file mode 100644
index 0000000..6d345d3
--- /dev/null
+++ b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
@@ -0,0 +1,46 @@
+From 1870301013d79be781ead2b0e62fc08f91715ca9 Mon Sep 17 00:00:00 2001
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
+Remove the [] on the third part of AS_IF.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ m4/ax_tls.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_tls.m4 b/m4/ax_tls.m4
+index 809b761..2135dd2 100644
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
+@@ -70,5 +70,5 @@ AC_DEFUN([AX_TLS], [
+   AS_IF([test "$ac_cv_tls" != "none"],
+     [AC_DEFINE_UNQUOTED([TLS],[$ac_cv_tls],[If the compiler supports a TLS storage class define it to that here])
+      m4_ifnblank([$1],[$1])],
+-    [m4_ifnblank([$2],[$2])])
++    m4_ifnblank([$2],[$2]))
+ ])
+-- 
+1.9.3
+
