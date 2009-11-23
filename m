From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:10:53 +0100
Subject: [Buildroot] [git commit master] sfdisk: fix build with
	!BR2_LARGEFILE
Message-ID: <20091123141347.C26DB777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7046770181fc465783612e76124e422399c124b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    8 ++++----
 package/sfdisk/sfdisk.mk |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index b620a1b..9ff8793 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,10 +29,10 @@
 	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp,
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
 	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
-	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
-	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
-	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard, xstroke,
-	zlib
+	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
+	synergy, syslinux, target-binutils, tcpdump, u-boot, util-linux,
+	valgrind, vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard,
+	xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/sfdisk/sfdisk.mk b/package/sfdisk/sfdisk.mk
index 87a3f04..81c4943 100644
--- a/package/sfdisk/sfdisk.mk
+++ b/package/sfdisk/sfdisk.mk
@@ -21,7 +21,7 @@ $(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
 $(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)/.patched
 	$(MAKE) \
 		CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$(TARGET_CFLAGS)" \
-		-C $(SFDISK_DIR)
+		DOLFS=$(if $(BR2_LARGEFILE),true,false) -C $(SFDISK_DIR)
 	-$(STRIPCMD) $(SFDISK_DIR)/sfdisk
 	touch -c $(SFDISK_DIR)/sfdisk
 
-- 
1.6.3.3
