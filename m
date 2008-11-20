From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 20 Nov 2008 04:32:44 -0800
Subject: [Buildroot] [buildroot 0006324]: xlib_libX11 does not compile any
	more
Message-ID: <0bfb0cfe56a5b14f08240dfda41ebeb2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6324 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6324
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-14-2008 21:58 PST
Last Modified:              11-20-2008 04:32 PST
====================================================================== 
Summary:                    xlib_libX11 does not compile any more
Description: 
/usr/bin/ld: this linker was not configured to use sysroots


====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-14-08 22:02  
---------------------------------------------------------------------- 
i586-linux-uclibc-gcc:
/home/roberto/gles/buildroot/build_i586/staging_dir/lib: linker input file
unused because linking not done
i586-linux-uclibc-gcc: --rpath-link: linker input file unused because
linking not done
i586-linux-uclibc-gcc:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib: linker input
file unused because linking not done 

---------------------------------------------------------------------- 
 robang74 - 11-14-08 22:16  
---------------------------------------------------------------------- 
This would solve the problem:

svn up -r 23999 package/Makefile.in
rm -rf build_i586/xlib_libX11-1.1.3 

---------------------------------------------------------------------- 
 robang74 - 11-20-08 04:32  
---------------------------------------------------------------------- 
I see Makefile revision is 23956 in buildroot revision 24103.
If this file has been reverted back this bug report could be closed.
Otherwise the main reason would be different from what supposed.

roberto at rafbook:~/gles/buildroot$ svn info Makefile
Path: Makefile
Name: Makefile
URL: svn://uclibc.org/trunk/buildroot/Makefile
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 24103
Node Kind: file
Schedule: normal
Last Changed Author: jacmet
Last Changed Rev: 23956
Last Changed Date: 2008-11-07 09:57:59 +0100 (Fri, 07 Nov 2008)
Text Last Updated: 2008-11-12 19:10:21 +0100 (Wed, 12 Nov 2008)
Checksum: 2903ce22af9a0f4589162522c896ea89 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-14-08 21:58  robang74       New Issue                                    
11-14-08 21:58  robang74       Status                   new => assigned     
11-14-08 21:58  robang74       Assigned To               => buildroot       
11-14-08 21:58  robang74       File Added: .config                          
11-14-08 22:02  robang74       Note Added: 0015864                          
11-14-08 22:16  robang74       Note Added: 0015874                          
11-20-08 04:32  robang74       Note Added: 0016014                          
======================================================================
