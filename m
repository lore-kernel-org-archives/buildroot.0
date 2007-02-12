From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:01 -0800
Subject: [Buildroot] [buildroot 0000957]: Patch failed! Please fix
	bash30-001!
Message-ID: <59415a644e17b0e2c86fb532ad2775f2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=957 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   957
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2006 20:30 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Patch failed!  Please fix bash30-001!
Description: 
wget --passive-ftp -P /home/tools/buildroot/dl
http://ftp.gnu.org/pub/gnu/bash/bash-3.1.tar.gz
--23:20:37--  http://ftp.gnu.org/pub/gnu/bash/bash-3.1.tar.gz
           => `/home/tools/buildroot/dl/bash-3.1.tar.gz'
Resolving ftp.gnu.org... 199.232.41.7
Connecting to ftp.gnu.org[199.232.41.7]:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2,533,934 [application/x-tar]

100%[========================================================>] 2,533,934 
   30.91K/s    ETA 00:00

23:21:51 (33.74 KB/s) - `/home/tools/buildroot/dl/bash-3.1.tar.gz' saved
[2,533,934/2,533,934]

zcat /home/tools/buildroot/dl/bash-3.1.tar.gz | tar -C
/home/tools/buildroot/build_arm_nofpu   -xf -toolchain/patch-kernel.sh
/home/tools/buildroot/build_arm_nofpu/bash-3.1 package/bash/ bash??-*

Applying bash30-001 using plaintext:
patching file arrayfunc.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file arrayfunc.c.rej
patching file subst.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file subst.c.rej
patching file variables.c
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 1420.
Hunk http://busybox.net/bugs/view.php?id=2 FAILED at 1600.
2 out of 2 hunks FAILED -- saving rejects to file variables.c.rej
patching file pcomplete.c
Hunk http://busybox.net/bugs/view.php?id=1 succeeded at 864 with fuzz 2.
Hunk http://busybox.net/bugs/view.php?id=2 succeeded at 1032 with fuzz 1 (offset
8 lines).
patching file array.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file array.c.rej
patching file patchlevel.h
patching file tests/dbg-support.tests
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file
tests/dbg-support.tests.rej
Patch failed!  Please fix bash30-001!
make: *** [/home/tools/buildroot/build_arm_nofpu/bash-3.1/.unpacked] Error
1

====================================================================== 

---------------------------------------------------------------------- 
 bowerymarc - 07-16-06 22:17  
---------------------------------------------------------------------- 
deleting all the 3.0 patches lets this compile:


[root at localhost package]# cd package/bash
[root at localhost bash]# ls
bash30-001  bash30-006  bash30-011  bash30-016  bash31-005  bash31-010 
bash31-015
bash30-002  bash30-007  bash30-012  bash31-001  bash31-006  bash31-011 
bash31-016
bash30-003  bash30-008  bash30-013  bash31-002  bash31-007  bash31-012 
bash31-017
bash30-004  bash30-009  bash30-014  bash31-003  bash31-008  bash31-013 
bash.mk
bash30-005  bash30-010  bash30-015  bash31-004  bash31-009  bash31-014 
Config.in
[root at localhost bash]# mkdir DISABLE
[root at localhost bash]# mv bash30-* DISABLE 

---------------------------------------------------------------------- 
 vapier - 07-19-06 17:01  
---------------------------------------------------------------------- 
your repo is screwed up, fix it 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-06 20:30  bowerymarc     New Issue                                    
07-16-06 20:30  bowerymarc     Status                   new => assigned     
07-16-06 20:30  bowerymarc     Assigned To               => uClibc          
07-16-06 22:17  bowerymarc     Note Added: 0001527                          
07-19-06 17:01  vapier         Note Added: 0001538                          
07-19-06 17:01  vapier         Status                   assigned => closed  
07-19-06 17:01  vapier         Resolution               open => unable to
reproduce
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
