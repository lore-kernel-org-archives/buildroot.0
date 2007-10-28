From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 28 Oct 2007 14:34:38 -0700
Subject: [Buildroot] [buildroot 0001559]: mplayer uses llrint which is
	unavailable on uClibc
Message-ID: <5869689a0d6712f75a9caa50e23e1532@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1559 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1559
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2007 11:49 PDT
Last Modified:              10-28-2007 14:34 PDT
====================================================================== 
Summary:                    mplayer uses llrint which is unavailable on uClibc
Description: 
The mplayer-1.0rc1-atmel.3.patch already solves this issue, but does so
only for AVR32 targets (for no good reason, since the patch itself admits
it's a uClibc issue).

The attached patch changes this portion of the Atmel patch to apply for
all uClibc cases.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-28-07 14:34  
---------------------------------------------------------------------- 
"mplayer uses llrint which is unavailable on uClibc"

What make you think so? I have it defined in libm-0.9.29.so 
and Mplayer build OK for arm target, which is not AVR32 one.

regards,
Ivan 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 11:49  ikonst         New Issue                                    
10-28-07 11:49  ikonst         Status                   new => assigned     
10-28-07 11:49  ikonst         Assigned To               => buildroot       
10-28-07 11:49  ikonst         File Added: mplayer-llrint-not-only-atmel.patch  
                 
10-28-07 14:34  vanokuten      Note Added: 0002865                          
======================================================================
