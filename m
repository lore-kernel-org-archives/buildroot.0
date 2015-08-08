From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:05 -0000
Subject: [Buildroot] [git commit branch/next] jasper: Don't overwrite CFLAGS
	when configured with --enable-debug
Message-ID: <20150808105559.85A9A7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dcf9d14b5d6dc2f2e0f349756d17f8ffb99604e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This drops architecture-specific ABI flags, which may be important.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/0007-preserve-cflags.patch |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/jasper/0007-preserve-cflags.patch b/package/jasper/0007-preserve-cflags.patch
new file mode 100644
index 0000000..7e4c4a2
--- /dev/null
+++ b/package/jasper/0007-preserve-cflags.patch
@@ -0,0 +1,27 @@
+From: Max Filippov <jcmvbkbc@gmail.com>
+Subject: Don't overwrite CFLAGS when configured with --enable-debug
+
+This drops architecture-specific ABI flags, which may be important.
+
+Signded-off-by: Max Filippov <jcmvbkbc@gmail.com>
+
+--- jasper-1.900.1/configure.ac.orig	2015-05-18 22:27:53.057512760 +0300
++++ jasper-1.900.1/configure.ac	2015-05-18 22:28:36.090415422 +0300
+@@ -327,7 +327,7 @@
+ 	AC_DEFINE(DEBUG)
+ 	AC_DEFINE(DEBUG_OVERFLOW)
+ 	if test "$GCC" = yes; then
+-		CFLAGS="-g -O0"
++		CFLAGS="$CFLAGS -g -O0"
+ 	fi
+ 	;;
+ no)
+@@ -357,7 +357,7 @@
+ case "${enableval}" in
+ yes)
+ 	if test "$GCC" = yes; then
+-		CFLAGS="-g -O0"
++		CFLAGS="$CFLAGS -g -O0"
+ 	fi
+ 	;;
+ no)
