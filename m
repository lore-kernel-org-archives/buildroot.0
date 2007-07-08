From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 12:17:09 -0700
Subject: [Buildroot] [buildroot 0001406]: ARM: gcc is not configured for the
	ARM cpu selected in the menuconfig
Message-ID: <437516fd0af3b0eb201ade652bf7f771@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1406 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1406
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             06-28-2007 04:04 PDT
Last Modified:              07-08-2007 12:17 PDT
====================================================================== 
Summary:                    ARM: gcc is not configured for the ARM cpu selected
in the menuconfig
Description: 
The CPU selected in the menuconfig is not used to configure the gcc build
to use the configured CPU. This causes code to be built that will not run
on the target due to instructions that can never be executed.

If the cpu type is not specified, then not only is the compiler producing
builds of packages that are incorrect, but it will also produce an libgcc
with invalid instructions in it.

Passing CFLAGS with -mcpu=<configured-cpu> to the package builds was
considered as a posibility, but this will not ensure that libgcc is built
with the correct architecture flags.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-28-07 04:04  bjdooks        New Issue                                    
06-28-07 04:04  bjdooks        Status                   new => assigned     
06-28-07 04:04  bjdooks        Assigned To               => buildroot       
06-28-07 04:04  bjdooks        File Added: gcc-pass-cpu-config.patch            
       
07-08-07 12:17  bernhardf      Status                   assigned => closed  
======================================================================
