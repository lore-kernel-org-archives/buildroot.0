From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 30 Jul 2007 00:41:11 -0700
Subject: [Buildroot] [buildroot 0001448]: buildroot cannot build gcc due to
	wrong option passed to 'exec'
Message-ID: <b49f0ccc45e542ae38cd40c26b19885e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1448 
====================================================================== 
Reported By:                pavko
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1448
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-28-2007 05:22 PDT
Last Modified:              07-30-2007 00:41 PDT
====================================================================== 
Summary:                    buildroot cannot build gcc due to wrong option
passed to 'exec'
Description: 
probably key point is:
buildroot_svn/toolchain_build_i686/gcc-4.2.1-initial/./gcc/as: line 2:
exec: -Q: invalid option

tried with gcc-4.2.0 with the same result.
====================================================================== 

---------------------------------------------------------------------- 
 pavko - 07-29-07 14:03  
---------------------------------------------------------------------- 
It seems that file:
/home/pavko/buildroot_svn/toolchain_build_i686/gcc-4.2.1-initial/gcc/as
during initial stage is incorrectly initialized to:

#!/bin/bash                                                               
                                                                           
    
exec "$@" 

After manual change to:

#!/bin/bash                                                               
                                                                           
    
exec
/home/pavko/buildroot_svn/build_i686/staging_dir/usr/i686-linux-uclibc/bin/as
"$@"

compilation was successful 

---------------------------------------------------------------------- 
 bernhardf - 07-30-07 00:41  
---------------------------------------------------------------------- 
This indicates that the build went wrong. This file will be generated
properly if the build was fine so far. wipe your object-tree and rebuild. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-28-07 05:22  pavko          New Issue                                    
07-28-07 05:22  pavko          Status                   new => assigned     
07-28-07 05:22  pavko          Assigned To               => buildroot       
07-29-07 14:03  pavko          Note Added: 0002644                          
07-30-07 00:41  bernhardf      Status                   assigned => closed  
07-30-07 00:41  bernhardf      Note Added: 0002645                          
======================================================================
