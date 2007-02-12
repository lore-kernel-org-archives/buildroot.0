From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:13 -0800
Subject: [Buildroot] [buildroot 0000517]: Fix gcc-clean so it doesn't remove
	binutils binaries
Message-ID: <d949ac66cfc5a1a2ef3b09ddfe8564ad@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=517 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   517
Category:                   Other
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:45 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Fix gcc-clean so it doesn't remove binutils binaries
Description: 
this has one disadvantage, the gcc binaries are hardcoded in the makefile,
but I can't find a way to avoid that without gcc-clean being a completely
useless target, as it is now.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 10-28-05 23:51  
---------------------------------------------------------------------- 
hardcoding gcc-VER is not a good idea ... just change it to 'gcc*' 

---------------------------------------------------------------------- 
 akvadrako - 10-29-05 15:48  
---------------------------------------------------------------------- 
Agreed.  Here is an updated patch. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:45  akvadrako      New Issue                                    
10-28-05 09:45  akvadrako      Status                   new => assigned     
10-28-05 09:45  akvadrako      Assigned To               => uClibc          
10-28-05 09:45  akvadrako      File Added: br-gcc-clean-fixes.patch             
      
10-28-05 23:51  vapier         Note Added: 0000648                          
10-29-05 15:49  akvadrako      Note Added: 0000649                          
10-29-05 15:50  akvadrako      File Added: br-gcc-clean-fixes-v2.patch          
         
01-27-06 14:50  akvadrako      File Added: br-gcc-clean-fixes-v3.patch          
         
02-10-06 10:28  prpplague      Additional Information Updated                   

02-10-06 10:29  prpplague      Status                   assigned => resolved
02-10-06 10:29  prpplague      Resolution               open => fixed       
03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
