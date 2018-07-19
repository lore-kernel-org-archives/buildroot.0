From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 19 Jul 2018 10:20:44 -0700
Subject: [Buildroot] [PATCH 3 of 3] libglib2: build fix for RHEL6 hosts (GCC
 4.4.7)
In-Reply-To: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
Message-ID: <020682614ab3ed64145d.1532020844@cveaol6qa08.wv.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

diff --git a/package/libglib2/0004-define-F_SETPIPE_SZ.patch b/package/libglib2/0004-define-F_SETPIPE_SZ.patch
new file mode 100644
--- /dev/null
+++ b/package/libglib2/0004-define-F_SETPIPE_SZ.patch
@@ -0,0 +1,17 @@
+On RHEL6 hosts, fcntl.h doesn't define F_SETPIPE_SZ or F_GETPIPE_SZ.
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+
+--- libglib2-2.56.1/gio/gfile.c.orig	2018-07-12 11:31:13.862255422 -0700
++++ libglib2-2.56.1/gio/gfile.c	2018-07-12 12:06:49.984118708 -0700
+@@ -34,6 +34,10 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#ifndef F_SETPIPE_SZ
++#define F_SETPIPE_SZ 1031
++#define F_GETPIPE_SZ 1032
++#endif
+ #include <errno.h>
+ #endif
+ 
