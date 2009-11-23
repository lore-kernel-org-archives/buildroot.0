From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] alsa-lib: fix build with
	BR2_CONFIG_CACHE
Message-ID: <20091123120651.93A5077782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81e4ba320b982fa4c74d00a46ddb918fc492a1b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    6 +++---
 package/multimedia/alsa-lib/alsa-lib.mk |    2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5be5c94..edcb361 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,9 +20,9 @@
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
 
-	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
-	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf, gqview,
-	gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good,
+	Updated/fixed packages: alsa-lib, alsamixergui, autoconf, bootutils,
+	busybox, gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf,
+	gqview, gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good,
 	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, leafpad,
 	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
 	libupnp, libuuid, lighttpd, ltrace, lua, lzma, magiccube4d, matchbox,
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 5db0393..517021d 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -39,6 +39,8 @@ endif
 
 ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
+# the above doesn't work with shared config.cache
+ALSA_LIB_USE_CONFIG_CACHE = NO
 
 $(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
 
-- 
1.6.3.3
