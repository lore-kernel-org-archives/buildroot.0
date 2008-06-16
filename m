From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 16 Jun 2008 08:09:10 -0700
Subject: [Buildroot] [buildroot 0003714]: oprofile doesn't build because bfd
	library not found
Message-ID: <d2b41eed1e9dee05bcabb6e0e618f106@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3714 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3714
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-13-2008 02:23 PDT
Last Modified:              06-16-2008 08:09 PDT
====================================================================== 
Summary:                    oprofile doesn't build because bfd library not found
Description: 
checking for bfd_openr in -lbfd... no
configure: error: bfd library not found

binutils is needed to build oprofile.
I used gcc4.2.1 toolchain.
====================================================================== 

---------------------------------------------------------------------- 
 fabo - 06-16-08 08:09  
---------------------------------------------------------------------- 
please, find attached a patch to fix oprofile package:
- depend on BR2_PACKAGE_GCC_TARGET, we need binutils on target to build
oprofile. (see failure on the bug report)
- add OPROFILE_LIBS and OPROFILE_INCS to pass extra includes and libs to
configure.
- add --with-kernel-support configure option to use 2.6 kernel (no kernel
source tree required) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-13-08 02:23  fabo           New Issue                                    
06-13-08 02:23  fabo           Status                   new => assigned     
06-13-08 02:23  fabo           Assigned To               => buildroot       
06-16-08 08:01  fabo           File Added: fix_oprofile_0003714.diff            
       
06-16-08 08:09  fabo           Note Added: 0008324                          
======================================================================
