From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 14:31:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.10.2
Message-ID: <20200104133141.2181213-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001.

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../freeswitch/0001-Fix-cross-compiling-libvpx.patch |  4 ++--
 package/freeswitch/freeswitch.hash                   | 12 ++++++------
 package/freeswitch/freeswitch.mk                     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
index db4607e28b..63fa33b93a 100644
--- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
+++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
@@ -22,8 +22,8 @@ diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
  	cd libs/libzrtp && $(MAKE)
  
  libs/libvpx/Makefile: libs/libvpx/.update
--	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
-+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384 --extra-cflags="$(VISIBILITY_FLAG)"
+-	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
  
  libs/libvpx/libvpx.a: libs/libvpx/Makefile libs/libvpx/.update
  	@cd libs/libvpx && $(MAKE)
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 9811ca753c..f300e69bf4 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.md5
-md5 74c97835cace6309e552b017f8dfca81 freeswitch-1.10.1.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.sha1
-sha1 6c6ce3dd3de1bce36043b9885cd8863ad3a466c0 freeswitch-1.10.1.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.1.tar.xz.sha256
-sha256 360c867103c5f529a3724a46cf86da9b9acd8443b6793eb7f88fba0ace72001d freeswitch-1.10.1.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.md5
+md5 89d66f87f0f6c2471aa95aee48f55fdc freeswitch-1.10.2.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.sha1
+sha1 90dac82cb4fb8fc11e399fd4bdac7163fb40259b freeswitch-1.10.2.-release.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.sha256
+sha256 1fd46dee82ecc52ac90ebab6bd454e34c64950fae7d6dc0589c8daa14bfc7d34 freeswitch-1.10.2.-release.tar.xz
 # Locally computed
 sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 41f298a313..d743e60f1c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.1
+FREESWITCH_VERSION = 1.10.2
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.20.1
