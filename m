From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 13:31:41 +0100
Subject: [Buildroot] [git commit] polarssl: bump to version 1.2.10
Message-ID: <20131106123311.2FAB79BAE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f05d5ac8f34b30f87408132775dac74648d5b33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a memory leak in RSA blinding.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../polarssl-shared-and-static-library.patch       |    4 ++--
 package/polarssl/polarssl.mk                       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
index 47511b2..7e41745 100644
--- a/package/polarssl/polarssl-shared-and-static-library.patch
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -9,7 +9,7 @@ This patch adds the USE_STATIC_POLARSSL_LIBRARY (which defaults to ON)
 in addition to the existing USE_SHARED_POLARSSL_LIBRARY (which
 defaults to OFF). Both options can be manipulated independently.
 
-[Gustavo: update for polarssl 1.2.9]
+[Gustavo: update for polarssl 1.2.10]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
@@ -34,7 +34,7 @@ diff -Nura polarssl-1.2.3.orig/library/CMakeLists.txt polarssl-1.2.3/library/CMa
 +if(USE_SHARED_POLARSSL_LIBRARY)
  
  add_library(polarssl SHARED ${src})
- set_target_properties(polarssl PROPERTIES VERSION 1.2.9 SOVERSION 3)
+ set_target_properties(polarssl PROPERTIES VERSION 1.2.10 SOVERSION 3)
 +set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
 +
 +endif(USE_SHARED_POLARSSL_LIBRARY)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index deb2252..20486e3 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://polarssl.org/code/releases
-POLARSSL_VERSION = 1.2.9
+POLARSSL_VERSION = 1.2.10
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
