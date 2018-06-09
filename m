From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Jun 2018 12:13:17 +0200
Subject: [Buildroot] [PATCH 1/1] pugixml: bump to version 1.9
Message-ID: <20180609101317.18302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-check-cxx_long_long_type-existence.patch  | 33 ----------------------
 package/pugixml/pugixml.hash                       |  3 +-
 package/pugixml/pugixml.mk                         |  4 +--
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/pugixml/0001-check-cxx_long_long_type-existence.patch

diff --git a/package/pugixml/0001-check-cxx_long_long_type-existence.patch b/package/pugixml/0001-check-cxx_long_long_type-existence.patch
deleted file mode 100644
index a53c84a29a..0000000000
--- a/package/pugixml/0001-check-cxx_long_long_type-existence.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6cfd9c14ced26c8220f7f7ea99610cbdbfb9eba7 Mon Sep 17 00:00:00 2001
-From: Theo Debrouwere <theo.debrouwere@skynet.be>
-Date: Mon, 12 Sep 2016 09:38:56 +0200
-Subject: [PATCH] Bugfix: check if cxx_long_long_type is present before
- applying it.
-
-Check if cxx_long_long_type is present in the list of compiler features
-before adding it as a target_compile_feature.
-
-Patch was backported from
-https://github.com/zeux/pugixml/commit/4dbb5646196a4a3cc94097f1473ef11d1d44df11
-
-Signed-off-by: Theo Debrouwere <theo.debrouwere@skynet.be>
----
- scripts/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
-index 40a7ab0..6403753 100644
---- a/scripts/CMakeLists.txt
-+++ b/scripts/CMakeLists.txt
-@@ -26,7 +26,7 @@ else()
- endif()
- 
- # Enable C++11 long long for compilers that are capable of it
--if(NOT ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} STRLESS 3.1)
-+if(NOT ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} STRLESS 3.1 AND ";${CMAKE_CXX_COMPILE_FEATURES};" MATCHES ";cxx_long_long_type;")
- 	target_compile_features(pugixml PUBLIC cxx_long_long_type)
- endif()
- 
--- 
-2.9.3
-
diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 9007f7cae6..fb6566dabf 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  fbe10d46f61d769f7d92a296102e4e2bd3ee16130f11c5b10a1aae590ea1f5ca  pugixml-1.7.tar.gz
+sha256  d156d35b83f680e40fd6412c4455fdd03544339779134617b9b28d19e11fdba6  pugixml-1.9.tar.gz
+sha256  5f2318fdea73711b4761fd395462a51dc7d4626088ebaa41732b598821ac935a  readme.txt
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 2e4f0ce561..e5188e5f53 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.7
+PUGIXML_VERSION = 1.9
 PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
 PUGIXML_INSTALL_STAGING = YES
 
-PUGIXML_SUBDIR = scripts
-
 $(eval $(cmake-package))
-- 
2.14.1
