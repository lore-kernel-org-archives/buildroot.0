From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 31 Jul 2008 05:39:22 -0700
Subject: [Buildroot] [buildroot 0004394]: kernel 2.6.26 uImage or zImage
	fails, looking in wrong directory
Message-ID: <915855751c76f0f58a3c785d4d01c82d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4394 
====================================================================== 
Reported By:                kreuters
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4394
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-31-2008 05:39 PDT
Last Modified:              07-31-2008 05:39 PDT
====================================================================== 
Summary:                    kernel 2.6.26 uImage or zImage fails, looking in
wrong directory
Description: 
if i try and build a kernel uImage or zImage, the kernel builds then i get
the following error:

 Image arch/arm/boot/uImage is ready
make[1]: Leaving directory
`/home/dikkie/Documents/dns323/uclibc/buildroot/project_build_arm/dns323/linux-2.6.26'
cp -pf
/home/dikkie/Documents/dns323/uclibc/buildroot/project_build_arm/dns323/linux-2.6.26/uImage
/home/dikkie/Documents/dns323/uclibc/buildroot/binaries/dns323/orion5x-linux-2.6.26-20080731.gz
cp: cannot stat
`/home/dikkie/Documents/dns323/uclibc/buildroot/project_build_arm/dns323/linux-2.6.26/uImage':
No such file or directory


presumably it should be looking in arch/arm/boot/ 

i have modified the arch/arm/boot/Makefile to copy the images to the
$(srctree) folder, fixs the problem
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-31-08 05:39  kreuters       New Issue                                    
07-31-08 05:39  kreuters       Status                   new => assigned     
07-31-08 05:39  kreuters       Assigned To               => buildroot       
======================================================================
