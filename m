From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
Message-ID: <20080804190841.C32923C909@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:41 -0700 (Mon, 04 Aug 2008)
New Revision: 23040

Log:
i2c-tools: cleanup clean target

Modified:
   trunk/buildroot/package/i2c-tools/i2c-tools.mk


Changeset:
Modified: trunk/buildroot/package/i2c-tools/i2c-tools.mk
===================================================================
--- trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-08-04 19:08:38 UTC (rev 23039)
+++ trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-08-04 19:08:41 UTC (rev 23040)
@@ -34,10 +34,7 @@
 i2c-tools-source: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
 
 i2c-tools-clean:
-	for i in i2cdump i2cget i2cset i2cdetect; \
-	do \
-		rm -f $(TARGET_DIR)/usr/bin/$$i; \
-	done
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,i2cdump i2cget i2cset i2cdetect)
 	-$(MAKE) -C $(I2C_TOOLS_DIR) clean
 
 i2c-tools-dirclean:
