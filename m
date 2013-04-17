From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:49:53 +0200
Subject: [Buildroot] [git commit] polarssl: bump to version 1.2.7
Message-ID: <20130417195409.76CA79B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bedb8a463e88ad1c115ae3a7a1542e6596211531
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../polarssl-shared-and-static-library.patch       |    4 ++--
 package/polarssl/polarssl.mk                       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
index f4f4746..554eda6 100644
--- a/package/polarssl/polarssl-shared-and-static-library.patch
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -9,7 +9,7 @@ This patch adds the USE_STATIC_POLARSSL_LIBRARY (which defaults to ON)
 in addition to the existing USE_SHARED_POLARSSL_LIBRARY (which
 defaults to OFF). Both options can be manipulated independently.
 
-[Gustavo: update for polarssl 1.2.6]
+[Gustavo: update for polarssl 1.2.7]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
@@ -34,7 +34,7 @@ diff -Nura polarssl-1.2.3.orig/library/CMakeLists.txt polarssl-1.2.3/library/CMa
 +if(USE_SHARED_POLARSSL_LIBRARY)
  
  add_library(polarssl SHARED ${src})
- set_target_properties(polarssl PROPERTIES VERSION 1.2.6 SOVERSION 2)
+ set_target_properties(polarssl PROPERTIES VERSION 1.2.7 SOVERSION 2)
 +set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
 +
 +endif(USE_SHARED_POLARSSL_LIBRARY)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index c05a307..7d7fe3e 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,5 +1,5 @@
 POLARSSL_SITE = https://polarssl.org/download
-POLARSSL_VERSION = 1.2.6
+POLARSSL_VERSION = 1.2.7
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
