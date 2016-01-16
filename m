From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:06:17 +0100
Subject: [Buildroot] [git commit] assimp: fix bfin compile
Message-ID: <20160116130708.74C1E7F931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25ba49518a93265ecb3146e6eb21a2a138989100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use proper 64-bit constant for CONVERT_FBX_TIME(time) conversion.

Fixes ([1]):

  code/FBXConverter.cpp:2025: error: integer constant is too large for 'long' type
  code/FBXConverter.cpp:2026: error: integer constant is too large for 'long' type
  code/FBXConverter.cpp:2794: error: integer constant is too large for 'long' type
  code/FBXConverter.cpp:2868: error: integer constant is too large for 'long' type
  code/FBXConverter.cpp:2878: error: integer constant is too large for 'long' type
  code/FBXConverter.cpp:2888: error: integer constant is too large for 'long' type

[1] http://autobuild.buildroot.net/results/885/8853b192d16ca7ef769c5352a2df0540a7a2a4fd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-FBXConverter-use-proper-64-bit-constant.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
new file mode 100644
index 0000000..bfcbeb5
--- /dev/null
+++ b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
@@ -0,0 +1,35 @@
+From 30a2ecc7939449f235282eb6de42e367fc5b1867 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 14 Jan 2016 22:13:15 +0100
+Subject: [PATCH] Fix FBXConverter: use proper 64-bit constant
+
+Use proper 64-bit constant for CONVERT_FBX_TIME(time) conversion, fixes:
+
+  code/FBXConverter.cpp:2025: error: integer constant is too large for 'long' type
+  code/FBXConverter.cpp:2026: error: integer constant is too large for 'long' type
+  code/FBXConverter.cpp:2794: error: integer constant is too large for 'long' type
+  code/FBXConverter.cpp:2868: error: integer constant is too large for 'long' type
+  code/FBXConverter.cpp:2878: error: integer constant is too large for 'long' type
+  code/FBXConverter.cpp:2888: error: integer constant is too large for 'long' type
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ code/FBXConverter.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/code/FBXConverter.cpp b/code/FBXConverter.cpp
+index e0c6b9c..b1e9a71 100644
+--- a/code/FBXConverter.cpp
++++ b/code/FBXConverter.cpp
+@@ -67,7 +67,7 @@ namespace FBX {
+ 
+ #define MAGIC_NODE_TAG "_$AssimpFbx$"
+ 
+-#define CONVERT_FBX_TIME(time) static_cast<double>(time) / 46186158000L
++#define CONVERT_FBX_TIME(time) static_cast<double>(time) / 46186158000LL
+ 
+     // XXX vc9's debugger won't step into anonymous namespaces
+ //namespace {
+-- 
+2.1.4
+
