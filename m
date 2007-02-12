From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:33 -0800
Subject: [Buildroot] [buildroot 0000542]: Non-existent symlink destination
	for asm in linux-kernel-headers for ARCH i{4, 5, 6}86
Message-ID: <cac2f941a6f7d9cd69194be7decf091b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=542 
====================================================================== 
Reported By:                jzb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   542
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-12-2005 14:42 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    Non-existent symlink destination for asm in
linux-kernel-headers for ARCH i{4,5,6}86
Description: 
Kernel headers do not differentiate between i386, i486, i586, and i686
asm-* include directory.  Only asm-i386 exists, and not asm-i486, etc. 
./toolchain/kernel-headers/kernel-headers.mk uses $(ARCH) in generating
asm symlink in the kernel include directory.  $(ARCH) can be any of i386,
i486, etc.  This only works if $(ARCH) = i386.  Attached patch fixes this
by creating treating all i386, i486, etc. $(ARCH) values as i386 for the
purpose of creating the symlink.  Please review and if satisfactory,
promote to project.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-12-05 14:42  jzb            New Issue                                    
11-12-05 14:42  jzb            Status                   new => assigned     
11-12-05 14:42  jzb            Assigned To               => uClibc          
11-12-05 14:42  jzb            File Added: kernel-headers.mk.i386-symlink.patch 
                  
11-12-05 15:12  jzb            Issue Monitored: jzb                         
01-24-06 12:20  prpplague      Status                   assigned => resolved
01-24-06 12:20  prpplague      Resolution               open => fixed       
01-24-06 12:20  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
