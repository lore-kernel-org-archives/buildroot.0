From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 22:50:14 +0100
Subject: [Buildroot] [git commit] uhttpd: add patch to remove -Werror
Message-ID: <20161207215028.5357681D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5382bac7c6e8dc94aa8cc42191815baeec1db911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/febbd094090e14fe7a79e6f691c290075da4fd59/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uhttpd/0001-Remove-Werror.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/uhttpd/0001-Remove-Werror.patch b/package/uhttpd/0001-Remove-Werror.patch
new file mode 100644
index 0000000..67028cf
--- /dev/null
+++ b/package/uhttpd/0001-Remove-Werror.patch
@@ -0,0 +1,33 @@
+From ac52380eeca27e1e2e7eb5fb9d39059dbe58b919 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 7 Dec 2016 22:48:27 +0100
+Subject: [PATCH] Remove -Werror
+
+-Werror might cause build failures with newer versions of gcc or C
+ libraries, not tested by upstream, for example:
+
+ # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+   ^
+cc1: all warnings being treated as errors
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7ae8ba4..825342f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,7 +5,7 @@ PROJECT(uhttpd C)
+ INCLUDE (CheckFunctionExists)
+ 
+ SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
+-ADD_DEFINITIONS(-D_FILE_OFFSET_BITS=64 -Os -Wall -Werror -Wmissing-declarations --std=gnu99 -g3)
++ADD_DEFINITIONS(-D_FILE_OFFSET_BITS=64 -Os -Wall -Wmissing-declarations --std=gnu99 -g3)
+ 
+ OPTION(TLS_SUPPORT "TLS support" ON)
+ OPTION(LUA_SUPPORT "Lua support" ON)
+-- 
+2.7.4
+
