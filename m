From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:44 -0800
Subject: [Buildroot] [buildroot 0000512]: Make cramfs bootable at least
	sometimes
Message-ID: <9c58b16ce937b2a905785b638aae75b5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=512 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   512
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:29 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Make cramfs bootable at least sometimes
Description: 
This configure option includes the linux kernel in the cramfs image, at a
set spot (sector 2), so that normal bootloaders can use it.  Otherwise
grub and lilo don't work with cramfs because of it's readonly nature.

This adds an assembly bootloader to cramfs which doesn't work all that
well.  But I think it's worth including since somebody may have time to
fix it.  And it's a better longterm solution since it's akward to require
people to force their normal bootloader to boot from sector 2.  This comes
from the midori project.
====================================================================== 

---------------------------------------------------------------------- 
 akvadrako - 01-27-06 16:23  
---------------------------------------------------------------------- 
This updated patch does a few things:
(1) stripping is now down on temporary copies so it doesn't effect the
TARGET_DIR
(2) included a standard workaround for vim syntax highlighting bug 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:49  
---------------------------------------------------------------------- 
Are these patches still required with current trunk?
If so, please rediff against current trunk.

Thanks alot in advance and cheers, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:29  akvadrako      New Issue                                    
10-28-05 09:29  akvadrako      Status                   new => assigned     
10-28-05 09:29  akvadrako      Assigned To               => uClibc          
10-28-05 09:29  akvadrako      File Added: br-cramfsboot.patch                  
 
01-27-06 16:21  akvadrako      File Added: br-cramfsboot-v2.patch               
    
01-27-06 16:23  akvadrako      Note Added: 0001015                          
01-21-07 06:49  bernhardf      Note Added: 0002020                          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
