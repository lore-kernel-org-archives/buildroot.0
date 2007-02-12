From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:16 -0800
Subject: [Buildroot] [buildroot 0000753]: missing libfusion and libdirect
Message-ID: <c0580ffb63e7eaa069f3f83228cb8b4e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=753 
====================================================================== 
Reported By:                vspaceg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   753
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-23-2006 09:36 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    missing libfusion and libdirect
Description: 
After I generated the root file system, my directfb application misses
libfusion and libdirect. Those library are provided by directfb

Workaround:
I patched directfb.mk:

$(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
	$(MAKE) -C $(DIRECTFB_DIR) install
	$(MAKE) -C $(DIRECTFB_DIR)/lib/fusion install
	$(MAKE) -C $(DIRECTFB_DIR)/lib/direct install
	touch -c $(STAGING_DIR)/lib/libdirectfb.so


====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:50  
---------------------------------------------------------------------- 
This problem has been fixed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-23-06 09:36  vspaceg        New Issue                                    
02-23-06 09:36  vspaceg        Status                   new => assigned     
02-23-06 09:36  vspaceg        Assigned To               => uClibc          
04-06-06 10:50  andersen       Note Added: 0001231                          
04-06-06 10:50  andersen       Status                   assigned => closed  
04-06-06 10:50  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
