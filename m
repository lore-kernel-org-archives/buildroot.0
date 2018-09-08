From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:10:13 +0200
Subject: [Buildroot] [git commit] freeswitch: bump version to 1.8.1
Message-ID: <20180908130956.4123B835B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e4b7ea3f615d09b9e8426306a17ae5c145be0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables openssl-1.1.x compatible compile.

- add tiff dependency (bundled tiff source is gone)
- rebase (and git format) 0001-libvpx-cross.patch patch
- update libs/srtp/LICENSE file hash (updated copyright year)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Bernd:
- bumped to 1.8.1
- rebased patch 0001 to the tarball release
- added hashes for libvpx & libyuv license files]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ross.patch => 0001-Fix-cross-compiling-libvpx.patch} |  6 +++---
 package/freeswitch/Config.in                            |  1 +
 package/freeswitch/freeswitch.hash                      | 17 +++++++++--------
 package/freeswitch/freeswitch.mk                        |  9 ++++-----
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/package/freeswitch/0001-libvpx-cross.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
similarity index 88%
rename from package/freeswitch/0001-libvpx-cross.patch
rename to package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
index a2583dac35..1d4b97a7a0 100644
--- a/package/freeswitch/0001-libvpx-cross.patch
+++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
@@ -18,12 +18,12 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
 --- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
 +++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
-@@ -3491,7 +3491,7 @@
+@@ -4025,7 +4025,7 @@
  	cd libs/libzrtp && $(MAKE)
  
  libs/libvpx/Makefile:
--	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
-+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
+-	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
  
  libs/libvpx/libvpx.a: libs/libvpx/Makefile
  	@cd libs/libvpx && $(MAKE)
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index ff2898dc3c..bd961314e7 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_SPEEX
 	select BR2_PACKAGE_SPEEXDSP
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 25421de99b..24c86e6295 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,17 +1,18 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.md5
-md5 e9890a2d6ca6f58dd3fa440fdfbf91a0  freeswitch-1.6.20.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha1
-sha1 ce284b805e262504cbb1f74796785b4dfa70d5ac  freeswitch-1.6.20.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha256
-sha256 dbb0f73109171bd381772b247b8ef581f6a176964619082a1fe031b004086f6b  freeswitch-1.6.20.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.md5
+md5 71b5df2c2fb369f6a7172b2cd9c9e594 freeswitch-1.8.1.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.sha1
+sha1 26ffa89faa8c83e2c6da6eda1f31fa7f9304346c freeswitch-1.8.1.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.sha256
+sha256 f606de858e2df09a752f890e8f0fc41dae8dd888e3fe952e17a90e9ff9ed270e freeswitch-1.8.1.tar.xz
 # Locally computed
 sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
+sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
+sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
 sha256 7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
 sha256 e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
 sha256 b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
 sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
-sha256 8defed37d52096ae14b60adc499c33d43975109bc265552ee67e9a888c634b93  libs/srtp/LICENSE
-sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  libs/tiff-4.0.2/COPYRIGHT
+sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7f2a067a35..2657a39040 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.20
+FREESWITCH_VERSION = 1.8.1
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
@@ -14,8 +14,7 @@ FREESWITCH_LICENSE = MPL-1.1, \
 	Apache-2.0 (apr, apr-util), \
 	LGPL-2.0+ (sofia-sip), \
 	LGPL-2.1, GPL-2.0 (spandsp), \
-	BSD-3-Clause (libsrtp), \
-	tiff license
+	BSD-3-Clause (libsrtp)
 
 FREESWITCH_LICENSE_FILES = \
 	COPYING \
@@ -24,8 +23,7 @@ FREESWITCH_LICENSE_FILES = \
 	libs/sofia-sip/COPYING \
 	libs/sofia-sip/COPYRIGHTS \
 	libs/spandsp/COPYING \
-	libs/srtp/LICENSE \
-	libs/tiff-4.0.2/COPYRIGHT
+	libs/srtp/LICENSE
 
 # required dependencies
 FREESWITCH_DEPENDENCIES = \
@@ -36,6 +34,7 @@ FREESWITCH_DEPENDENCIES = \
 	pcre \
 	speex \
 	sqlite \
+	tiff \
 	util-linux \
 	zlib
 
