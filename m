From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 13:41:24 -0800
Subject: [Buildroot] [buildroot 0001571]: AVR32 patch in libmad causes
	unnecessary config.status --recheck
Message-ID: <73ad7825524f99d07f6b99bd97cfe3af@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1571 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1571
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-04-2007 03:13 PST
Last Modified:              11-27-2007 13:41 PST
====================================================================== 
Summary:                    AVR32 patch in libmad causes unnecessary
config.status --recheck
Description: 
Since the libmad-0.15.1b-avr32-optimization.patch modifies both
'configure.ac' and 'configure', a timing issue will often occur.

Within every standard Makefile, there's a rule which causes a rebuild of
the configure file (by means of running autoconf) when 'configure.ac' is
newer than 'configure'.

Within libmad-0.15.1b-avr32-optimization.patch, configure.ac is patched
AFTER configure, and so, the 'configure.ac' may end up being newer. Worse
yet, this happens "randomly": if both files are patches in the same
second, the problem isn't visible.

The attached patch reorders configure.ac to appear BEFORE configure within
libmad-0.15.1b-avr32-optimization.patch.
====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 11-27-07 13:41  
---------------------------------------------------------------------- 
FIxed in  revision 20553 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-07 03:13  ikonst         New Issue                                    
11-04-07 03:13  ikonst         Status                   new => assigned     
11-04-07 03:13  ikonst         Assigned To               => buildroot       
11-04-07 03:13  ikonst         File Added:
libmad-avr32-optimization-reorder.patch                    
11-27-07 13:41  UlfSamuelsson  Status                   assigned => closed  
11-27-07 13:41  UlfSamuelsson  Note Added: 0002978                          
======================================================================
