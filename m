From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:58 -0800
Subject: [Buildroot] [buildroot 0000821]: Fails at rootfs creation
Message-ID: <7719cc14d755a7746f8e2de8119c4945@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=821 
====================================================================== 
Reported By:                roboman152
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   821
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-09-2006 10:08 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Fails at rootfs creation
Description: 
Im a newbie, I downloaded latest with SVN, did a menuconfig, only
configured for ARM920 core, software FPU, changed nothing else. It looks
like everything builds ok (as far as I can tell) but its failing when it
tries to actually make the file system with the following:

zcat /home/roboman/Downloads/buildroot/dl/ | tar -C
/home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu   -xf -
mv /home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu/
/home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu/mtd_orig
tar: /home/roboman/Downloads/buildroot/dl/: Cannot read: Is a directory
tar: At beginning of tape, quitting now
tar: Error is not recoverable: exiting now

gzip: stdin: unexpected end of file
tar: Child returned status 2
tar: Error exit delayed from previous errors
basename: too few arguments
Try `basename --help' for more information.
zcat: /home/roboman/Downloads/buildroot/dl/ is a directory -- ignored
mv: cannot move
`/home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu/' to a
subdirectory of itself,
`/home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu/mtd_orig'
make: ***
[/home/roboman/Downloads/buildroot/toolchain_build_arm_nofpu/mtd_orig/.unpacked]
Error 1

====================================================================== 

---------------------------------------------------------------------- 
 blurgk - 04-09-06 10:15  
---------------------------------------------------------------------- 
This is a problem with the MTD package, see there with the solution:
http://bugs.uclibc.org/view.php?id=777 

---------------------------------------------------------------------- 
 andersen - 04-10-06 16:42  
---------------------------------------------------------------------- 
same as bug 0000786, and 0000777 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-09-06 10:08  roboman152     New Issue                                    
04-09-06 10:08  roboman152     Status                   new => assigned     
04-09-06 10:08  roboman152     Assigned To               => uClibc          
04-09-06 10:15  blurgk         Note Added: 0001240                          
04-10-06 16:42  andersen       Note Added: 0001248                          
04-10-06 16:42  andersen       Status                   assigned => closed  
04-10-06 16:42  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
