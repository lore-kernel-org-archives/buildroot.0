From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:52 -0800
Subject: [Buildroot] [buildroot 0000853]: acpid make fails (at least on x86
	for i386 and arm)
Message-ID: <8a39dc80f96465f5cf784b22a581c705@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=853 
====================================================================== 
Reported By:                nils
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   853
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2006 08:00 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    acpid make fails (at least on x86 for i386 and arm)
Description: 
make[1]: Entering directory
`/home/nils/workspace/rootfs/cmx/build/acpid-1.0.4'
arm-linux-gcc -Wall -Werror -g -DVERSION="\"1.0.4\""   -c -o acpid.o
acpid.c
arm-linux-gcc -Wall -Werror -g -DVERSION="\"1.0.4\""   -c -o event.o
event.c
arm-linux-gcc -Wall -Werror -g -DVERSION="\"1.0.4\""   -c -o ud_socket.o
ud_socket.c
cc1: warnings being treated as errors
ud_socket.c: In function 'ud_accept':
ud_socket.c:63: warning: pointer targets in passing argument 3 of 'accept'
differ in signedness
ud_socket.c:74: warning: pointer targets in passing argument 5 of
'getsockopt' differ in signedness
make[1]: *** [ud_socket.o] Error 1
make[1]: Leaving directory
`/home/nils/workspace/rootfs/cmx/build/acpid-1.0.4'
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-29-06 05:09  
---------------------------------------------------------------------- 
I think this was fixed in r16712.
Thanks for the report.

PS: please send a small note to the mailing-list if it is not fixed now. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-06 08:00  nils           New Issue                                    
04-26-06 08:00  nils           Status                   new => assigned     
04-26-06 08:00  nils           Assigned To               => uClibc          
04-26-06 08:00  nils           File Added: acpid-werror.patch                   

11-29-06 05:09  bernhardf      Status                   assigned => closed  
11-29-06 05:09  bernhardf      Note Added: 0001833                          
11-29-06 05:09  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
