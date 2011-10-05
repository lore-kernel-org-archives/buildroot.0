From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 13:57:35 +0200
Subject: [Buildroot] [git commit] pkg-stats: update grep tests for package
	type
Message-ID: <20111005120418.996B58DA34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e3e5a99f7c148ef2fcdb6a033c36e9fe6d7ba94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the grep tests used to determine the package type.

The package name and directory are now worked out magically due to:

 package: add helper functions to get package name and directory magically

Because of this the extra arguments were removed by patches:

 package: remove useless arguments from GENTARGETS
 package: remove useless arguments from AUTOTARGETS
 package: remove useless arguments from CMAKETARGETS

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

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
 
