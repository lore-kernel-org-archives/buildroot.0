From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 14:47:04 +0100
Subject: [Buildroot] [git commit] gd: fix build failure related to
	iconv/gettext
Message-ID: <20121215162634.358879A1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e9f1cf49d8fb8039e3501417235044813cfa57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gd/gd-iconv.patch |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
