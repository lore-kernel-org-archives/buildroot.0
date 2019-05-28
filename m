From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 May 2019 23:10:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: security bump to version 3.0.2
Message-ID: <20190528211030.5872-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following vulnerabilities have been fixed:
 - wnpa-sec-2019-19 Wireshark dissection engine crash. Bug 15778.

The first patch must be updated because of
https://github.com/wireshark/wireshark/commit/86db127280300cf2c3841a7ca37f48be286e3a37

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix static linking with glib2

 package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch | 2 +-
 package/wireshark/wireshark.hash                              | 4 ++--
 package/wireshark/wireshark.mk                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch b/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
index 5335fbf901..daa23503f6 100644
--- a/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
+++ b/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
@@ -30,7 +30,7 @@ index 2b55b742fe..46ad3c41a6 100644
  
  if( GLIB2_FOUND )
 -	set( GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
-+	list( APPEND GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
++	list( APPEND GLIB2_LIBRARIES ${GLIB2_LIBRARY} ${PC_GLIB2_LIBRARIES} )
  	# Include transitive dependencies for static linking.
  	if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
  		find_library(PCRE_LIBRARY pcre)
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 99aa433bb4..8498f59140 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.1.txt
-sha256 86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c  wireshark-3.0.1.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.2.txt
+sha256 7e1ec5664a0dba4493d8729f9922378bdd05040fb159c2b03b42111efda2e53b  wireshark-3.0.2.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 60cde3f838..c98006dcf4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.1
+WIRESHARK_VERSION = 3.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.20.1
