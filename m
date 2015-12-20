From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:49:39 +0100
Subject: [Buildroot] [git commit] start-stop-daemon: bump to version 1.18.3
Message-ID: <20151220215009.48616822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db91d6989853fef51cc7d4599d2780681d8bc628
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable developer mode to skip the shared library check in configure and
avoid further patching.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-add-uclibc-alias-and-musl.patch           | 28 +++++++---------------
 package/start-stop-daemon/start-stop-daemon.hash   |  4 ++--
 package/start-stop-daemon/start-stop-daemon.mk     |  7 +++---
 3 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
index 0b726d4..64dc00d 100644
--- a/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
+++ b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
@@ -1,26 +1,26 @@
 Make linux-uclibcgnueabi an alias for linux-uclibceabi since it's
 what we use in buildroot toolchains.
-Also add support for musl libc which is a backport from 1.17.x with
-a slight tweak for musleabi (non-hf).
+Slightly tweak musleabi to match the buildroot-used tuple.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura dpkg-1.16.15.orig/ostable dpkg-1.16.15/ostable
---- dpkg-1.16.15.orig/ostable	2014-11-07 08:09:07.358304926 -0300
-+++ dpkg-1.16.15/ostable	2014-11-07 09:35:06.158580079 -0300
-@@ -14,8 +14,10 @@
+diff -Nura dpkg-1.18.3.orig/ostable dpkg-1.18.3/ostable
+--- dpkg-1.18.3.orig/ostable	2015-10-15 08:05:04.471762555 -0300
++++ dpkg-1.18.3/ostable	2015-10-15 08:11:05.206132648 -0300
+@@ -12,10 +12,10 @@
  # system part of the output of the GNU config.guess script.
  #
  # <Debian name>		<GNU name>		<config.guess regex>
 -uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
 +uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibc.*eabi
  uclibc-linux		linux-uclibc		linux[^-]*-uclibc
-+musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
+ musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
+-musl-linux		linux-musl		linux[^-]*-musl
 +musl-linux		linux-musl		linux[^-]*-musl[^-]*
  gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
  gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
  gnuabin32-linux		linux-gnuabin32		linux[^-]*-gnuabin32
-@@ -33,6 +35,6 @@
+@@ -34,6 +34,6 @@
  bsd-netbsd		netbsd			netbsd[^-]*
  bsd-openbsd		openbsd			openbsd[^-]*
  sysv-solaris		solaris			solaris[^-]*
@@ -28,15 +28,3 @@ diff -Nura dpkg-1.16.15.orig/ostable dpkg-1.16.15/ostable
 +uclibceabi-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibc.*eabi
  uclibc-uclinux		uclinux-uclibc		uclinux[^-]*(-uclibc.*)?
  tos-mint		mint			mint[^-]*
-diff -Nura dpkg-1.16.15.orig/triplettable dpkg-1.16.15/triplettable
---- dpkg-1.16.15.orig/triplettable	2014-11-07 08:09:07.345304482 -0300
-+++ dpkg-1.16.15/triplettable	2014-11-07 09:35:29.098364036 -0300
-@@ -5,6 +5,8 @@
- # <Debian triplet>	<Debian arch>
- uclibceabi-linux-arm	uclibc-linux-armel
- uclibc-linux-<cpu>	uclibc-linux-<cpu>
-+musleabihf-linux-arm	musl-linux-armhf
-+musl-linux-<cpu>	musl-linux-<cpu>
- gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
- gnuabin32-linux-mips64el	mipsn32el
diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index e3ab29f..295c2ff 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.16.15.dsc
-sha256	92bca9901ba2d9300be42f6de8dbea59b8367a918a2abeeb47d2176c9cf86b55	dpkg_1.16.15.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.3.dsc
+sha256	a40ffe38d7f36d858a752189a306433cfc52c7d15d7b98f61d9f9dd49e0e4807	dpkg_1.18.3.tar.xz
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 5df44d4..a38f927 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -7,9 +7,9 @@
 # Debian start-stop-daemon is part of dpkg. Since start-stop-daemon is the only
 # interesting tool in it, we call the buildroot package start-stop-daemon.
 
-START_STOP_DAEMON_VERSION = 1.16.15
+START_STOP_DAEMON_VERSION = 1.18.3
 START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
-START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20140616T044945Z/pool/main/d/dpkg
+START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20150921T092814Z/pool/main/d/dpkg
 START_STOP_DAEMON_CONF_OPTS = \
 	--disable-dselect \
 	--disable-update-alternatives \
@@ -17,7 +17,8 @@ START_STOP_DAEMON_CONF_OPTS = \
 	--exec-prefix=/
 START_STOP_DAEMON_CONF_ENV = \
 	dpkg_cv_va_copy=yes \
-	dpkg_cv_c99_snprintf=yes
+	dpkg_cv_c99_snprintf=yes \
+	DPKG_DEVEL_MODE=1
 START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 # Patching m4/dpkg-arch.m4
