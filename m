From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:41 -0800
Subject: [Buildroot] [buildroot 0000861]: buildroot jail unable to compile
	busybox --- "missing" output directory
Message-ID: <2324ed8ee1b5c1c72818515600cdf9d6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=861 
====================================================================== 
Reported By:                zugvogel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   861
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-01-2006 19:33 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    buildroot jail unable to compile busybox ---
"missing" output directory
Description: 
Background: I am attempting to use buildroot as a root jail for making
components to be linked against uClibc. For the jail, I am using an
unwrapped copy of the ext2 target file system as produced by buildroot.

Symptom: I am attempting to rebuild busybox inside the jail with my own
setting. Unfortunately, "make menuconfig" (or just "make" with a planted
.config) fails with the following ominous error:

/tmp/busybox $ make
Makefile:72: *** output directory "/tmp/busybox" does not exist.  Stop.

The listed output directory does exist (relative to chroot) as I am
currently in it. Disabling the check in the makefile results in a segfault
instead--- so
I would guess that the "missing" output directory is just a symptom of
something more sinister going on.


====================================================================== 

---------------------------------------------------------------------- 
 zugvogel - 05-04-06 18:34  
---------------------------------------------------------------------- 
Tried the same trick on a plain vanilla Debian 3.1r1. Same result (i.e. I
get a toolchain that does not compile busybox). 

Will now try to reproduce the toolchain using the busybox/uClibc snapshots
that were used for the "preassembled" i386 toolchain (basically, a sanity
check). Will update once I have some results.

Frank 

---------------------------------------------------------------------- 
 bernhardf - 12-21-06 04:05  
---------------------------------------------------------------------- 
Any update on this?
busybox now has approached 1.3.0 and buildroot recently received quite
some changes, so please retest. 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:04  
---------------------------------------------------------------------- 
Assumed to be fixed with current setups. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-01-06 19:33  zugvogel       New Issue                                    
05-01-06 19:33  zugvogel       Status                   new => assigned     
05-01-06 19:33  zugvogel       Assigned To               => uClibc          
05-04-06 18:34  zugvogel       Note Added: 0001344                          
12-21-06 04:05  bernhardf      Note Added: 0001903                          
12-21-06 04:05  bernhardf      Status                   assigned => feedback
02-04-07 09:04  bernhardf      Status                   feedback => closed  
02-04-07 09:04  bernhardf      Note Added: 0002103                          
02-04-07 09:05  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
