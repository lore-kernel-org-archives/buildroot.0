From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 May 2008 02:04:01 -0700
Subject: [Buildroot] [buildroot 0003394]: compilation problem :
	__NR_socketcall, __NR_ipc undefined...
Message-ID: <52a86aee2486c2ca6a01de09e8bd0c53@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3394 
====================================================================== 
Reported By:                rk_appan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3394
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-22-2008 02:04 PDT
Last Modified:              05-22-2008 02:04 PDT
====================================================================== 
Summary:                    compilation problem : __NR_socketcall, __NR_ipc
undefined...
Description: 
I am building uClibc(0.9.29), when i enable the strace for the target, i am
getting the following errors.  target is arm926t with EABI support.

please provide me inputs as how to get out of this problem..

syscall.c: In function 'get_scno':
syscall.c:1051: warning: passing argument 4 of 'ptrace' makes integer from
pointer without a cast
syscall.c:1080: warning: passing argument 4 of 'ptrace' makes integer from
pointer without a cast
syscall.c: In function 'syscall_fixup':
syscall.c:1350: warning: unused variable 'pid'
syscall.c: In function 'syscall_enter':
syscall.c:1928: warning: unused variable 'pid'
syscall.c: In function 'trace_syscall':
syscall.c:2408: error: '__NR_socketcall' undeclared (first use in this
function)
syscall.c:2408: error: (Each undeclared identifier is reported only once
syscall.c:2408: error: for each function it appears in.)
syscall.c:2412: error: '__NR_ipc' undeclared (first use in this function)
make[2]: *** [syscall.o] Error 1
make[2]: Leaving directory `/home/kans/buildroot/build_arm/strace-4.5.15'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/kans/buildroot/build_arm/strace-4.5.15'
make: *** [/home/kans/buildroot/build_arm/strace-4.5.15/strace] Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-22-08 02:04  rk_appan       New Issue                                    
05-22-08 02:04  rk_appan       Status                   new => assigned     
05-22-08 02:04  rk_appan       Assigned To               => buildroot       
======================================================================
