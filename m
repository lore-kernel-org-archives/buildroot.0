From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 25 Feb 2016 22:03:25 +0100
Subject: [Buildroot] [PATCH v4] package/mono: Fixing wrong MonoPosixHelper
	location
Message-ID: <1456434205-26293-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch solves an host path leaking in /etc/mono/config
that leads to searching libmonoposixhelper into the wrong path.
This bug is fixed upstream, but not included in the current stable
release.

Fixes bug #8651.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes
v3 -> v4:
* Rewording commit message
* Retaining the previous acked-by from Arnout Vandecappelle

v2 -> v3:
* The patch was based on mono master and not on mono 4.2.2.30.
* This patch is now based on mono 4.2.2.30.
* This patch was tested on br_next.

v1 -> v2:
* Added SoB and description to patch

 ....in-fixing-wrong-MonoPosixHelper-location.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch

diff --git a/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch b/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
new file mode 100644
index 0000000..6ebb802
--- /dev/null
+++ b/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
@@ -0,0 +1,28 @@
+From 76aa4fb62a433e61dc35eefcc3077f0463182d2f Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Tue, 23 Feb 2016 22:43:39 +0100
+Subject: [PATCH] config.in: fixing wrong MonoPosixHelper location
+
+This patch remove a wrong prefix for libMonoPosixHelper
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ data/config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
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
+-- 
+1.9.1
+
-- 
1.9.1
