From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 21 Aug 2007 11:47:58 -0700
Subject: [Buildroot] [buildroot 0001451]: patch to make installation of
	libpng posible
Message-ID: <8ebc618a13d39e5553ebc557cf74d106@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1451 
====================================================================== 
Reported By:                pavko
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1451
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-30-2007 15:15 PDT
Last Modified:              08-21-2007 11:47 PDT
====================================================================== 
Summary:                    patch to make installation of libpng posible
Description: 
diff -urN libpng.mk.orig libpng.mk
--- libpng.mk.orig      2007-07-29 22:26:39.000000000 +0200
+++ libpng.mk   2007-07-29 23:27:49.759689111 +0200
@@ -62,7 +62,7 @@
        $(MAKE) -C $(LIBPNG_DIR)
        touch $@
 
-$(STAGING_DIR)/lib/libpng.so: $(LIBPNG_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libpng.so: $(LIBPNG_DIR)/.compiled
        $(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPNG_DIR) install;
        $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g"
$(STAGING_DIR)/usr/lib/libpng12.la
        $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
@@ -72,8 +72,8 @@
                $(STAGING_DIR)/usr/bin/libpng12-config
        touch -c $@
 
-$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
-       cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/usr/lib/libpng.so
+       cp -dpf $(STAGING_DIR)/usr/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
        -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libpng.so
 
 png libpng: uclibc zlib pkgconfig $(TARGET_DIR)/usr/lib/libpng.so

====================================================================== 

---------------------------------------------------------------------- 
 pavko - 08-14-07 12:02  
---------------------------------------------------------------------- 
should be closed as it's been fixed with similar patch from maillist 

---------------------------------------------------------------------- 
 bernhardf - 08-21-07 11:47  
---------------------------------------------------------------------- 
Closing upon reporter's request. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-30-07 15:15  pavko          New Issue                                    
07-30-07 15:15  pavko          Status                   new => assigned     
07-30-07 15:15  pavko          Assigned To               => buildroot       
08-14-07 12:02  pavko          Note Added: 0002663                          
08-21-07 11:47  bernhardf      Status                   assigned => closed  
08-21-07 11:47  bernhardf      Note Added: 0002675                          
======================================================================
