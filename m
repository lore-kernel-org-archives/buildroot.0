From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Nov 2007 07:58:13 -0800
Subject: [Buildroot] [buildroot 0001599]: Buildroot fails to build
Message-ID: <1eb2088a533315f839d555fab1996b83@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1599 
====================================================================== 
Reported By:                dysath
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1599
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-21-2007 07:58 PST
Last Modified:              11-21-2007 07:58 PST
====================================================================== 
Summary:                    Buildroot fails to build
Description: 
Objective: Build uClibc toolchain for AMD/Geode proc
Source Machine: x86_32, openSUSE 10.3
Target Machine: Geode, uClibc

Test case:
tar jxf buildroot-snapshot.tar.bz2
cd buildroot
make menuconfig
* Target Architecture (i386)
* Target Architecture Variant (geode)
make ARCH=i386

checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
Unknown CPU given in --with-arch=geode.
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/mnt/buildroot/toolchain_build_i386/gcc-4.2.1-initial'
make: ***
[/mnt/buildroot/toolchain_build_i386/gcc-4.2.1-initial/.compiled] Error 2

I'm pretty sure I shouldn't have to include that 'ARCH=i386' to begin
with, but if I don't, ARCH is blank throughout the 'make' and crashes.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-21-07 07:58  dysath         New Issue                                    
11-21-07 07:58  dysath         Status                   new => assigned     
11-21-07 07:58  dysath         Assigned To               => buildroot       
======================================================================
