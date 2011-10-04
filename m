From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 18:10:40 -0500
Subject: [Buildroot] [PATCH] pkg-stats: update grep tests for package type
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AF@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the grep tests used to determine the package type.

The package name and directory are now worked out magically due to:

 package: add helper functions to get package name and directory magically

Because of this the extra arguments were removed by patches:

 package: remove useless arguments from GENTARGETS
 package: remove useless arguments from AUTOTARGETS
 package: remove useless arguments from CMAKETARGETS

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index bb1c27d..8602b0f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -98,27 +98,27 @@ for i in $(find package/ -name '*.mk') ; do
     is_manual_target=0
     is_manual_host=0
 
-    if grep -E "\(call AUTOTARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
+    if grep -E "\(call AUTOTARGETS,host\)" $i > /dev/null ; then
 	is_auto_host=1
     fi
 
-    if grep -E "\(call AUTOTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+    if grep -E "\(call AUTOTARGETS\)" $i > /dev/null ; then
 	is_auto_target=1
     fi
 
-    if grep -E "\(call GENTARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
+    if grep -E "\(call GENTARGETS,host\)" $i > /dev/null ; then
 	is_pkg_host=1
     fi
 
-    if grep -E "\(call GENTARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+    if grep -E "\(call GENTARGETS\)" $i > /dev/null ; then
 	is_pkg_target=1
     fi
 
-    if grep -E "\(call CMAKETARGETS,[^,]*,[^,]*,host\)" $i > /dev/null ; then
+    if grep -E "\(call CMAKETARGETS,host\)" $i > /dev/null ; then
 	is_cmake_host=1
     fi
 
-    if grep -E "\(call CMAKETARGETS,[^,]*,[^,]*(,target|)\)" $i > /dev/null ; then
+    if grep -E "\(call CMAKETARGETS\)" $i > /dev/null ; then
 	is_cmake_target=1
     fi
 
