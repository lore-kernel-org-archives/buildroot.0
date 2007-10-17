From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 17 Oct 2007 04:21:46 -0700
Subject: [Buildroot] [buildroot 0001538]: depmod fails in linux package
	[20270]
Message-ID: <49ed37f5ff144ee8fbad31dc429e42ae@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1538 
====================================================================== 
Reported By:                HappyCactus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1538
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-17-2007 04:21 PDT
Last Modified:              10-17-2007 04:21 PDT
====================================================================== 
Summary:                    depmod fails in linux package [20270]
Description: 
depmod fails when compiling the kernel, because rm -rf removes all the
lib/modules/$linux-version directory before calling make+depmod, so a
"directory not found" error will be issued.
Just a mkdir -p before the failing make solves the issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-17-07 04:21  HappyCactus    New Issue                                    
10-17-07 04:21  HappyCactus    Status                   new => assigned     
10-17-07 04:21  HappyCactus    Assigned To               => buildroot       
======================================================================
