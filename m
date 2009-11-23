From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:11:00 +0100
Subject: [Buildroot] [git commit master] libxml2: fix build with
	BR2_CONFIG_CACHE
Message-ID: <20091123121214.8479077782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa946b788e3f10d4c128f38ed07a7b8c9021e342
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    8 ++++----
 package/libxml2/libxml2.mk |    2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index edcb361..fb869f4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,10 +25,10 @@
 	gqview, gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good,
 	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, leafpad,
 	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
-	libupnp, libuuid, lighttpd, ltrace, lua, lzma, magiccube4d, matchbox,
-	mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp,
-	openssl, pcmanfm, php, python, quagga, radvd, rsync, rubix, samba,
-	sawman, sdl, shared-mime-info, spawn-fcgi, speech-tools, sqlite,
+	libupnp, libuuid, libxml2, lighttpd, ltrace, lua, lzma, magiccube4d,
+	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g,
+	openntp, openssl, pcmanfm, php, python, quagga, radvd, rsync, rubix,
+	samba, sawman, sdl, shared-mime-info, spawn-fcgi, speech-tools, sqlite,
 	squashfs, synergy, syslinux, target-binutils, tcpdump, u-boot,
 	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, xboard, xstroke, zlib
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 05153f3..ceabcd9 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -11,6 +11,8 @@ LIBXML2_INSTALL_TARGET = YES
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
+# the above doesn't work with shared config.cache
+LIBXML2_USE_CONFIG_CACHE = NO
 endif
 
 LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
-- 
1.6.3.3
