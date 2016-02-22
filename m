From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 22 Feb 2016 21:20:23 +0100
Subject: [Buildroot] [PATCH] package/mono: Fixing wrong MonoPosixHelper
	location
Message-ID: <1456172423-17113-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* This patch solves installation problems with monoposixkelper
* Submitted upstream for inclusion
* Fixes https://bugs.busybox.net/show_bug.cgi?id=8651

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../mono/0007-fixing-wrong-MonoPosixHelper-location.patch   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch

diff --git a/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch b/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch
new file mode 100644
index 0000000..66cc1ea
--- /dev/null
+++ b/package/mono/0007-fixing-wrong-MonoPosixHelper-location.patch
@@ -0,0 +1,13 @@
+diff --git a/data/config.in b/data/config.in
+index b760176..41495b9 100644
+--- a/data/config.in
++++ b/data/config.in
+@@ -10,7 +10,7 @@
+ 	<dllmap dll="i:odbc32.dll" target="libiodbc.dylib" os="osx"/>
+ 	<dllmap dll="oci" target="libclntsh@libsuffix@" os="!windows"/>
+ 	<dllmap dll="db2cli" target="libdb2_36@libsuffix@" os="!windows"/>
+-	<dllmap dll="MonoPosixHelper" target="@prefix@/@reloc_libdir@/libMonoPosixHelper@libsuffix@" os="!windows" />
++	<dllmap dll="MonoPosixHelper" target="libMonoPosixHelper@libsuffix@" os="!windows" />
+ 	<dllmap dll="i:msvcrt" target="@LIBC@" os="!windows"/>
+ 	<dllmap dll="i:msvcrt.dll" target="@LIBC@" os="!windows"/>
+ 	<dllmap dll="sqlite" target="@SQLITE@" os="!windows"/>
-- 
1.9.1
