From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 23:18:51 +0200
Subject: [Buildroot] [git commit] ncurses: install screen terminfo file
Message-ID: <20120507212231.6754C96C5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e940b30385b75e3d5a42708a3de6d3fa43bd9226
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #5204

Install the terminfo file for screen.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |   19 ++++++++++---------
 package/ncurses/ncurses.mk |    2 ++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7fd8864..09dd6b1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -40,15 +40,15 @@
 	libupnp, liburcu, libusb, libusb-compat, libxml2,
 	libxml-parser-perl, libxslt, linux-firmware, linux-fusion,
 	lite, lsof, ltrace, lttng-libust, lua, makedevs, microperl,
-	mpd, mpfr, mpg123, mrouted, mtd, mysql_client, nbd, neon,
-	netsnmp, network-manager, nfs-utils, ngrep, ntfs-3g, openssh,
-	openssl, parted, pango, pcre, php, pixman, poco, psmisc,
-	pulseaudio, python, qt, quagga, radvd, rpm, ruby, samba,
-	sam-ba, sane-backends, sawman, screen, sdl_net, smartmontools,
-	sqlite, squashfs3, squid, sshfs, sudo, syslinux, sysstat,
-	taglib, tcpdump, tftp-hpa, transmission, tiff, tinyhttpd,
-	uboot-tools, udev, uemacs, unionfs, usbutils, util-linux,
-	vala, valgrind, vim, vsftpd, wipe,
+	mpd, mpfr, mpg123, mrouted, mtd, mysql_client, nbd, ncurses,
+	neon, netsnmp, network-manager, nfs-utils, ngrep, ntfs-3g,
+	openssh, openssl, parted, pango, pcre, php, pixman, poco,
+	psmisc, pulseaudio, python, qt, quagga, radvd, rpm, ruby,
+	samba, sam-ba, sane-backends, sawman, screen, sdl_net,
+	smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
+	syslinux, sysstat, taglib, tcpdump, tftp-hpa, transmission,
+	tiff, tinyhttpd, uboot-tools, udev, uemacs, unionfs, usbutils,
+	util-linux, vala, valgrind, vim, vsftpd, wipe,
 	xdriver_xf86-{input-vmmouse,video-fbdev}, xfsprogs, zlib
 
 	New packages: apr, audiofile, bellagio, fmtools,
@@ -78,6 +78,7 @@
 	#5018: dialog broken: exits with assert in uClibc
 	#5102: qt package moc, uic, rcc read from wrong place
 	#5144: Patch to fix ixon bug in uemacs
+	#5204: Missing terminfo file(s) for GNU screen terminal type
 
 2012.02, Released February 29th, 2012:
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index eb8a043..10a55dd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -117,6 +117,8 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
+	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
+	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
 	$(NCURSES_INSTALL_TARGET_DEVFILES)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
