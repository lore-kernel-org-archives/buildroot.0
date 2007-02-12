From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:39 -0800
Subject: [Buildroot] [buildroot 0001105]: Missing mkfs.jffs2 option for NAND
	Flash
Message-ID: <52c82473f90ec2762f84cf123f7318c0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1105 
====================================================================== 
Reported By:                artemys
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1105
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-29-2006 04:12 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    Missing mkfs.jffs2 option for NAND Flash
Description: 
When generating a JFFS2 rootfs for a NAND flash, an option should be added
to mkfs.jffs2 otherwise Linux kernel is printing a lot of warning messages
(during rootfs mounting) like:
  CLEANMARKER node found at 0x00...... has totlen 0xc != normal 0x0

These messages are considerably slowing down system boot.

"-n" option should be added to JFFS2_OPTS variable in
target/jffs2/jffs2root.mk Makefile.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:09  
---------------------------------------------------------------------- 
Fixed in svn a week or two ago.

Thanks for the report! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-29-06 04:12  artemys        New Issue                                    
11-29-06 04:12  artemys        Status                   new => assigned     
11-29-06 04:12  artemys        Assigned To               => uClibc          
11-29-06 09:13  artemys        File Added: 003-buildroot-cleanmarkers.diff      
             
02-04-07 09:09  bernhardf      Status                   assigned => closed  
02-04-07 09:09  bernhardf      Note Added: 0002107                          
02-04-07 09:09  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
