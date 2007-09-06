From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Sep 2007 05:46:44 -0700
Subject: [Buildroot] [buildroot 0001490]: kernel-headers 2.6.12 unsuitable
	for ARM EABI
Message-ID: <6cd93578192d6d5c8dfc1cbc8df11595@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1490 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1490
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-06-2007 05:46 PDT
Last Modified:              09-06-2007 05:46 PDT
====================================================================== 
Summary:                    kernel-headers 2.6.12 unsuitable for ARM EABI
Description: 
When trying to compile uClibc with kernel-headers 2.6.12 on ARM EABI
platform, an error occurs when building libc/misc/sysvipc/msgget.os (from
libc/misc/sysvipc/msgq.c), since the kernel headers undefines the __NR_ipc
syscall on ARM EABI and also doesn't define __NR_msgctl (claiming that
there's a multiplexer syscall which should be used instead). In any case,
it's a mess which is not present in modern (e.g. 2.6.21) kernel headers.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-06-07 05:46  ikonst         New Issue                                    
09-06-07 05:46  ikonst         Status                   new => assigned     
09-06-07 05:46  ikonst         Assigned To               => buildroot       
09-06-07 05:46  ikonst         File Added:
buildroot-arm-eabi-kernel-headers.patch                    
======================================================================
