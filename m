From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Oct 2009 23:44:18 +0200
Subject: [Buildroot] [git commit master] rsync: bump version
Message-ID: <20091007214451.4874077764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6bbcb0abaf4069e0f43b1c6f4bf60054270f0f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 3.0.6.
autoreconf is off per default, so no need to specify it.
Use config.cache (fix the incorrect package instead).
Pass ENABLE_DEBUG setting to configure.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/rsync/rsync.mk |    7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index c5ddbfd..13fa44b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
 	lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl, python,
-	quagga, radvd, samba, shared-mime-info, speech-tools,
+	quagga, radvd, rsync, samba, shared-mime-info, speech-tools,
 	squashfs, syslinux, u-boot, util-linux, valgrind, vsftpd, wipe,
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e24a38c..1ed6812 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,13 +4,12 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.5
+RSYNC_VERSION:=3.0.6
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
-RSYNC_AUTORECONF:=no
-RSYNC_USE_CONFIG_CACHE:=no
+RSYNC_SITE:=http://rsync.samba.org/ftp/rsync
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
+RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 ifeq ($(BR2_ENABLE_DEBUG),y)
 RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  install
-- 
1.6.3.3
