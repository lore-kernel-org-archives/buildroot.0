From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 23:24:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: fix gcc visibility flags
Message-ID: <20200104222403.1631525-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8c6/8c6671f64b2746033750ea043d9f96030ac5591d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/0001-Fix-cross-compiling-libvpx.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
index 63fa33b93a..d59e6739b3 100644
--- a/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
+++ b/package/freeswitch/0001-Fix-cross-compiling-libvpx.patch
@@ -10,6 +10,8 @@ package/freeswitch/freeswitch.mk and add target=generic-gnu as
 configure parameter:
 https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
 
+Also remove VISIBILITY_FLAG to fix gcc issues.
+
 And yes, autoreconf is also broken, so we patch Makefile.in instead
 of Makefile.am.
 
@@ -23,7 +25,7 @@ diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
  
  libs/libvpx/Makefile: libs/libvpx/.update
 -	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
-+	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) $(VISIBILITY_FLAG)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS) CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --size-limit=16384x16384
  
  libs/libvpx/libvpx.a: libs/libvpx/Makefile libs/libvpx/.update
  	@cd libs/libvpx && $(MAKE)
-- 
2.20.1
