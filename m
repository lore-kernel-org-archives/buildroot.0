From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 21 Jan 2014 16:49:02 +0200
Subject: [Buildroot] [PATCH] zmqpp: bump git snapshot and remove patch
Message-ID: <1390315742-6127-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has been merged upstream, hence the bump and its removal
from package directory.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 ...include-for-definitions-of-EXIT_-constant.patch | 30 ----------------------
 package/zmqpp/zmqpp.mk                             |  2 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch

diff --git a/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch b/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch
deleted file mode 100644
index 8df755a..0000000
--- a/package/zmqpp/0001-Add-proper-include-for-definitions-of-EXIT_-constant.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9aebdc0e54a6700ea62553365026727456c4969e Mon Sep 17 00:00:00 2001
-From: Alexander Lukichev <alexander.lukichev@espotel.com>
-Date: Thu, 9 Jan 2014 12:15:31 +0200
-Subject: [PATCH] Add proper include for definitions of EXIT_* constants
-
-These constants are referenced in src/client/main.cpp but their
-definitions are pulled indirectly through other header files. For
-some toolchains they are not pulled through those headers, which
-breaks compilation.
-
-Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
----
- src/client/main.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/client/main.cpp b/src/client/main.cpp
-index 37c30a0..3679891 100644
---- a/src/client/main.cpp
-+++ b/src/client/main.cpp
-@@ -4,6 +4,7 @@
-  */
- 
- #include <array>
-+#include <cstdlib>
- #include <iostream>
- #include <tuple>
- 
--- 
-1.8.0.1
-
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 9839e66..5621d71 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 30d72d95f2cfdf9c5cedfd56747f549d65e65847
+ZMQPP_VERSION = 36413487f05b165dfc82ad307a5a1c36a795e607
 ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-- 
1.8.0.1
