From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Aug 2016 13:15:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: Fix build with gcc6
Message-ID: <20160828111559.16653-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c45/c45530f34bf2074bd204c485615124df928f246c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libxmlrpc/0006-narrowing.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/libxmlrpc/0006-narrowing.patch

diff --git a/package/libxmlrpc/0006-narrowing.patch b/package/libxmlrpc/0006-narrowing.patch
new file mode 100644
index 0000000..43a5ca5
--- /dev/null
+++ b/package/libxmlrpc/0006-narrowing.patch
@@ -0,0 +1,20 @@
+Fix build with gcc6
+
+Downloaded from
+https://build.opensuse.org/package/view_file/devel:libraries:c_c++/xmlrpc-c/narrowing.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: xmlrpc-c-1.33.18/src/cpp/base64.cpp
+===================================================================
+--- xmlrpc-c-1.33.18.orig/src/cpp/base64.cpp
++++ xmlrpc-c-1.33.18/src/cpp/base64.cpp
+@@ -14,7 +14,7 @@ using namespace xmlrpc_c;
+ 
+ namespace {
+ 
+-char const table_a2b_base64[] = {
++signed char const table_a2b_base64[] = {
+     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
+     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
+     -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,62, -1,-1,-1,63,
-- 
2.9.3
