From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:17:38 +0200
Subject: [Buildroot] [git commit] zmqpp: fix compilation with some toolchains
Message-ID: <20150516121829.68D5781768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee2b703fe799b36e54f35851e6f2db28eb8fdb1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d9ec39dc5829aac1b25bfea7484458fcebd68412/

add cstdlib header to ensure EXIT_FAILURE presence

Using some cross-compiling toolchains, EXIT_FAILURE is not always
properly defined without this inclusion.

Patch is upstream:
https://github.com/zeromq/zmqpp/pull/109

[Thomas: use a patch formatted with git format-patch, rather than the
output of 'git show'.]

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ib-header-to-ensure-EXIT_FAILURE-presence.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch b/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch
new file mode 100644
index 0000000..1458eca
--- /dev/null
+++ b/package/zmqpp/0001-add-cstdlib-header-to-ensure-EXIT_FAILURE-presence.patch
@@ -0,0 +1,30 @@
+From 2c9271fa662b98e2a451b859f2506edf5f91c9bf Mon Sep 17 00:00:00 2001
+From: Lionel Orry <lionel.orry@gmail.com>
+Date: Fri, 15 May 2015 11:27:57 +0200
+Subject: [PATCH] add cstdlib header to ensure EXIT_FAILURE presence
+
+Using some cross-compiling toolchains, EXIT_FAILURE is not always
+properly defined without this inclusion.
+
+Add myself to AUTHORS.
+
+Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+---
+ src/client/main.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/client/main.cpp b/src/client/main.cpp
+index 082c06b..760f01a 100644
+--- a/src/client/main.cpp
++++ b/src/client/main.cpp
+@@ -3,6 +3,7 @@
+  *      Author: @benjamg
+  */
+ 
++#include <cstdlib>
+ #include <array>
+ #include <iostream>
+ #include <tuple>
+-- 
+2.1.0
+
