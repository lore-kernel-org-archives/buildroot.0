From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] lighttpd: fix build with pcre
	support
Message-ID: <20100722110846.D037B82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=519fed5f73d0510c37500463ccde529729e4c7f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to tell where pcre-config is installed, now that STAGING_DIR/usr/bin
no longer is in the path.
---
 CHANGES                      |    2 +-
 package/lighttpd/lighttpd.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 28fc5be..a67effe 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
 	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
 	libcgi, libdrm, libfuse, libgpg-error, libidn, liblockfile,
-	libpng, links, linux-fusion, lmbench, lrzsz, make,
+	libpng, lighttpd, links, linux-fusion, lmbench, lrzsz, make,
 	module-init-tools, mysql_client, nbd, ncurses, neon, netcat,
 	netperf, ntfsprogs, openssl, php, qt, quagga, sqlite, sdl,
 	sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 1a2562c..3ac1f07 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -37,7 +37,7 @@ LIGHTTPD_CONF_OPT += --without-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
-LIGHTTPD_CONF_ENV = PCRE_LIB="-lpcre"
+LIGHTTPD_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
 LIGHTTPD_DEPENDENCIES += pcre
 LIGHTTPD_CONF_OPT += --with-pcre
 else
-- 
1.7.1
