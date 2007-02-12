From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:42 -0800
Subject: [Buildroot] [buildroot 0001099]: make crashes on cpio right after
	make menuconfig
Message-ID: <50a70b31607a37afbfa0b29d5485e915@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1099 
====================================================================== 
Reported By:                znmeb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1099
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-22-2006 11:54 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    make crashes on cpio right after make menuconfig
Description: 
I downloaded buildroot from SVN, did a make menuconfig and then a make. In
the menuconfig, I just selected the defaults. Right after that, it
crashes:

make menuconfig
#
# using defaults found in .config
#


*** End of Buildroot configuration.
*** Check the top-level Makefile for additional configuration options.

make
target/cpio/cpioroot.mk:10: *** missing separator.  Stop.

The problem is that "make" is rather anal about lines beginning with
spaces as opposed to tabs -- it wants tabs. By a stroke of luck, my Gentoo
vim syntax coloring flags those, so it was easy to clean up cpioroot.mk.
The cleaned up version is attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 13:14  
---------------------------------------------------------------------- 
This was already fixed and caused by a malformed patch sent by Goetz Bock. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-22-06 11:54  znmeb          New Issue                                    
11-22-06 11:54  znmeb          Status                   new => assigned     
11-22-06 11:54  znmeb          Assigned To               => uClibc          
11-22-06 11:54  znmeb          File Added: cpioroot.mk                      
11-22-06 11:54  znmeb          Issue Monitored: znmeb                       
11-22-06 13:14  bernhardf      Status                   assigned => closed  
11-22-06 13:14  bernhardf      Note Added: 0001769                          
11-22-06 13:14  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
