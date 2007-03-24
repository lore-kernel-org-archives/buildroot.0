From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 24 Mar 2007 12:57:09 -0700
Subject: [Buildroot] [buildroot 0001287]: posix_memalign() declared but not
	implemented
Message-ID: <c252918fb0930b5ef0f0253ac098985f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been set as DUPLICATE OF issue 0001275. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1287 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1287
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-24-2007 12:15 PDT
Last Modified:              03-24-2007 12:57 PDT
====================================================================== 
Summary:                    posix_memalign() declared but not implemented
Description: 
Hello,
For a reason totally ununderstandable for me, 'Vapier' made a correction
19 months ago to uClibc and this correction is not present in latest
uClibc release (0.9.28.3) Why such a delay.....

The facts:
posix_memalign() function is declared in header file (stdlib.h)
posix_memalign() is implemented nowhere

=>compilations run smoothly
=>linking final application sucks (of course)
For example try 'parted version 1.8.2'

Either the function is present or not. But half done job is idiot.
Provided patch to drop in "buildroot/toolchain/uClibc"
to implement the function in next snapshot.

Thank you for read (and fixing).

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0001275 posix_memalign missing
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 03-24-07 12:31  
---------------------------------------------------------------------- 
So.. why do you file this against buildroot and not properly against
uClibc? 

---------------------------------------------------------------------- 
 Franck78 - 03-24-07 12:48  
---------------------------------------------------------------------- 
I did !
http://busybox.net/bugs/view.php?id=1275

If a correction is not released after 19 months, it will never be, no ? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-24-07 12:15  Franck78       New Issue                                    
03-24-07 12:15  Franck78       Status                   new => assigned     
03-24-07 12:15  Franck78       Assigned To               => buildroot       
03-24-07 12:15  Franck78       File Added: uClibc-0.9.28.3-posix_memalign.patch 
                  
03-24-07 12:17  Franck78       Issue Monitored: Franck78                    
03-24-07 12:31  bernhardf      Note Added: 0002276                          
03-24-07 12:48  Franck78       Note Added: 0002277                          
03-24-07 12:57  bernhardf      Relationship added       duplicate of 0001275
======================================================================
