From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:42 -0800
Subject: [Buildroot] [buildroot 0000597]: [patch] "native toolchain in the
	target filesystem" option broken
Message-ID: <6563e25dfe79c0d96f25113062272378@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=597 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   597
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2005 02:57 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    [patch] "native toolchain in the target filesystem"
option broken
Description: 
Hi Guys,

toolchain/binutils.mk and toolchain/gcc/gcc-uclibc-3.x.mk don't specify
$(TARGET_CONFIGURE_OPTS) for the gcc/binutils -target goals. This results
in gcc/ld/readelf/etc all being built for the target system using the host
C compiler, and hence being linked to the host C library (eg. GNU libc)
which causes them to fail when used.

The attached patch fixes this.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-16-05 17:35  
---------------------------------------------------------------------- 
no, gcc and binutils are smart enough to use the correct compilers 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-05 02:57  crafterm       New Issue                                    
12-12-05 02:57  crafterm       Status                   new => assigned     
12-12-05 02:57  crafterm       Assigned To               => uClibc          
12-12-05 02:57  crafterm       File Added: toolchain.diff                    
12-16-05 17:35  vapier         Note Added: 0000793                          
12-16-05 17:35  vapier         Status                   assigned => closed  
12-16-05 17:35  vapier         Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
