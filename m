From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:30:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_sessreg: fix musl build
Message-ID: <1453642260-24302-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xapp_sessreg/0002-musl-missing-path-wtmpx.patch   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/x11r7/xapp_sessreg/0002-musl-missing-path-wtmpx.patch

diff --git a/package/x11r7/xapp_sessreg/0002-musl-missing-path-wtmpx.patch b/package/x11r7/xapp_sessreg/0002-musl-missing-path-wtmpx.patch
new file mode 100644
index 0000000..90e1e8e
--- /dev/null
+++ b/package/x11r7/xapp_sessreg/0002-musl-missing-path-wtmpx.patch
@@ -0,0 +1,19 @@
+Fix musl build
+
+Downloaded from
+https://cgit.gentoo.org/proj/musl.git/tree/x11-apps/sessreg/files/sessreg-1.1.0-missing_path_wtmpx.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur sessreg-1.0.8.orig/sessreg.h sessreg-1.0.8/sessreg.h
+--- sessreg-1.0.8.orig/sessreg.h	2013-02-10 21:43:50.000000000 -0500
++++ sessreg-1.0.8/sessreg.h	2014-06-18 10:02:17.769459663 -0400
+@@ -106,3 +106,8 @@
+ #ifndef UTMPX_FILE
+ # define UTMPX_FILE	_PATH_UTMPX
+ #endif
++
++#ifndef _PATH_WTMPX
++# define _PATH_WTMPX	"/var/log/wtmp"
++#endif
++
-- 
2.7.0.rc3
