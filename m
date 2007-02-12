From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:56 -0800
Subject: [Buildroot] [buildroot 0000777]: MTD_SOURCE empty
Message-ID: <91e8de68bc0fe52beebbf9330858c55e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=777 
====================================================================== 
Reported By:                blurgk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   777
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-08-2006 01:51 PST
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    MTD_SOURCE empty
Description: 
When using a JFFS2 root filesystem, and without activating the mtd/jffs2
utilities in the package selection, the download of the MTD source tarball
(not the snapshot) is not done and the uncompressing fails, the MTD_SOURCE
variable in mtd.mk is empty as BR2_PACKAGE_MTD_ORIG_STRING is not
defined.
Attached is a config file that reproduces the problem.  

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:35  
---------------------------------------------------------------------- 
Does the attached patch solve the problem for you? 

---------------------------------------------------------------------- 
 blurgk - 04-07-06 04:26  
---------------------------------------------------------------------- 
No, but it works without the quotes around the fallback source package name
(else if the file is already downloaded, it downloads it again). Thanks! 

---------------------------------------------------------------------- 
 andersen - 04-10-06 16:44  
---------------------------------------------------------------------- 
fixed per bug 0000786 by stripping quotes 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-08-06 01:51  blurgk         New Issue                                    
03-08-06 01:51  blurgk         Status                   new => assigned     
03-08-06 01:51  blurgk         Assigned To               => uClibc          
03-08-06 01:51  blurgk         File Added: .config                          
04-06-06 10:35  andersen       File Added: patch                            
04-06-06 10:35  andersen       Note Added: 0001225                          
04-07-06 04:26  blurgk         Note Added: 0001238                          
04-10-06 16:44  andersen       Note Added: 0001249                          
04-10-06 16:44  andersen       Status                   assigned => closed  
04-10-06 16:44  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
