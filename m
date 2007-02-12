From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:42 -0800
Subject: [Buildroot] [buildroot 0000466]: filefrag.c in e2fsprogs in
	buildroot does not compile
Message-ID: <e4fcdc47d529f0e2d807fd15ec00b50f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=466 
====================================================================== 
Reported By:                jdupre
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   466
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-04-2005 10:21 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    filefrag.c in e2fsprogs in buildroot does not
compile
Description: 
I get the following errors when I add e2fsprogs to my buildroot 
configuration:

filefrag.c: In function 'frag_report':
filefrag.c:72: error: storage size of 'fileinfo' isn't known
filefrag.c:104: error: 'O_LARGEFILE' undeclared (first use in this 
function
filefrag.c:104: error: (Each undeclared identifier is reported only 
once
filefrag.c:104: error: for each function it appears in.)

This compile time error happens with todays (20051003) snapshot of 
buildroot (using e2fsprogs-1.38) and the 20050817 snapshot (using 
e2fsprogs-1.37).

In both instances I am using the latest "released" version of uClibc, not
the current SVN, and the latest available kernel headers (2.6.12).

I tried enabling largefile support in buildroot menuconfig, but that made
no difference. 

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:14  
---------------------------------------------------------------------- 
We currently are using e2fsprogs-1.39. Do you still see the error you
descibe in the initial report? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-04-05 10:21  jdupre         New Issue                                    
10-04-05 10:21  jdupre         Status                   new => assigned     
10-04-05 10:21  jdupre         Assigned To               => uClibc          
10-04-05 10:21  jdupre         File Added: .config                          
01-21-07 09:14  bernhardf      Note Added: 0002022                          
01-21-07 09:14  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
