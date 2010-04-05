From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 5 Apr 2010 10:47:54 +0200
Subject: [Buildroot] [git commit master] Bump libdrm to 2.4.19
Message-ID: <20100405092238.7AC7E88D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=faa2f01231964c74bccb3e216a543469e4d72577
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adds proper dependency information to stop build errors.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Acked-By: Will Wagner<willw@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    9 +++++----
 package/libdrm/Config.in |    7 +++++++
 package/libdrm/libdrm.mk |    4 +++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 69867e9..aa7c284 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,10 +9,11 @@
 
 	New packages: librsync, lmbench, netperf, squid
 
-	Updated/fixed packages: busybox, dnsmasq, dosfstools, e2fsprogs,
-	freetype, iperf, iptables, iw, less, libgcrypt, libglib2, libpng,
-	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
-	qt, radvd, setserial, squashfs, wget, xlib_libX11, xlib_libXfont
+	Updated/fixed packages: busybox, dnsmasq, dosfstools,
+	e2fsprogs, freetype, iperf, iptables, iw, less, libdrm,
+	libgcrypt, libglib2, libpng, libxml2, mdadm, memstat,
+	mtd-utils, nano, openssl, php, pppd, qt, radvd, setserial,
+	squashfs, wget, xlib_libX11, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3d8a731..445eb72 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_PTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index eb04867..791e67d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,7 +3,7 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.11
+LIBDRM_VERSION = 2.4.19
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_AUTORECONF = NO
@@ -11,4 +11,6 @@ LIBDRM_LIBTOOL_PATCH = NO
 LIBDRM_INSTALL_STAGING = YES
 LIBDRM_INSTALL_TARGET = YES
 
+LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
+
 $(eval $(call AUTOTARGETS,package,libdrm))
-- 
1.6.3.3
