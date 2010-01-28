From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 22:31:27 +0100
Subject: [Buildroot] [git commit master] zlib: fix headers installation in
	target directory
Message-ID: <20100128214805.832F377751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ad8ad0c3729ccf7012f414969304950fb58c456
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++--
 package/zlib/zlib.mk |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 578543b..97c5501 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	libglib2, libpcap, libungif, libxml2, lighttpd, mesa, mpg123,
 	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, rpm, sawman, sdl,
 	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
-	usbutils, webkit, wpa_supplicant, xfsprogs
+	usbutils, webkit, wpa_supplicant, xfsprogs, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -94,7 +94,7 @@
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
 	synergy, syslinux, sysklogd, target-binutils, tcpdump, torsmo, u-boot,
 	udpcast, util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
-	xdata_xcursor-themes, xboard, xfsprogs, xstroke, zlib
+	xdata_xcursor-themes, xboard, xfsprogs, xstroke, zlib[5~
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 5365b30..7432473 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -43,8 +43,8 @@ endef
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define ZLIB_INSTALL_TARGET_HEADERS
-	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
-	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D $(@D)/zlib.h $(TARGET_DIR)/usr/include/zlib.h
+	$(INSTALL) $(@D)/zconf.h $(TARGET_DIR)/usr/include/
 endef
 endif
 
-- 
1.6.3.3
