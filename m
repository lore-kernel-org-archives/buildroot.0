From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 15 Oct 2008 10:31:59 -0700
Subject: [Buildroot] [buildroot 0005434]: changing option in uClibc
	menuconfig doesn't cause recompile of uClibc library
Message-ID: <f7d83a788ed566a03826c1f94b3a2780@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5434 
====================================================================== 
Reported By:                suffecool
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5434
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-15-2008 10:31 PDT
Last Modified:              10-15-2008 10:31 PDT
====================================================================== 
Summary:                    changing option in uClibc menuconfig doesn't cause
recompile of uClibc library
Description: 
After successfully compiling the libuClibc-0.9.29.so library, I changed the
.config file to turn off the UCLIBC_HAS_ERRNO_MESSAGES and
UCLIBC_HAS_SIGNUM_MESSAGES options, and reran the make command. The
applicable code was not recompiled, and my uClibc library remained
unchanged. The only output I get is:
  STRIP -x -R .note -R .comment lib/libpthread.a
  AR cr lib/libpthread.a

The only way I was able to force a recompile was to blow everything away
with a "make clean" and start from scratch.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-15-08 10:31  suffecool      New Issue                                    
10-15-08 10:31  suffecool      Status                   new => assigned     
10-15-08 10:31  suffecool      Assigned To               => buildroot       
======================================================================
