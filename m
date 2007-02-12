From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:06 -0800
Subject: [Buildroot] [buildroot 0000823]: DirectFB: still wrong lib path
Message-ID: <7c42f78cdab051e2b68f4f133556c402@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=823 
====================================================================== 
Reported By:                frankro
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   823
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-10-2006 03:49 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    DirectFB: still wrong lib path
Description: 
Bug 0000800 addresses the hardcoded library path in directfb.
make install prefix=$(STAGING_DIR)/usr exec_prefix=$(STAGING_DIR)
was added. It seems like DFB is not using this correctly.
if I do a
strings
/home/frank/src/buildroot/build_i586/staging_dir/usr/lib/libdirectfb-0.9.so
I still find the /usr/lib hardcoded. 
This more likely a problem of DFB?

Result is that MPlayer compilation against DFB fails because the linker
can't find the libs:

/home/frank/src/buildroot/build_i586/staging_dir/bin-ccache/../lib/gcc/i586-linux-uclibc/3.4.2/../../../../i586-linux-uclibc/bin/ld:
warning: libdirect-0.9.so.24, needed by
/home/frank/src/buildroot/build_i586/staging_dir/usr/lib/libdirectfb.so,
not found (try using -rpath or -rpath-link)



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-10-06 03:49  frankro        New Issue                                    
04-10-06 03:49  frankro        Status                   new => assigned     
04-10-06 03:49  frankro        Assigned To               => uClibc          
04-10-06 04:06  frankro        Issue Monitored: frankro                     
04-11-06 20:02  match          Issue Monitored: match                       
10-09-06 12:25  jruere         Issue Monitored: jruere                      
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
