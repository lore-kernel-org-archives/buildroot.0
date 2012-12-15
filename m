From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Dec 2012 08:46:17 -0300
Subject: [Buildroot] [PATCH] gd: fix build failure related to iconv/gettext
Message-ID: <1355571977-29757-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gd/gd-iconv.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/gd/gd-iconv.patch

diff --git a/package/gd/gd-iconv.patch b/package/gd/gd-iconv.patch
new file mode 100644
index 0000000..821f5cb
--- /dev/null
+++ b/package/gd/gd-iconv.patch
@@ -0,0 +1,17 @@
+Seems gd is using an ancient gettext for m4 sources which has issues.
+Idea from OpenWRT patch and general knowledge on the internetweb.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gd-2.0.35.orig/configure.ac gd-2.0.35/configure.ac
+--- gd-2.0.35.orig/configure.ac	2012-12-15 08:36:07.165683957 -0300
++++ gd-2.0.35/configure.ac	2012-12-15 08:42:59.354213570 -0300
+@@ -61,7 +61,7 @@
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS([errno.h limits.h stddef.h stdlib.h string.h unistd.h])
+ 
+-AM_ICONV
++m4_pattern_allow([AM_ICONV])
+ # if test -n "$LIBICONV" ; then
+ #   LIBS="$LIBS $LIBICONV"
+ # fi
-- 
1.7.8.6
