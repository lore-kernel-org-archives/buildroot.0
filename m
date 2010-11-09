From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 07:50:56 -0800
Subject: [Buildroot] Buildroot Patches I Use [3] - ldconfig -N opt
Message-ID: <1289317856.30565.115.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This instructs the ldconfig not to build / rebuild the cache.  It was a
while back I encountered this and I have just carried it forward since.
Someone more expert should check this and decide on its appropriateness
for 2010.11 and/or future buildroot release.


Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>



Index: buildroot-2010.11_powerpc/Makefile
===================================================================
--- buildroot-2010.11_powerpc.orig/Makefile
+++ buildroot-2010.11_powerpc/Makefile
@@ -413,9 +413,9 @@ endif
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
 	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
+		$(TARGET_CROSS)ldconfig -N -r $(TARGET_DIR); \
 	else \
-		/sbin/ldconfig -r $(TARGET_DIR); \
+		/sbin/ldconfig -N -r $(TARGET_DIR); \
 	fi
 	echo $(BR2_VERSION_FULL) > $(TARGET_DIR)/etc/br-version
 
