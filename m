From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jul 2008 16:00:50 -0700
Subject: [Buildroot] [buildroot 0004284]: procps compile fails due to
	missing page.h
Message-ID: <89b3954e3c938329bab66a6d5a1bc03c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             07-23-2008 16:00 PDT
Last Modified:              07-23-2008 16:00 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 16:00  pepe           New Issue                                    
07-23-08 16:00  pepe           Status                   new => assigned     
07-23-08 16:00  pepe           Assigned To               => buildroot       
======================================================================
