From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:22 -0800
Subject: [Buildroot] [buildroot 0000365]: $(BUILD_DIR)/busybox/.unpacked
	does not depend on $(BUILD_DIR)
Message-ID: <643f4187697158c86369d571d6c34ea6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=365 
====================================================================== 
Reported By:                uzeisberger
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   365
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-03-2005 01:06 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    $(BUILD_DIR)/busybox/.unpacked does not depend on
$(BUILD_DIR)
Description: 
If I call

$ make `pwd`/build_arm/busybox/.unpacked

(after a matching configuration, s.t. BUILD_DIR=pwd`/build_arm/) the
resulting tar command fails because $(BUILD_DIR) does not exist.

The easy fix would be to add $(BUILD_DIR) to the dependencies of
busybox/.unpacked

The more complete one would be to revise all Makefile snipplets to add
this dependency
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-05-05 23:01  
---------------------------------------------------------------------- 
why exactly is this an issue ? 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:22  
---------------------------------------------------------------------- 
dont see any reason for this at this time ... all packages would have to be
updated, not just busybox 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-03-05 01:06  uzeisberger    New Issue                                    
08-03-05 01:06  uzeisberger    Status                   new => assigned     
08-03-05 01:06  uzeisberger    Assigned To               => uClibc          
08-05-05 23:01  vapier         Note Added: 0000387                          
09-07-05 17:22  vapier         Note Added: 0000499                          
09-07-05 17:22  vapier         Status                   assigned => closed  
09-07-05 17:22  vapier         Resolution               open => won't fix   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
