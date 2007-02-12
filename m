From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:16 -0800
Subject: [Buildroot] [buildroot 0000129]: Make menuconfig toolchain option
	"Additional gcc options" passed into wrong build phase
Message-ID: <70b1c9863cc2ab433ff746eb819a1aa7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=129 
====================================================================== 
Reported By:                rlc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   129
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-02-2005 22:55 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Make menuconfig toolchain option "Additional gcc
options" passed into wrong build phase
Description: 
My embedded linux target requires the -mcpu=860 option to be passed into
the compilation phase of the GCC cross-compiler (if I don't, nothing
compiled with gcc will work!  It attempts to use non-existent
floating-point registers).  I put this option into the "Additional gcc
options" section of make menuconfig, but it attempted to use this as a
configure script option instead.  Here's the output:

configure: error: -mcpu=860: invalid option; use --help to show usage
make: ***
[/home/powerpc-linux/host/build/working/buildroot/toolchain_build_powerpc_nofpu/gcc-3.4.2-initial/.configured]
Error 1

If this is the intended use for this toolchain option, please tell me how
I can build gcc with the -mcpu=860 option.

====================================================================== 

---------------------------------------------------------------------- 
 rlc - 03-02-05 23:05  
---------------------------------------------------------------------- 
I found the correct configure option:
--with-cpu=860

I believe this causes the cross-compiler version of gcc to assume
-mcpu=860

I was confused about where this option would be used, perhaps a more
descriptive name or help information could be added?
Please reduce the severity to trivial, my mistake. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-05 22:55  rlc            New Issue                                    
03-02-05 23:05  rlc            Note Added: 0000071                          
03-16-05 12:12  andersen       Status                   new => assigned     
03-16-05 12:12  andersen       Assigned To               => uClibc          
01-23-06 07:18  prpplague      Status                   assigned => closed  
01-23-06 07:18  prpplague      Resolution               open => no change
required
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
