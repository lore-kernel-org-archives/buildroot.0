From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Jul 2010 22:17:08 +0200
Subject: [Buildroot] [git commit master 1/1] gmpc: fix typo
Message-ID: <20100725201735.D34ED8345D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e0dd50523c7f1131ba17e3dfbec41687b19a10b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with libSM support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/gmpc/gmpc.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6fa9b7b..2b3a071 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,7 +17,7 @@
 	Updated/fixed packages: alsa-lib, alsamixergui, avahi,
 	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
-	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
+	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk, gmpc,
 	gst-plugins-base, gst-plugins-good, gstreamer, gzip, intltool,
 	ipsec-tools, iptables, libart, libcgi, libdrm, libfuse,
 	libgpg-error, libidn, liblockfile, libpng, lighttpd, links,
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 6016e7c..940f264 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -15,7 +15,7 @@ GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intl
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
-GMPC_DEPENENCIES += xlib_libSM
+GMPC_DEPENDENCIES += xlib_libSM
 GMPC_CONF_OPT += --enable-sm
 else
 GMPC_CONF_OPT += --disable-sm
-- 
1.7.1
