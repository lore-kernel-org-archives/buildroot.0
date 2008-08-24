From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 24 Aug 2008 00:53:02 -0700
Subject: [Buildroot] [buildroot 0004534]: errors in gdb.mk,
	leading to build failures
Message-ID: <587919efa348fab02fb699171ab83c53@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4534 
====================================================================== 
Reported By:                rbuergel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4534
Category:                   Other
Reproducibility:            have not tried
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-08-2008 05:51 PDT
Last Modified:              08-24-2008 00:53 PDT
====================================================================== 
Summary:                    errors in gdb.mk, leading to build failures
Description: 
1. gdb is eventually patched twice:
  first during the .unpacked-target and a second time during the
.patched-target

2. gdbserver and gdb on host depend on .unpacked instead of .patched


svn blame shows, that when the .patched-target was introduced, the
patching wasn't removed from .unpacked, but target-gdb depends on
.patched, leading to a situation, where the patches were applied twice.
The change was correct, but it was only the half of what has to be done.
The appended patch changes the remaining parts. It changes gdbserver and
host-gdb to depend on .patched and removed the patching from the
.unpacked-target.

====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-24-08 00:53  
---------------------------------------------------------------------- 
Sorry about that - Got broken in r22624 and is now fixed in r23193.

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-08 05:51  rbuergel       New Issue                                    
08-08-08 05:51  rbuergel       Status                   new => assigned     
08-08-08 05:51  rbuergel       Assigned To               => buildroot       
08-08-08 05:51  rbuergel       File Added: gdb.mk.patch                     
08-24-08 00:53  jacmet         Status                   assigned => closed  
08-24-08 00:53  jacmet         Note Added: 0010734                          
======================================================================
