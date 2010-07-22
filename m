From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] thttpd: fix build,
	don't override CFLAGS at make time
Message-ID: <20100722110848.4934F82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a01196efdd3e23b374897787962a82aa0fc5bb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already provide the correct CFLAGS/LDFLAGS at configure time, so don't pass them
again at make time, as this then overrides the extra CFLAGS (defines) in the Makefile.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    4 ++--
 package/thttpd/thttpd.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 381141a..40b92c4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,8 +24,8 @@
 	lmbench, lrzsz, ltrace, make, module-init-tools, mplayer,
 	mysql_client, nbd, ncurses, neon, netcat, netperf, ntfsprogs,
 	openssl, php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound,
-	sdl_ttf, squashfs, tn5250, tremor, usbutils, xkeyboard-config,
-	xserver_xorg-server, xvkbd
+	sdl_ttf, squashfs, thttpd, tn5250, tremor, usbutils,
+	xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 8804125..ca72fae 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -35,7 +35,7 @@ $(THTTPD_DIR)/.configured: $(THTTPD_DIR)/.unpacked
 	touch $(THTTPD_DIR)/.configured
 
 $(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(THTTPD_DIR)
+	$(MAKE) -C $(THTTPD_DIR)
 
 $(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
 	install -D $(THTTPD_DIR)/$(THTTPD_BINARY) $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-- 
1.7.1
