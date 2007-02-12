From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:19 -0800
Subject: [Buildroot] [buildroot 0000220]: buildroot: Problems building
	genext2fs
Message-ID: <70ff3e893f0956a1bb3fde3b7a20e66b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=220 
====================================================================== 
Reported By:                kk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   220
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2005 05:42 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    buildroot: Problems building genext2fs
Description: 
I tried to run buildroot on an Interix host system (with most Interix
programs replaced by GNU versions).

There were two problems building genext2fs:

1.) genext2fs unconditionally includes "getopt.h". This is a non-POSIX
header which does not exist on my system. By POSIX standards, getopt is
declared in "unistd.h".

2.) genext2fs uses a function named "getline" to read from a file. This
function is nonstandard and does not exist on my system, linking fails.

====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:42  
---------------------------------------------------------------------- 
don't have access to the unusual configuration you have, therefor we are
unable to reproduce the issue 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-05 05:42  kk             New Issue                                    
01-20-06 12:42  prpplague      Note Added: 0000964                          
01-20-06 12:42  prpplague      Status                   assigned => closed  
01-20-06 12:42  prpplague      Resolution               open => unable to
reproduce
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
