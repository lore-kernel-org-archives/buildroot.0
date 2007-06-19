From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 19 Jun 2007 04:30:09 -0700
Subject: [Buildroot] [buildroot 0001153]: sfdisk fails to compile
Message-ID: <b6e841c5b22133ca698a4919708a6fc1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1153 
====================================================================== 
Reported By:                Steven_Carr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1153
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-09-2007 23:31 PST
Last Modified:              06-19-2007 04:30 PDT
====================================================================== 
Summary:                    sfdisk fails to compile
Description: 
Buildroot failes when compiling sfdisk 
====================================================================== 

---------------------------------------------------------------------- 
 tsoutherwood - 06-19-07 04:30  
---------------------------------------------------------------------- 
Hi

I have a solution to this bug, verified on an x86 target, though I don't
see why it wouldn't work in the general case:

Remove: buildroot/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch
Add: buildroot/package/sfdisk/sfdisk.002.fix-lseek.patch

from the attachment to this bug note.

Patch sfdisk.mk with sfdisk.mk.patch as attached to this bug note.

rebuild, et voila!

HTH and comments welcome if there are any issues with that.

Tim Southerwood. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-09-07 23:31  Steven_Carr    New Issue                                    
01-09-07 23:31  Steven_Carr    Status                   new => assigned     
01-09-07 23:31  Steven_Carr    Assigned To               => uClibc          
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
06-19-07 04:24  tsoutherwood   File Added: sfdisk.002.fix-lseek.patch           
        
06-19-07 04:26  tsoutherwood   File Added: sfdisk.mk.patch                    
06-19-07 04:30  tsoutherwood   Note Added: 0002487                          
======================================================================
