From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jun 2014 17:56:55 +0200
Subject: [Buildroot] [git commit] valgrind: fix build for glibc 2.19
Message-ID: <20140619155933.75A489D045@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d85010a5463e92e922e7a251f32cd7e475a4f6e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build for glibc 2.19-based toolchains, fixes:
http://autobuild.buildroot.net/results/be4/be4c033e2088c324f93fc70230f05d761108cfba/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valgrind/valgrind-0005-glibc-2.19.patch |   32 +++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind-0005-glibc-2.19.patch b/package/valgrind/valgrind-0005-glibc-2.19.patch
new file mode 100644
index 0000000..e386a79
--- /dev/null
+++ b/package/valgrind/valgrind-0005-glibc-2.19.patch
@@ -0,0 +1,32 @@
+Enable valgrind for glibc 2.19 targets, and update the error from 2.17
+to 2.19 (which in reality was 2.18).
+Status: upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura valgrind-3.9.0.orig/configure.ac valgrind-3.9.0/configure.ac
+--- valgrind-3.9.0.orig/configure.ac	2014-06-18 19:06:39.212571710 -0300
++++ valgrind-3.9.0/configure.ac	2014-06-18 19:08:37.385557736 -0300
+@@ -918,6 +918,13 @@
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.19)
++        AC_MSG_RESULT(2.19 family)
++	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
+@@ -931,7 +938,7 @@
+ 
+      *)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.17])
++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.19])
+ 	AC_MSG_ERROR([or Darwin libc])
+ 	;;
+ esac
