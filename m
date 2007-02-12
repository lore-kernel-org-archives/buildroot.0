From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:03 -0800
Subject: [Buildroot] [buildroot 0000535]: Header files for libc & libc++ are
	hard to find, should option to install
Message-ID: <5eb397be4ca59e2d5bb270d29dd6da68@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=535 
====================================================================== 
Reported By:                alemc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   535
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-07-2005 15:56 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Header files for libc & libc++ are hard to find,
should option to install
Description: 
I'm using buildroot to create an ext2 filesystem for loop mounting.  The
system thus created is my compilation box for uClibc-based floppies.  It
would be nice if it were easier to find/install the uClibc & stdc++ header
files into the target system (which becomes my build host).
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-07-05 18:33  
---------------------------------------------------------------------- 
not quite sure what you're referring to ... the headers are installed in
the target image in the normal toolchain locations (like /usr/include) 

---------------------------------------------------------------------- 
 alemc - 11-09-05 17:58  
---------------------------------------------------------------------- 
I've rebuilt from the svn sources checkout # 12813 2005-11-07
/usr/include only has zconf.h and zlib.h
I used make menuconfig followed by make
I can attach the .config if it would help, but the problem is clearly
still there. 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 09:22  
---------------------------------------------------------------------- 
I cannot reproduce this with gcc-4.2, so if this fails, then please attach
your .config. Note that i, personally, will not touch gcc <= 4.2 since 3.x
is not officially maintained anymore upstream, 4.0 is about to be closed
and 4.2 works fine for me. Thanks for your understanding. 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 03:52  
---------------------------------------------------------------------- 
You have to select "native toolchain in the target filesystem" in the
package menu in order to have the uclibc and related headers in the
rootfs. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-07-05 15:56  alemc          New Issue                                    
11-07-05 15:56  alemc          Status                   new => assigned     
11-07-05 15:56  alemc          Assigned To               => uClibc          
11-07-05 18:33  vapier         Note Added: 0000671                          
11-07-05 18:33  vapier         Status                   assigned => closed  
11-07-05 18:33  vapier         Resolution               open => unable to
reproduce
11-09-05 17:58  alemc          Status                   closed => feedback  
11-09-05 17:58  alemc          Resolution               unable to reproduce =>
reopened
11-09-05 17:58  alemc          Note Added: 0000675                          
11-11-05 17:57  alemc          File Added: uClibc_rootfs.conf                   

01-19-07 09:22  bernhardf      Note Added: 0002001                          
01-21-07 03:52  bernhardf      Status                   feedback => closed  
01-21-07 03:52  bernhardf      Note Added: 0002013                          
01-21-07 03:52  bernhardf      Resolution               reopened => no change
required
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
