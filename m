From: <bogus@does.not.exist.com>
Date: Tue, 06 Feb 2007 07:08:39 -0000
Subject: No subject
Message-ID: <mailman.1.1171287961.4267.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the build_i386/staging_dir. It seems to be creating a full usr/include,
usr/lib, etc directory hierarchy under inside build_i386/staging_dir,
rather than integrating with the include/lib/etc dirs that exist at the
staging_dir level (ie. the installation of gettext files occurs at one
level too deep)

This means that libintl.h and the shared libraries aren't where other apps
expect it and compilation errors can occur.

The attached patch fixes this - hope it's ok.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 05-24-06 07:49  
---------------------------------------------------------------------- 
fixed as of revision 15160 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-29-05 07:56  crafterm       New Issue                                    
11-29-05 07:56  crafterm       Status                   new => assigned     
11-29-05 07:56  crafterm       Assigned To               => uClibc          
11-29-05 07:56  crafterm       File Added: gettext-stagingfix.patch             
      
05-24-06 07:49  prpplague      Note Added: 0001377                          
05-24-06 07:49  prpplague      Status                   assigned => closed  
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
