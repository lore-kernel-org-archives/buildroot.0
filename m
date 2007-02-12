From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:25 -0800
Subject: [Buildroot] [buildroot 0000800]: DirectFB compiles with
	$(STAGING_DIR) as hardcoded path to run-time modules
Message-ID: <783d37f854c5abdc8bbb792ca1fdbf0e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=800 
====================================================================== 
Reported By:                tyler
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   800
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-27-2006 13:30 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    DirectFB compiles with $(STAGING_DIR) as hardcoded
path to run-time modules
Description: 
Building DirectFB compiles fine and installs fine, but when running on the
target the libraries look for DirectFB modules within a path that was
defined as $(PREFIX) during the build. Under buildroot PREFIX is set to
$(STAGING_DIR)/usr, which obviously doesn't exist on the target so it
dies.

Instead, it should be built such that PREFIX=/usr then have prefix &
exec_prefix set to $(STAGING_DIR)/usr when it's time to install.

I have attached a patch (and verified on the target) to be applied to
directfb.mk that fixes this.
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:41  
---------------------------------------------------------------------- 
applied thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-27-06 13:30  tyler          New Issue                                    
03-27-06 13:30  tyler          Status                   new => assigned     
03-27-06 13:30  tyler          Assigned To               => uClibc          
03-27-06 13:30  tyler          File Added: directfb.mk.patch                    
04-06-06 10:41  andersen       Note Added: 0001226                          
04-06-06 10:41  andersen       Status                   assigned => closed  
04-06-06 10:41  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
