From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:58 -0800
Subject: [Buildroot] [buildroot 0000632]: Fail to build crtstuff.c on
	pc-cygwin
Message-ID: <61d94bc8ef7b896abdad2b2c6d5d8f08@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=632 
====================================================================== 
Reported By:                petev
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   632
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-09-2006 16:30 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Fail to build crtstuff.c on pc-cygwin
Description: 
I'm using buildroot-20060109.tar.bz2 to build a mipsel-linux target on the
latest cygwin with the snapshot of uClibc. crtstuff.c fails to compile as
bits/pthreadtypes.h cannot be found by the compiler. It appears as if the
file is supposed to be in:

-isystem
/cygdrive/c/buildroot/buildroot/build_mipsel_nofpu/staging_dir/mipsel-linux-uclibc/include

However, this include directory does not even exist. When does it get
setup? The file does exist in:

/cygdrive/c/buildroot/buildroot/toolchain_mipsel_nofpu/uClibc/include



====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:46  
---------------------------------------------------------------------- 
Does this work with linux-2.6.19.1 kernel headers and a gcc-4.1 and current
uClibc-svn ? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-09-06 16:30  petev          New Issue                                    
01-09-06 16:30  petev          Status                   new => assigned     
01-09-06 16:30  petev          Assigned To               => uClibc          
01-09-06 16:30  petev          File Added: make_log.txt                     
12-22-06 04:46  bernhardf      Note Added: 0001920                          
12-22-06 04:46  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
