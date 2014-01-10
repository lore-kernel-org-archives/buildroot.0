From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:01:27 +0100
Subject: [Buildroot] [git commit] zmqpp: add proper header include
Message-ID: <20140110141523.E7EFB9C425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a3554a1527b3485689ce7d77339a667867ddca8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch has been submitted upstream. If it is accepted, the
patch here will not be necessary.

Fixes http://autobuild.buildroot.net/results/425/42590285167f779e27a4e8db9853c7065b9e31c0/
and some others.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...include-for-definitions-of-EXIT_-constant.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch b/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch
new file mode 100644
index 0000000..8df755a
--- /dev/null
+++ b/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch
@@ -0,0 +1,30 @@
+From 9aebdc0e54a6700ea62553365026727456c4969e Mon Sep 17 00:00:00 2001
+From: Alexander Lukichev <alexander.lukichev@espotel.com>
+Date: Thu, 9 Jan 2014 12:15:31 +0200
+Subject: [PATCH] Add proper include for definitions of EXIT_* constants
+
+These constants are referenced in src/client/main.cpp but their
+definitions are pulled indirectly through other header files. For
+some toolchains they are not pulled through those headers, which
+breaks compilation.
+
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+---
+ src/client/main.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/client/main.cpp b/src/client/main.cpp
+index 37c30a0..3679891 100644
+--- a/src/client/main.cpp
++++ b/src/client/main.cpp
+@@ -4,6 +4,7 @@
+  */
+ 
+ #include <array>
++#include <cstdlib>
+ #include <iostream>
+ #include <tuple>
+ 
+-- 
+1.8.0.1
+
