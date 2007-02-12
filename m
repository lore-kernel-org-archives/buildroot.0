From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:53 -0800
Subject: [Buildroot] [buildroot 0000763]: libglib12.mk does not properly
	copy dynamic version of glib
Message-ID: <137e2da8d6a4d55c83b20c09ddbbf226@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=763 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   763
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-01-2006 10:09 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    libglib12.mk does not properly copy dynamic version
of glib
Description: 
dynamic version of glib is not copy to target and is not sstriped. 

Suggested patch:
===================================================================
--- libglib12.mk        (revisi?n: 14387)
+++ libglib12.mk        (copia de trabajo)
@@ -65,8 +65,9 @@
 $(TARGET_DIR)/lib/$(LIBGLIB12_BINARY):
$(STAGING_DIR)/lib/$(LIBGLIB12_BINARY)
        cp -a $(STAGING_DIR)/lib/$(LIBGLIB12_BINARY) $(TARGET_DIR)/lib/
        cp -a $(STAGING_DIR)/lib/libglib.so $(TARGET_DIR)/lib/
-       cp -a $(STAGING_DIR)/lib/libglib-1.2.so.0 $(TARGET_DIR)/lib/
+       cp -a $(STAGING_DIR)/lib/libglib-1.2.so.* $(TARGET_DIR)/lib/
        $(STRIP) --strip-unneeded $(TARGET_DIR)/lib/$(LIBGLIB12_BINARY)
+       $(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10

 libglib12: uclibc $(TARGET_DIR)/lib/$(LIBGLIB12_BINARY)

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:21  
---------------------------------------------------------------------- 
This was fixed some time ago and works as expected with revision >= 17436.

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-06 10:09  janlana        New Issue                                    
03-01-06 10:09  janlana        Status                   new => assigned     
03-01-06 10:09  janlana        Assigned To               => uClibc          
01-21-07 09:21  bernhardf      Status                   assigned => closed  
01-21-07 09:21  bernhardf      Note Added: 0002024                          
01-21-07 09:21  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
