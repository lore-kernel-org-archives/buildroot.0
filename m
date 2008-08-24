From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 24 Aug 2008 05:40:57 -0700
Subject: [Buildroot] [buildroot 0004284]: procps compile fails due to
	missing page.h
Message-ID: <3708058e2b08402560b0d4e976e0c012@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4284 
====================================================================== 
Reported By:                pepe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4284
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-23-2008 16:00 PDT
Last Modified:              08-24-2008 05:40 PDT
====================================================================== 
Summary:                    procps compile fails due to missing page.h
Description: 
Google seems to be telling me this file is deprecated. There is code for
the case that PAGE_SIZE is not declared in page. But procps is trying to
include the page.h in ps/common.h anyway, which fails in current buildroot
for i686.

The include-line can simply be removed to let the programm compile.
Instead, PROCPS_VERSION can simply be incremented from 3.2.5 to 3.2.7 to
get a working version from upstream.


====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-24-08 05:40  
---------------------------------------------------------------------- 
Thanks, fixed in r23195. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 16:00  pepe           New Issue                                    
07-23-08 16:00  pepe           Status                   new => assigned     
07-23-08 16:00  pepe           Assigned To               => buildroot       
08-24-08 05:40  jacmet         Status                   assigned => closed  
08-24-08 05:40  jacmet         Note Added: 0010744                          
======================================================================
