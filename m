From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:24:55 +0200
Subject: [Buildroot] [git commit] mutt: fix automake breakage
Message-ID: <20130919193857.BFFAA9B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=562b8df33c17678682c9fd1d71097d7322ed8f00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix breakage due to automake 1.12.6 bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...mutt-1.5.21-nodoc.patch => mutt-01-nodoc.patch} |    0
 package/mutt/mutt-02-automake.patch                |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/mutt/mutt-1.5.21-nodoc.patch b/package/mutt/mutt-01-nodoc.patch
similarity index 100%
rename from package/mutt/mutt-1.5.21-nodoc.patch
rename to package/mutt/mutt-01-nodoc.patch
diff --git a/package/mutt/mutt-02-automake.patch b/package/mutt/mutt-02-automake.patch
new file mode 100644
index 0000000..19950a9
--- /dev/null
+++ b/package/mutt/mutt-02-automake.patch
@@ -0,0 +1,16 @@
+Fix for automake 1.12+
+http://dev.mutt.org/trac/ticket/3579
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura mutt-1.5.21.orig/configure.ac mutt-1.5.21/configure.ac
+--- mutt-1.5.21.orig/configure.ac	2013-09-16 11:07:25.699781892 -0300
++++ mutt-1.5.21/configure.ac	2013-09-16 11:07:45.120419960 -0300
+@@ -27,7 +27,6 @@
+ 
+ AC_PROG_CC
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ if test "x$U" != "x"; then
+   AC_MSG_ERROR(Compiler not ANSI compliant)
+ fi
