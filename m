From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:24 -0800
Subject: [Buildroot] [buildroot 0000184]: buildroot -
	toolchain/kernel-headers/kernel-headers.mk
Message-ID: <844f5bb4167630359c904821ee5202e6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=184 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   184
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-22-2005 15:39 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    buildroot -
toolchain/kernel-headers/kernel-headers.mk
Description: 
on line 89 "toolchain/patch-kernel.sh $(LINUX_HEADERS_DIR)
toolchain/kernel-headers linux-libc-headers-$(LINUX_VERSION)-\*.patch"

won't pull in kernel patch "linux-libc-headers-2.6.11.0.patch as it is
0.patch and not -iptables or some other .patch

Didn't know which way you wanted to fix it (either rename
linux-libc-headers-2.6.11.0.patch) or pull $(LINUX_VERSION)\*patch
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:15  
---------------------------------------------------------------------- 
this was fixed sometime ago by changing it to
$(LINUX_VERSION)\*.patch 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-22-05 15:39  gnat           New Issue                                    
08-28-05 01:15  vapier         Note Added: 0000459                          
08-28-05 01:15  vapier         Status                   assigned => closed  
08-28-05 01:15  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
