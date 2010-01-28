From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 22:55:42 +0100
Subject: [Buildroot] [git commit master] libxslt: fix dependency on libxml
Message-ID: <20100128220035.1D54677751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b732fe6db6919183c07618b02981873ba5c22da8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix indentation]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/libxslt/Config.in  |    1 +
 package/libxslt/libxslt.mk |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 383f0a8..2fc503e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, gvfs, flex, hal, iptables, iw, jpeg, kismet, libfuse,
-	libglib2, libpcap, libungif, libxml2, lighttpd, mesa, mpg123,
+	libglib2, libpcap, libungif, libxml2, libxslt, lighttpd, mesa, mpg123,
 	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, readline, rpm,
 	sawman, sdl, sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot,
 	usb_modeswitch, usbutils, webkit, wpa_supplicant, xfsprogs, zlib
diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index c318966..1dca1f0 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXSLT
 	bool "libxslt"
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Install the xslt library which is used
 	  to transform XML files to other XML files.
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 2478800..03c1131 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -23,7 +23,7 @@ LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
 		--without-threads \
 		--with-libxml-prefix=$(STAGING_DIR)/usr/
 
-LIBXSLT_DEPENDENCIES = $(LIBXSLT_DEPENDENCIES_EXTRA)
+LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 
 $(eval $(call AUTOTARGETS,package,libxslt))
 
-- 
1.6.3.3
