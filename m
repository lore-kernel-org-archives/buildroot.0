From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 19 May 2015 21:28:59 +0300
Subject: [Buildroot] [PATCH 1/2] jasper: Don't overwrite CFLAGS when
	configured with --enable-debug
In-Reply-To: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
References: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1432060140-13611-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drops architecture-specific ABI flags, which may be important.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/jasper/0007-preserve-cflags.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/jasper/0007-preserve-cflags.patch

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
-- 
1.8.1.4
