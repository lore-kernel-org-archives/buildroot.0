From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 13 Oct 2007 23:37:42 +0300
Subject: [Buildroot] PATCH: allow wipe to cross-compile
Message-ID: <47112C96.3090604@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Wipe produces only x86 binaries.
This patch allows cross-compile:


Index: package/wipe/wipe.mk
===================================================================
--- package/wipe/wipe.mk        (revision 20237)
+++ package/wipe/wipe.mk        (working copy)
@@ -33,7 +33,7 @@

 $(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
        rm -f $(WIPE_DIR)/$(WIPE_BINARY)
-       $(MAKE) CC=$(TARGET_CC) -C $(WIPE_DIR) generic
+       $(MAKE) CC=$(TARGET_CC) CC_GENERIC=$(TARGET_CC) -C $(WIPE_DIR) generic

 $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
        cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)




Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
