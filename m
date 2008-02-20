From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 20 Feb 2008 12:11:45 -0800
Subject: [Buildroot] [buildroot 0002274]: [PATCH] elf2flt produces bad
	relocation information with certain input
Message-ID: <a1fc02dc553e0bd63f05980af4022cc7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2274 
====================================================================== 
Reported By:                stigpo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2274
Category:                   Other
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-20-2008 12:11 PST
Last Modified:              02-20-2008 12:11 PST
====================================================================== 
Summary:                    [PATCH] elf2flt produces bad relocation information
with certain input
Description: 
elf2flt will produce wrong results if there are multiple local symbols with
the same name in the symbol table. This was discovered when compiling and
linking busybox 1.9.1 with an generic ARM toolchain. 

The bug is caused by the way elf2flt resolves symbol names, assuming that
the symbols names are unique instead of relying on the information
provided by BFD. I am not sure why we need to do symbol name lookup at
all, so I left a warning in this patch to give a heads up to those hitting
this relocation problem, and let them consider the correctness. The new
default will at least provide better results for the tests I have done
(i.e. busybox compiles and my other programs works as before).


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-20-08 12:11  stigpo         New Issue                                    
02-20-08 12:11  stigpo         Status                   new => assigned     
02-20-08 12:11  stigpo         Assigned To               => buildroot       
02-20-08 12:11  stigpo         File Added: elf2flt-arm-local-reloc.patch        
           
======================================================================
