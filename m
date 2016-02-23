From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 23 Feb 2016 07:37:11 +0100
Subject: [Buildroot] [PATCH v2] package/mono: Fixing wrong MonoPosixHelper
	location
Message-ID: <1456209431-19667-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* This patch solves installation problems with monoposixhelper
* Submitted upstream for inclusion
* Fixes https://bugs.busybox.net/show_bug.cgi?id=8651

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:

v1 -> v2:

* Added SoB and description to patch


 ...007-fixing-wrong-MonoPosixHelper-location.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch

diff --git a/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch b/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch
new file mode 100644
index 0000000..fb77c6f
--- /dev/null
+++ b/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch
@@ -0,0 +1,28 @@
+From b56f7f940f804cdda4216b841f2ba83475a5b19d Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sun, 14 Feb 2016 22:32:25 +0100
+Subject: [PATCH] config.in: fixing wrong MonoPosixHelper location
+
+This patch remove a wrong prefix for libMonoPosixHelper.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ data/config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/config.in b/data/config.in
+index b4b7243..41495b9 100644
+--- a/data/config.in
++++ b/data/config.in
+@@ -10,7 +10,7 @@
+ 	<dllmap dll="i:odbc32.dll" target="libiodbc.dylib" os="osx"/>
+ 	<dllmap dll="oci" target="libclntsh@libsuffix@" os="!windows"/>
+ 	<dllmap dll="db2cli" target="libdb2_36@libsuffix@" os="!windows"/>
+-	<dllmap dll="MonoPosixHelper" target="$mono_libdir/libMonoPosixHelper@libsuffix@" os="!windows" />
++	<dllmap dll="MonoPosixHelper" target="libMonoPosixHelper@libsuffix@" os="!windows" />
+ 	<dllmap dll="i:msvcrt" target="@LIBC@" os="!windows"/>
+ 	<dllmap dll="i:msvcrt.dll" target="@LIBC@" os="!windows"/>
+ 	<dllmap dll="sqlite" target="@SQLITE@" os="!windows"/>
+-- 
+1.9.1
+
-- 
1.9.1
