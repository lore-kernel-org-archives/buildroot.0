From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 8 Feb 2007 08:36:38 -0800 (PST)
Subject: [Buildroot] using pkg-config when building
Message-ID: <8868910.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


If I try to use pkg-config when doing a cross-compile it does not work. 
Paths not found etc.

If I make the following modification to package/Makefile.in

@@ -91,6 +91,7 @@
 		OBJCOPY=$(TARGET_CROSS)objcopy \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
+	
PKG_CONFIG_PATH=$(STAGING_DIR)/lib/pkgconfig:$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/local/lib/pkgconfig
\
 		PKG_CONFIG=$(STAGING_DIR)/usr/bin/pkg-config

 This sets up the search path for pkgconfig and it will search these dirs
for pkgconfig files.  Seems to have made all the difference for me.  Maybe
this can make it into the tree.....

Cheers
Dan
-- 
View this message in context: http://www.nabble.com/using-pkg-config-when-building-tf3194366.html#a8868910
Sent from the BuildRoot mailing list archive at Nabble.com.
