From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Oct 2008 03:15:44 -0700
Subject: [Buildroot] [buildroot 0005364]: fontconfig compilations sometimes
	failed with parallel build
Message-ID: <f477cc67784e353d06464f93bd17cba7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5364 
====================================================================== 
Reported By:                tpetazzoni
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5364
Category:                   Other
Reproducibility:            sometimes
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-13-2008 03:15 PDT
Last Modified:              10-13-2008 03:15 PDT
====================================================================== 
Summary:                    fontconfig compilations sometimes failed with
parallel build
Description: 
fontconfig is affected by a compile bug that only occurs from time to time
when parallel compilation is enabled. The bug is described at
https://bugs.freedesktop.org/show_bug.cgi?id=16464.

The attached patch includes the fix for fontconfig in buildroot. However,
it modifies a Makefile.am file, so running automake is needed, but I'm not
sure Buildroot will do that automatically (as the bug only occurs
sometimes, it's quite hard to test whether the fix properly works or
not).

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-13-08 03:15  tpetazzoni     New Issue                                    
10-13-08 03:15  tpetazzoni     Status                   new => assigned     
10-13-08 03:15  tpetazzoni     Assigned To               => buildroot       
10-13-08 03:15  tpetazzoni     File Added: parallel-compilation-fix.patch       
            
======================================================================
