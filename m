From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:31 -0800
Subject: [Buildroot] [buildroot 0000629]: Fix Makefile to really use
	download pci.ids file
Message-ID: <b19d8fcd4c79de4c9e1450ba8d0c4ee2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=629 
====================================================================== 
Reported By:                kostja
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   629
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-08-2006 04:49 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Fix Makefile to really use download pci.ids file
Description: 
Typo in pciutils.mk. 

The downloaded pci.ids file is never used, but an old included 2003
snapshot instead.

--- pciutils.mk.old     2006-01-08 13:36:16.000000000 +0100
+++ pciutils.mk 2006-01-08 13:36:28.000000000 +0100
@@ -24,7 +24,7 @@

 $(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE)
$(DL_DIR)/$(PCIIDS_SOURCE)
        $(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
-       $(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) > $(PCIUTILS_DIR)/pci.id
+       $(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) >
$(PCIUTILS_DIR)/pci.ids
        toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils
pciutils\*.patch
        touch $(PCIUTILS_DIR)/.unpacked

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 01-08-06 18:46  
---------------------------------------------------------------------- 
fixed in svn, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-08-06 04:49  kostja         New Issue                                    
01-08-06 04:49  kostja         Status                   new => assigned     
01-08-06 04:49  kostja         Assigned To               => uClibc          
01-08-06 04:52  kostja         Issue Monitored: kostja                      
01-08-06 04:53  kostja         File Added: fix-pciutils.mk.patch                
   
01-08-06 18:46  vapier         Note Added: 0000875                          
01-08-06 18:46  vapier         Status                   assigned => closed  
01-08-06 18:46  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
