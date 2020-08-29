From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Aug 2020 22:40:05 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/freeswitch: bump version to
 1.10.5
In-Reply-To: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
References: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
Message-ID: <20200829204005.2815997-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed spandsp and sofia-sip from source and now uses external
packages, removed patch 0001 which fixed a bug in the internal sofia-sip
code, removed insecure md5 and sha1 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-sofia-sip-fix-s2tcase.c.patch        | 38 -------------------
 package/freeswitch/Config.in                  |  2 +
 package/freeswitch/freeswitch.hash            | 11 +-----
 package/freeswitch/freeswitch.mk              |  9 ++---
 4 files changed, 7 insertions(+), 53 deletions(-)
 delete mode 100644 package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch

diff --git a/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch b/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
deleted file mode 100644
index 1f74b4a5a3..0000000000
--- a/package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Jul 2020 13:47:16 +0200
-Subject: [PATCH] [sofia-sip] fix s2tcase.c
-
-Fixes build error with recent libcheck:
-https://github.com/signalwire/freeswitch/issues/681
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libs/sofia-sip/s2check/s2tcase.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
-index 382aaa3ad7..d67694c2ce 100644
---- a/libs/sofia-sip/s2check/s2tcase.c
-+++ b/libs/sofia-sip/s2check/s2tcase.c
-@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
-@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
--- 
-2.27.0
-
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index bd961314e7..fc8b4bf7e7 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_SPANDSP
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_SPEEXDSP
 	select BR2_PACKAGE_SQLITE
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index de6cb6462c..d95e05c0b1 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.md5
-md5  c7d570da3a6fc66c1a286a105680dabf freeswitch-1.10.3.-release.tar.xz
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.sha1
-sha1  98139cda8054ec840611c6fc3a585a5c5565ae4d freeswitch-1.10.3.-release.tar.xz
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.sha256
-sha256  2d7db07a64ee2f19f9b6e3a4ce76fa42e0fe46c29d95edf1b690a3df3729f307 freeswitch-1.10.3.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.5.-release.tar.xz.sha256
+sha256  3e26600767a82946eca94af2c8f14712783aa83db5fb1cc57585f544aecce327 freeswitch-1.10.5.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
@@ -12,8 +8,5 @@ sha256  1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/a
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
 sha256  7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
-sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
-sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
-sha256  366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
 sha256  ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 79467ed618..fe10bc1fa1 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.3
+FREESWITCH_VERSION = 1.10.5
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
@@ -12,17 +12,12 @@ FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
 	GPL-3.0+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
-	LGPL-2.0+ (sofia-sip), \
-	LGPL-2.1, GPL-2.0 (spandsp), \
 	BSD-3-Clause (libsrtp)
 
 FREESWITCH_LICENSE_FILES = \
 	COPYING \
 	libs/apr/LICENSE \
 	libs/apr-util/LICENSE \
-	libs/sofia-sip/COPYING \
-	libs/sofia-sip/COPYRIGHTS \
-	libs/spandsp/COPYING \
 	libs/srtp/LICENSE
 
 # required dependencies
@@ -32,6 +27,8 @@ FREESWITCH_DEPENDENCIES = \
 	libcurl \
 	openssl \
 	pcre \
+	spandsp \
+	sofia-sip \
 	speex \
 	sqlite \
 	tiff \
-- 
2.27.0
