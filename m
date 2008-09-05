From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 5 Sep 2008 10:08:27 -0700
Subject: [Buildroot] [buildroot 0004824]: at91sam9263ek build fails due to
	CFG_DEBUG being undefined
Message-ID: <ab9971a465c3ee5c4ad849512cb174a8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4824 
====================================================================== 
Reported By:                john_schimandle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4824
Category:                   Architecture Specific
Reproducibility:            sometimes
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-05-2008 10:08 PDT
Last Modified:              09-05-2008 10:08 PDT
====================================================================== 
Summary:                    at91sam9263ek build fails due to CFG_DEBUG being
undefined
Description: 
project_build_arm/at91sam9263ek/at91bootstrap-2.3/board/at91sam9263ek/dataflash/at91sam9263ek.h

has the statement

#undef CFG_DEBUG

This statement causes the compile of
project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/dataflash.c to
fail because the debug functions
in project_build_arm/at91sam9263ek/at91bootstrap-2.3/driver/debug.c were
not compiled.

To fix the defect just change the offending line to

#define CFG_DEBUG

You could also make a more extensive fix that would actually make the
debugging optional but that would required surrounding all calls to debug
functions in all .c files with #ifdef CFG_DEBUG. This is more work and I
don't know if this is necessary because this is the bootstrap loader.

Only reproduceable if you are building for the at91sam9263ek because this
is the only .h file that has a undef for CFG_DEBUG. All other device
include files have the define instead.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-05-08 10:08  john_schimandleNew Issue                                    
09-05-08 10:08  john_schimandleStatus                   new => assigned     
09-05-08 10:08  john_schimandleAssigned To               => buildroot       
09-05-08 10:08  john_schimandleFile Added: at91sam9263ek.h                    
======================================================================
