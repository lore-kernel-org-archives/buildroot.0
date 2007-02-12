From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:18 -0800
Subject: [Buildroot] [buildroot 0001028]: x86 binaries are built when
	buildroot configured for powerpc arch
Message-ID: <63f39b5147c3f2060e51d9ad34152b3f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1028 
====================================================================== 
Reported By:                jacques
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1028
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-14-2006 09:58 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    x86 binaries are built when buildroot configured for
powerpc arch
Description: 
make -j1
CROSS=/home/packages/buildroot/buildroot-20060913/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-
GCC=/home/packages/buildroot/buildroot-20060913/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc
\
        USE_LOG=false USE_SELINUX=false \
        udevdir=/dev -C
/home/packages/buildroot/buildroot-20060913/build_powerpc/udev-094
make[1]: Entering directory
`/home/packages/buildroot/buildroot-20060913/build_powerpc/udev-094'

...

file udevtest udevstart udevmonitor udevinfo udevcontrol udev
udevtest:    ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped
udevstart:   ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped
udevmonitor: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped
udevinfo:    ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped
udevcontrol: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped
udev:        ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), for
GNU/Linux 2.4.1, dynamically linked (uses shared libs), for GNU/Linux
2.4.1, not stripped


====================================================================== 

---------------------------------------------------------------------- 
 jacques - 09-14-06 10:06  
---------------------------------------------------------------------- 
this is easily fixed by changing 'CROSS=' to 'CROSS_COMPILE=' in udev.mk 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 15:40  
---------------------------------------------------------------------- 
Can you please send a patch to the buildoor mailing list that
- updates to a current udev
- adds CROSS vs. CROSS_COMPILE to udev.mak as appropriate for the new
version

thanks in advance, 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 01:19  
---------------------------------------------------------------------- 
ping. See comment above.
TIA, 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 08:24  
---------------------------------------------------------------------- 
Fixed in svn. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-14-06 09:58  jacques        New Issue                                    
09-14-06 09:58  jacques        Status                   new => assigned     
09-14-06 09:58  jacques        Assigned To               => uClibc          
09-14-06 10:06  jacques        Note Added: 0001635                          
11-22-06 15:40  bernhardf      Note Added: 0001787                          
12-22-06 01:19  bernhardf      Note Added: 0001907                          
12-22-06 01:19  bernhardf      Status                   assigned => feedback
01-19-07 08:24  bernhardf      Status                   feedback => closed  
01-19-07 08:24  bernhardf      Note Added: 0001999                          
01-19-07 08:24  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
