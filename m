From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:29 -0800
Subject: [Buildroot] [buildroot 0000703]: MIPS *.h requires
	include/linux/autoconf.h
Message-ID: <d97ec26dc7e10ed3981172dd480832b6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=703 
====================================================================== 
Reported By:                alec_v
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   703
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-08-2006 08:54 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    MIPS *.h requires include/linux/autoconf.h
Description: 
Some *.h files for the MIPS architecture requres *real* working
include/linux/autoconf.h file.

For example <asm/mipsregs.h> requires 

#define CONFIG_PAGE_SIZE_4KB 1

which usually defined in the "autoconf.h" by the linux kernel
configurator.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:31  
---------------------------------------------------------------------- 
Fixed by using linux-2.6.19.1 and later. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-08-06 08:54  alec_v         New Issue                                    
02-08-06 08:54  alec_v         Status                   new => assigned     
02-08-06 08:54  alec_v         Assigned To               => uClibc          
02-08-06 08:55  alec_v         File Added: autoconf.h                       
12-22-06 04:31  bernhardf      Status                   assigned => closed  
12-22-06 04:31  bernhardf      Note Added: 0001915                          
12-22-06 04:31  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
