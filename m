From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] ruby: fix invalid sed
	invocation in configure.in
Message-ID: <20101104230332.B74FC8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=739467b50516cae48e461426d9279ef4eed5989e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby-configure2.patch |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/ruby/ruby-configure2.patch

diff --git a/package/ruby/ruby-configure2.patch b/package/ruby/ruby-configure2.patch
new file mode 100644
index 0000000..405fc41
--- /dev/null
+++ b/package/ruby/ruby-configure2.patch
@@ -0,0 +1,26 @@
+From ac89b1414c84dbc038f623591c738b0637745415 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 4 Nov 2010 18:31:38 -0300
+Subject: [PATCH] Fix bad sed in configure.in
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index e97216f..a978c97 100644
+--- a/configure.in
++++ b/configure.in
+@@ -152,7 +152,7 @@ AC_MSG_RESULT([$ARCH_FLAG])
+ AC_DEFUN([RUBY_UNIVERSAL_ARCH], [
+ # RUBY_UNIVERSAL_ARCH begin
+ test ${CFLAGS+set} && CFLAGS=`echo "$CFLAGS" | sed -e 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
+-test ${LDFLAGS+set} && LDFLAGS=`echo "$LDFLAGS" | sed 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
++test ${LDFLAGS+set} && LDFLAGS=`echo "$LDFLAGS" | sed -e 's/ *-arch  *[^ ]*//g' -e 's/ *-m32//g' -e 's/ *-m64//g'`
+ unset ARCH_FLAG universal_binary universal_archnames
+ if test ${target_archs+set}; then
+     AC_MSG_CHECKING([target architectures])
+-- 
+1.7.2.2
+
-- 
1.7.1
