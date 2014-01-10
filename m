From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 10 Jan 2014 15:17:53 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: add proper header include
Message-ID: <1389359873-24316-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has been submitted upstream. If it is accepted, the
patch here will not be necessary.

Fixes http://autobuild.buildroot.net/results/425/42590285167f779e27a4e8db9853c7065b9e31c0/
and some others.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 ...include-for-definitions-of-EXIT_-constant.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch

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
-- 
1.8.0.1
