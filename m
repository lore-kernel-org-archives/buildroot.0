From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:02:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/netplug: fix musl build
Message-ID: <1453590125-21760-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/331/331b43bcef31af230fbd9523601fd335a152ee4b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/netplug/0002-musl.patch | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/netplug/0002-musl.patch

diff --git a/package/netplug/0002-musl.patch b/package/netplug/0002-musl.patch
new file mode 100644
index 0000000..ae20ba6
--- /dev/null
+++ b/package/netplug/0002-musl.patch
@@ -0,0 +1,50 @@
+Fixes musl build
+
+Downloaded from
+https://github.com/bradfa/clfs-embedded/blob/master/patches/netplug-1.2.9.2-fixes-1.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+Submitted By: Andrew Bradford <andrew@bradfordembedded.com>
+Date: 2013-10-25
+Initial Package Version: 1.2.9.2
+Origin:	CLFS specific
+Upstream Status: Not Applied
+Description: 	Fixes build problems.
+
+diff -Naur netplug-1.2.9.2.orig/lib.c netplug-1.2.9.2/lib.c
+--- netplug-1.2.9.2.orig/lib.c	2013-10-25 16:23:21.270934264 -0400
++++ netplug-1.2.9.2/lib.c	2013-10-25 16:24:26.067667210 -0400
+@@ -200,20 +200,6 @@
+ }
+ 
+ 
+-void
+-__assert_fail(const char *assertion, const char *file,
+-              unsigned int line, const char *function)
+-{
+-    do_log(LOG_CRIT, "%s:%u: %s%sAssertion `%s' failed",
+-           file, line,
+-           function ? function : "",
+-           function ? ": " : "",
+-           assertion);
+-
+-    abort();
+-}
+-
+-
+ /*
+  * Local variables:
+  * c-file-style: "stroustrup"
+diff -Naur netplug-1.2.9.2.orig/netplug.h netplug-1.2.9.2/netplug.h
+--- netplug-1.2.9.2.orig/netplug.h	2013-10-25 16:23:21.270934264 -0400
++++ netplug-1.2.9.2/netplug.h	2013-10-25 16:24:17.054324652 -0400
+@@ -25,6 +25,7 @@
+ #include <sys/socket.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
++#include <time.h>
+ 
+ #define NP_SCRIPT NP_SCRIPT_DIR "/netplug"
+ 
-- 
2.7.0.rc3
