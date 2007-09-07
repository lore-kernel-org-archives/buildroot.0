From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 7 Sep 2007 11:52:06 -0700
Subject: [Buildroot] [buildroot 0001490]: kernel-headers 2.6.12 unsuitable
	for ARM EABI
Message-ID: <745a045e13b7bbff5b2140a8337e0ffa@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-06-2007 05:46 PDT
Last Modified:              09-07-2007 11:52 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 09-07-07 11:52  
---------------------------------------------------------------------- 
BR2_DEPRECATED should be obvious enough. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-06-07 05:46  ikonst         New Issue                                    
09-06-07 05:46  ikonst         Status                   new => assigned     
09-06-07 05:46  ikonst         Assigned To               => buildroot       
09-06-07 05:46  ikonst         File Added:
buildroot-arm-eabi-kernel-headers.patch                    
09-07-07 11:52  bernhardf      Status                   assigned => closed  
09-07-07 11:52  bernhardf      Note Added: 0002728                          
======================================================================
