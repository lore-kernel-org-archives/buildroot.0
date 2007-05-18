From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 18 May 2007 03:03:45 -0700
Subject: [Buildroot] [buildroot 0000466]: filefrag.c in e2fsprogs in
	buildroot does not compile
Message-ID: <0888d2b3f6059a72105bc5ab0113cb44@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-04-2005 10:21 PDT
Last Modified:              05-18-2007 03:03 PDT
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

---------------------------------------------------------------------- 
 jdupre - 02-13-07 13:44  
---------------------------------------------------------------------- 
Sorry, can't say.  I have not used buildroot since I reported this. 

---------------------------------------------------------------------- 
 bernhardf - 05-18-07 03:03  
---------------------------------------------------------------------- 
Reported against an older version of e2fsprogs, unknown status for current
package version, so closing for now. Thanks for the report, though. 

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
02-13-07 13:44  jdupre         Note Added: 0002158                          
05-18-07 03:03  bernhardf      Status                   assigned => closed  
05-18-07 03:03  bernhardf      Note Added: 0002371                          
======================================================================
