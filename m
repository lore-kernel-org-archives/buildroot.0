From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:49 -0800
Subject: [Buildroot] [buildroot 0000126]: make breaks when TARGET_DIR is
	specified on command line
Message-ID: <a253215f5b10758195d3937519a74c68@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=126 
====================================================================== 
Reported By:                bmarenkov
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   126
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-26-2005 20:36 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    make breaks when TARGET_DIR is specified on command
line
Description: 
After all the usual "make menuconfig", the make procedure breaks when I
specify:

make "TARGET_DIR=/home/user/root"

However, if I just issue:

make

all goes well. It looks like the genext2fs-1.3/genext2fs utility has some
dependency or the makefile isn't set up right to handle another location
of the root file system. See the additional debug log.

====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-25-06 08:18  
---------------------------------------------------------------------- 
the TARGET_DIR is currently hardcoded in the make files. if you would like
to look at how the download directory is configured and do the same for
TARGET_DIR. once thats down, submit a patch using diff -urN


 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-26-05 20:36  bmarenkov      New Issue                                    
03-16-05 12:12  andersen       Status                   new => assigned     
03-16-05 12:12  andersen       Assigned To               => uClibc          
01-25-06 08:18  prpplague      Note Added: 0001001                          
01-25-06 08:18  prpplague      Status                   assigned => closed  
01-25-06 08:18  prpplague      Resolution               open => won't fix   
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
