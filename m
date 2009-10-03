From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] wipe: fix build without largefile
	support
Message-ID: <20091003210636.4520B776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6e0ab231cd97a8431609e8260a30b6996957fb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And pass proper cflags.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/wipe/wipe.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1f9081a..6e7f259 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	festival, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libuuid, ltrace, mdadm,
 	ncftp, netkittelnet, openssl, python, quagga, radvd, samba,
-	speech-tools, squashfs, syslinux, u-boot, valgrind,
+	speech-tools, squashfs, syslinux, u-boot, valgrind, wipe,
 	xdata_xcursor-themes
 
 	Removed package: mdnsresponder, mpatrol
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 1f222c6..44d5cc4 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -33,7 +33,7 @@ $(WIPE_DIR)/.configured: $(WIPE_DIR)/.unpacked
 
 $(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
 	rm -f $(WIPE_DIR)/$(WIPE_BINARY)
-	$(MAKE) CC=$(TARGET_CC) CC_GENERIC=$(TARGET_CC) -C $(WIPE_DIR) generic
+	$(MAKE) CC=$(TARGET_CC) CC_GENERIC=$(TARGET_CC) CCO_GENERIC="$(TARGET_CFLAGS)" -C $(WIPE_DIR) generic
 
 $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
 	cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
-- 
1.6.3.3
