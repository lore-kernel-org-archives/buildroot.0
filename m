From: Simon Pasch <fpasch@googlemail.com>
Date: Fri, 24 Aug 2007 10:32:20 +0200
Subject: [Buildroot] wrong path in alsa-lib.mk
Message-ID: <f90898420708240132l42eff6cds6b59d76bb4733380@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building of alsa-lib fails because of a wrong library-path in the makefile.


--- buildroot.old/package/alsa-lib/alsa-lib.mk	2007-08-24
10:23:53.000000000 +0200
+++ buildroot/package/alsa-lib/alsa-lib.mk	2007-08-24 10:24:37.000000000 +0200
@@ -50,7 +50,7 @@
 $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY):
$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/usr/share/alsa
 	mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
-	cp -dpf $(STAGING_DIR)/lib/libasound.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libasound.so* $(TARGET_DIR)/usr/lib/
 	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
 	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
