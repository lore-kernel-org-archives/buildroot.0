From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 19 May 2007 11:50:59 -0700
Subject: [Buildroot] [buildroot 0001357]: EABI on ARM compiled buildroot
	doesn't work
Message-ID: <2eb6c65967c1c17bd7b0c422bf9f0423@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1357 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1357
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-18-2007 14:56 PDT
Last Modified:              05-19-2007 11:50 PDT
====================================================================== 
Summary:                    EABI on ARM compiled buildroot doesn't work
Description: 
I compile latest buildroot with target ARM and EABI al without problems.
But when I boot to new root all programs crash with Illegal instruction. I
use default config only chose generic ARM and EABI.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-18-07 15:15  
---------------------------------------------------------------------- 
Without *any* information, this is not a valid bug-report. Will close
unless you provide details. 

---------------------------------------------------------------------- 
 marvin - 05-18-07 15:51  
---------------------------------------------------------------------- 
Please tell me which information you need I spend time to gogling to solve
this but nothing helps. Do you need config ? Or information about hw ? 

---------------------------------------------------------------------- 
 repvik - 05-19-07 03:27  
---------------------------------------------------------------------- 
marvin... Try reading http://www.catb.org/~esr/faqs/smart-questions.html
first. 

---------------------------------------------------------------------- 
 rashbaugh - 05-19-07 07:01  
---------------------------------------------------------------------- 
When you build programs with an EABI toolchain, you must build your kernel
with EABI enabled also, otherwise programs will crash.
With EABI, program syscalls to the kernal use a different format and
unless
the kernel is prepared to accept this new format, syscalls will fail. 

---------------------------------------------------------------------- 
 marvin - 05-19-07 11:50  
---------------------------------------------------------------------- 
Yes I know it I compile kernel with EABI build in. I use
buildroot-20070519.tar.bz2 kernel 2.6.18 for ARM my machine is Debian
Etch.
I use buildroot 2 years with ARM and OABI without problem. Only difference
is that I in kernel switch to EABI and in buidroot too. And after this  it
stop work.
As HW I use TS-7250 (www.embeddedarm.com). I attach config of arm kernel.
Config of buldroot. If you know that EABI with buildroot is working on ARM
I stop 
madden with this and try found my fault :-) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-18-07 14:56  marvin         New Issue                                    
05-18-07 14:56  marvin         Status                   new => assigned     
05-18-07 14:56  marvin         Assigned To               => buildroot       
05-18-07 15:15  bernhardf      Note Added: 0002375                          
05-18-07 15:51  marvin         Note Added: 0002377                          
05-19-07 03:27  repvik         Note Added: 0002379                          
05-19-07 07:01  rashbaugh      Note Added: 0002380                          
05-19-07 11:50  marvin         Note Added: 0002381                          
======================================================================
