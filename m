From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:04 -0800
Subject: [Buildroot] [buildroot 0000637]: Buildroot doesn't build grub or
	syslinux for i386 targets
Message-ID: <d1e05f55fb26451f817870ed6e87e83b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=637 
====================================================================== 
Reported By:                carpie
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   637
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-10-2006 20:36 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Buildroot doesn't build grub or syslinux for i386
targets
Description: 
Selecting grub and/or syslinux in Target Options has no effect.  These
targets are not included and nothing gets built.

====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:15  
---------------------------------------------------------------------- 
adding the include with such wild cards seems a little risky. instead,
keeping with the current tree style, i've add Makefile.in files so that
they are read properly. fixed as of 13456 

---------------------------------------------------------------------- 
 carpie - 01-28-06 10:25  
---------------------------------------------------------------------- 
Thanks for adding the Makefile.in.  This works as far as getting grub and
syslinux to be included for building.  However, I still think that the
'ifeq( $(ARCH), i386)'s in grub.mk and syslinux.mk should be changed to:
'ifeq ($(strip $(BR2_i386)),y)'s.  Currently, grub will only be made if
the target is i386 and the target variant is i386.  My toolchain, for
example, is an i586 variant and, because of the ifeq ARCH lines, will not
build grub or syslinux.  With the change, all i386 variants should be able
to build grub and syslinux. 

---------------------------------------------------------------------- 
 donr - 08-20-06 20:22  
---------------------------------------------------------------------- 
Yes, this change is needed.  I am compiling for a Via EPIA board,
BR2_i386=y, BR2_x86_i486=y, BR2_ARCH="i486". 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 02:02  
---------------------------------------------------------------------- 
Grub was fixed in r16554
syslinux was fixed in r16702 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-10-06 20:36  carpie         New Issue                                    
01-10-06 20:36  carpie         Status                   new => assigned     
01-10-06 20:36  carpie         Assigned To               => uClibc          
01-10-06 20:36  carpie         File Added: grub_syslinux.patch                  
 
01-10-06 20:37  carpie         Issue Monitored: carpie                      
01-20-06 12:15  prpplague      Note Added: 0000960                          
01-20-06 12:15  prpplague      Status                   assigned => resolved
01-20-06 12:15  prpplague      Resolution               open => fixed       
01-28-06 10:25  carpie         Status                   resolved => feedback
01-28-06 10:25  carpie         Resolution               fixed => reopened   
01-28-06 10:25  carpie         Note Added: 0001017                          
02-07-06 14:27  janlana        Issue Monitored: janlana                     
02-16-06 02:07  janlana        Issue End Monitor: janlana                    
03-21-06 21:06  ylopez         Issue Monitored: ylopez                      
06-29-06 21:00  ylopez         Issue End Monitor: ylopez                    
08-20-06 20:22  donr           Note Added: 0001575                          
08-20-06 20:23  donr           Issue Monitored: donr                        
11-28-06 02:02  bernhardf      Status                   feedback => closed  
11-28-06 02:02  bernhardf      Note Added: 0001822                          
11-28-06 02:02  bernhardf      Resolution               reopened => fixed   
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
