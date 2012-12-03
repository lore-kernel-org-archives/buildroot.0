From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:06 -0300
Subject: [Buildroot] [PATCH 08/14] polarssl: bump to version 1.2.3
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../polarssl-shared-and-static-library.patch       |   10 +++++-----
 package/polarssl/polarssl.mk                       |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
index e11cab3..ec65285 100644
--- a/package/polarssl/polarssl-shared-and-static-library.patch
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -9,13 +9,13 @@ This patch adds the USE_STATIC_POLARSSL_LIBRARY (which defaults to ON)
 in addition to the existing USE_SHARED_POLARSSL_LIBRARY (which
 defaults to OFF). Both options can be manipulated independently.
 
-[Gustavo: update for polarssl 1.2.0]
+[Gustavo: update for polarssl 1.2.3]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura polarssl-1.2.0.orig/library/CMakeLists.txt polarssl-1.2.0/library/CMakeLists.txt
---- polarssl-1.2.0.orig/library/CMakeLists.txt	2012-11-15 15:01:58.239248830 -0300
-+++ polarssl-1.2.0/library/CMakeLists.txt	2012-11-15 15:00:10.310806353 -0300
+diff -Nura polarssl-1.2.3.orig/library/CMakeLists.txt polarssl-1.2.3/library/CMakeLists.txt
+--- polarssl-1.2.3.orig/library/CMakeLists.txt	2012-11-27 17:16:20.735678722 -0300
++++ polarssl-1.2.3/library/CMakeLists.txt	2012-11-27 17:18:09.760457733 -0300
 @@ -1,4 +1,5 @@
  option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL as a shared library." OFF)
 +option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL as a static library." ON)
@@ -34,7 +34,7 @@ diff -Nura polarssl-1.2.0.orig/library/CMakeLists.txt polarssl-1.2.0/library/CMa
 +if(USE_SHARED_POLARSSL_LIBRARY)
  
  add_library(polarssl SHARED ${src})
- set_target_properties(polarssl PROPERTIES VERSION 1.2.0 SOVERSION 2)
+ set_target_properties(polarssl PROPERTIES VERSION 1.2.3 SOVERSION 2)
 +set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
 +
 +endif(USE_SHARED_POLARSSL_LIBRARY)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index edda9bf..c66c633 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,5 +1,5 @@
 POLARSSL_SITE = https://polarssl.org/download
-POLARSSL_VERSION = 1.2.0
+POLARSSL_VERSION = 1.2.3
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
-- 
1.7.8.6
