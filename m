From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 5 Oct 2007 04:11:57 -0700
Subject: [Buildroot] [buildroot 0001522]: ARM11 VFP (Vector Floating Point
	coprocessor) support
Message-ID: <4499ab6ab39793004a90248ac796d81d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1522 
====================================================================== 
Reported By:                tklas
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1522
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-05-2007 04:11 PDT
Last Modified:              10-05-2007 04:11 PDT
====================================================================== 
Summary:                    ARM11 VFP (Vector Floating Point coprocessor)
support
Description: 
GCC 4.2.1 (and others versions) VFP support is broken. It can be enabled by
this:

BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-float=softfp --with-fpu=vfp"

After this, compiling fails due to "missing" -lfloat library. But there is
no float library needed. Attached patch solves this problem. (Save as
buildroot/toolchain/gcc/4.2.1/999_gcc-4.2.1_linux-elf-softfp.patch.)

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-05-07 04:11  tklas          New Issue                                    
10-05-07 04:11  tklas          Status                   new => assigned     
10-05-07 04:11  tklas          Assigned To               => buildroot       
10-05-07 04:11  tklas          File Added: 999_gcc-4.2.1_linux-elf-softfp.patch 
                  
======================================================================
