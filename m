From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 13:39:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xapp_sessreg: fix musl
	build
Message-ID: <20161218123941.22369-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/717/717bd4a2ee4ba62ed9245ec22166a3c63ce1a56d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: upstream patch was updated for musl-1.1.14
    https://github.com/gentoo/musl/commit/bcccf08b2d3d202e4b957d05aab847f1c725de68

 .../xapp_sessreg/0002-missing_path_wtmpx.patch     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch

diff --git a/package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch b/package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch
new file mode 100644
index 000000000..0be242c0b
--- /dev/null
+++ b/package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch
@@ -0,0 +1,24 @@
+Fix missing defines _PATH_WTMPX/_PATH_UTMPX in musl
+
+Downloaded from
+https://cgit.gentoo.org/proj/musl.git/tree/x11-apps/sessreg/files/sessreg-1.1.0-missing_path_wtmpx.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur sessreg-1.1.0.orig/sessreg.h sessreg-1.1.0/sessreg.h
+--- sessreg-1.1.0.orig/sessreg.h	2015-01-20 05:00:27.000000000 +0000
++++ sessreg-1.1.0/sessreg.h	2016-02-23 11:54:42.057000000 +0000
+@@ -103,6 +103,13 @@
+ # define TTYS_FILE	"/etc/ttys"
+ #endif
+ 
++#ifndef _PATH_WTMPX
++# define _PATH_WTMPX	"/var/log/wtmp"
++#endif
++#ifndef _PATH_UTMPX
++# define _PATH_UTMPX	"/var/log/utmp"
++#endif
++
+ #ifndef WTMPX_FILE
+ # define WTMPX_FILE	_PATH_WTMPX
+ #endif
-- 
2.11.0
