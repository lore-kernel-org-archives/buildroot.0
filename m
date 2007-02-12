From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:40 -0800
Subject: [Buildroot] [buildroot 0000426]: grub and syslinux are not properly
	integrated into build process
Message-ID: <0715a05b172024623413fd4750396463@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=426 
====================================================================== 
Reported By:                sho
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   426
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-12-2005 02:00 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    grub and syslinux are not properly integrated into
build process
Description: 
It is possible to select grub and syslinux during "make menuconfig", but
both packages are not compiled, because the line

  include */*/*.mk

is missing inside the main Makefile (grub.mk resides in target/x86/grub
which is nested one level too deep for the default configuration).

Besides, grub is cross-compiled, but the binaries are not copied into the
target filesystem (at least grub, stage1, stage2 are needed) . I am not
sure if it is better to do this or to compile grub for the host system
instead.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:16  
---------------------------------------------------------------------- 
adding the include with such wild cards seems a little risky. instead,
keeping with the current tree style, i've add Makefile.in files so that
they are read properly. fixed as of 13456 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-12-05 02:00  sho            New Issue                                    
09-12-05 02:00  sho            Status                   new => assigned     
09-12-05 02:00  sho            Assigned To               => uClibc          
09-19-05 12:51  mhe            Issue Monitored: mhe                         
01-20-06 12:16  prpplague      Note Added: 0000961                          
01-20-06 12:16  prpplague      Status                   assigned => resolved
01-20-06 12:16  prpplague      Resolution               open => fixed       
03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
