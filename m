From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:00 -0800
Subject: [Buildroot] [buildroot 0000860]: bash segfaults on "chroot
	<toolchain-jail> /bin/bash
Message-ID: <6b7aad1d3870aefcad23de2becc0c092@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=860 
====================================================================== 
Reported By:                zugvogel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   860
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-29-2006 16:00 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    bash segfaults on "chroot <toolchain-jail> /bin/bash
Description: 
Context: Trying to use buildroot to set up a local root-jail for
development against     uClibc (i686->i686).

Symptom: When unwrapping the ext2 target, and attempting to chroot into
executing        bash, I get an immediate "segmentation fault". Chrooting
into /bin/ash will work       fine. Once inside the jail, bash will still
segfault. Other commands I have sampled    do work fine.



====================================================================== 

---------------------------------------------------------------------- 
 crito - 05-01-06 11:47  
---------------------------------------------------------------------- 
Since i have the same problem i uploaded a strace output from the chroot
call:

# chroot /target strace /bin/bash

hope it can help. 

---------------------------------------------------------------------- 
 vapier - 05-03-06 21:40  
---------------------------------------------------------------------- 
known issue

change strong_alias() to weak_alias() and search the uClibc mailing list
for more info 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:33  
---------------------------------------------------------------------- 
This should be fixed in uClibc trunk. If you still get this, please report
it against uClibc (and the uClibc-list) and not buildroot.

Thanks for the report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-29-06 16:00  zugvogel       New Issue                                    
04-29-06 16:00  zugvogel       Status                   new => assigned     
04-29-06 16:00  zugvogel       Assigned To               => uClibc          
05-01-06 11:46  crito          File Added: uclibc_bash.strace                   

05-01-06 11:47  crito          Note Added: 0001340                          
05-01-06 12:03  crito          Issue Monitored: crito                       
05-03-06 21:40  vapier         Note Added: 0001341                          
01-21-07 06:33  bernhardf      Status                   assigned => closed  
01-21-07 06:33  bernhardf      Note Added: 0002014                          
01-21-07 06:33  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
