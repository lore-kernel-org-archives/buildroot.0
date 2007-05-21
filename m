From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 May 2007 08:43:19 -0700
Subject: [Buildroot] [buildroot 0001362]: kernel 2.6.20.4 termios.h header
	has B230400 commented out, etc.
Message-ID: <f07fe89c6289b4289e1018efab521abb@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1362 
====================================================================== 
Reported By:                jcurl
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1362
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-21-2007 08:43 PDT
Last Modified:              05-21-2007 08:43 PDT
====================================================================== 
Summary:                    kernel 2.6.20.4 termios.h header has B230400
commented out, etc.
Description: 
When using buildroot to create a tool chain (GCC 4.1.2, binutils 2.17,
kernel 2.6.20.4, uClibc 0.9.29) from buildroot-20070515, notice that the
'termios.h' header in the Linux kernel has higher baudrates removed. The
comment there states to "keep inline with uclibc". No other components in
buildroot were compiled. The compilation system is x86.

When looking at module cfsetspeed.c in uclibc it appears it does support
these other baudrates in the kernel and passes them on in the
termios_struct to the OS. Thus it probably isn't needed anymore to comment
out these defines for uclibc 0.9.29.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 08:43  jcurl          New Issue                                    
05-21-07 08:43  jcurl          Status                   new => assigned     
05-21-07 08:43  jcurl          Assigned To               => buildroot       
======================================================================
