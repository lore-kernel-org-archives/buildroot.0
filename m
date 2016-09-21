From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 23:27:31 +0200
Subject: [Buildroot] [git commit] package/jsoncpp: bump to version 1.7.5
Message-ID: <20160921213327.C9F3B82160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b01a670219f6214a7cd2350a3da95832c0bddaa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch applied upstream in commit
d4a49cf511a9ef5ee52af83f8aed4437eaa160e1.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-Treat-conversion-warning-as-error-onl.patch | 37 ----------------------
 package/jsoncpp/jsoncpp.hash                       |  2 +-
 package/jsoncpp/jsoncpp.mk                         |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch b/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch
deleted file mode 100644
index 3e009b9..0000000
--- a/package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 98a7f56ed41071240274063b2d4e39e4e1c9589f Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 25 Apr 2016 19:41:28 +0200
-Subject: [PATCH 1/1] CMakeLists.txt: Treat conversion warning as error only
- with JSONCPP_WITH_WARNING_AS_ERROR=On
-
-Fixes errors when building with buildroot:
-http://autobuild.buildroot.net/?reason=jsoncpp-1.7.2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Patch sent upstream:
- https://github.com/open-source-parsers/jsoncpp/pull/466)
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7787850..637fc34 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -107,11 +107,11 @@ if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Werror=conversion -Werror=sign-compare")
- elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
-   # using GCC
--  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra -Werror=conversion")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wconversion -Wshadow -Wextra")
-   # not yet ready for -Wsign-conversion
- 
-   if (JSONCPP_WITH_STRICT_ISO AND NOT JSONCPP_WITH_WARNING_AS_ERROR)
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=conversion -pedantic")
-   endif ()
- endif()
- 
--- 
-2.8.0.rc3
-
diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 5b4bbcf..e1768ed 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	2179a7df19c1c6dc87e02c65b847efc914625a9b87df3e443d9610fc70c0f557	jsoncpp-1.7.2.tar.gz
+sha256	4338c6cab8af8dee6cdfd54e6218bd0533785f552c6162bb083f8dd28bf8fbbe	jsoncpp-1.7.5.tar.gz
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 34da14c..83ce0a7 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.7.2
+JSONCPP_VERSION = 1.7.5
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
