From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 15:53:07 +0200
Subject: [Buildroot] [git commit] polarssl: security bump to version 1.1.3
Message-ID: <20120503135521.577D496C56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2e12ef2788c8323957bc5777ed3721f1ebf60ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for CVE-2012-2130

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../polarssl-shared-and-static-library.patch       |    2 +-
 package/polarssl/polarssl.mk                       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
index 3ad3334..562b900 100644
--- a/package/polarssl/polarssl-shared-and-static-library.patch
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -33,7 +33,7 @@ Index: polarssl-1.1.1/library/CMakeLists.txt
 +if(USE_SHARED_POLARSSL_LIBRARY)
  
  add_library(polarssl SHARED ${src})
- set_target_properties(polarssl PROPERTIES VERSION 1.1.1 SOVERSION 1)
+ set_target_properties(polarssl PROPERTIES VERSION 1.1.3 SOVERSION 1)
 +set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
 +
 +endif(USE_SHARED_POLARSSL_LIBRARY)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 0d8574c..d07cdc6 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,5 +1,5 @@
 POLARSSL_SITE = http://polarssl.org/code/releases/
-POLARSSL_VERSION = 1.1.1
+POLARSSL_VERSION = 1.1.3
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
