From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 2 Jul 2007 09:09:48 -0700
Subject: [Buildroot] [buildroot 0001416]: Busybox compiled but not working
	on SH3
Message-ID: <1fcb8508dda6a77d47a0604172999515@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1416 
====================================================================== 
Reported By:                joshash
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1416
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-02-2007 09:09 PDT
Last Modified:              07-02-2007 09:09 PDT
====================================================================== 
Summary:                    Busybox compiled but not working on SH3
Description: 
I am using buildroot-20070615.tar.bz2 with combination of uclibc-0.9.29 ,
binutils-2.17 , busybox-1.6.0 and gcc-4.2.0.
I made the following changes :
1. During compilation, I had to change a line in
toolchain/gcc/gcc-uclibc-3.x.mk 
   Patch is attached.
2. I had to add libgcc_s.so* libraries in the root file system manually.

The current situation is, the toolchain is built and I can compile and run
simple "Hello world!" like programs dynamically. But, the busybox does not
start and give any command prompt on serial console or tty0.

It gives the message like "Please press Enter to activate this console".
After pressing Enter's, same message appears again and again.
One more problem is, I can get login prompt on tty2 or so, but I cannot
login. I cannot configure the user and respective passwords coz I dont
have any command prompt to do so.

One more thing. The simple application has Flags=0x2,sh2 whereas the
busybox gets built with Flags=0x16.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-02-07 09:09  joshash        New Issue                                    
07-02-07 09:09  joshash        Status                   new => assigned     
07-02-07 09:09  joshash        Assigned To               => buildroot       
======================================================================
