From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 22:09:23 +0100
Subject: [Buildroot] [git commit master] libpcap: always make install for
	the staging dir
Message-ID: <20091206211452.B6A4A7770D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9c0d809d4de4e59c80debbd41fa71464b9d256b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So that the headers get installed in the staging directory for other packages
that need to use them.

[Peter: tweaked whitespace changes]
Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/libpcap/libpcap.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b99f11d..6af8cd6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,7 +1,7 @@
 2010.02, Not yet released:
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox, iw,
-	lighttpd, mesa, pcre, usbutils
+	libpcap, lighttpd, mesa, pcre, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 272d646..dc72924 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -11,8 +11,8 @@ LIBPCAP_INSTALL_STAGING:=YES
 # doesn't have an install-strip
 LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" \
-	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
+LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
+	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 LIBPCAP_DEPENDENCIES:=zlib
 LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
-- 
1.6.3.3
