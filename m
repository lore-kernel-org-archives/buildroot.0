From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 28 Dec 2007 13:57:29 -0800
Subject: [Buildroot] [buildroot 0001824]: mpfr-2.3.0 does not build
Message-ID: <1504e0b2fdb5e738b81a189a52236634@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1824 
====================================================================== 
Reported By:                mfladischer
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1824
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-27-2007 04:35 PST
Last Modified:              12-28-2007 13:57 PST
====================================================================== 
Summary:                    mpfr-2.3.0 does not build
Description: 
mpfr-2.3.0 fails on compile:

/usr/bin/make -j1 -C
/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host
install
make[1]: Entering directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host'
Making install in tests
make[2]: Entering directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host/tests'
make[3]: Entering directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host/tests'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host/tests'
make[2]: Leaving directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host/tests'
make[2]: Entering directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host'
make[2]: *** No rule to make target
`/home/users/mfladischer/tvclient/buildroot/toolchain_build_i386/mpfr-2.3.0/exceptions.c',
needed by `exceptions.lo'.  Stop.
make[2]: Leaving directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host'
make: ***
[/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr/lib/libmpfr.so]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 thomasez - 12-28-07 13:57  
---------------------------------------------------------------------- 
I could not reproduce this and there's something weird here.

make[2]: Entering directory
`/home/users/mfladischer/buildroot/toolchain_build_i386/mpfr-2.3.0-host'

make[2]: *** No rule to make target 
`/home/users/mfladischer/tvclient/buildroot/toolchain_build_i386/mpfr-2.3.0/exceptions.c',
needed by `exceptions.lo'. Stop.

Where did "tvclient" come from in that path?


Thomas. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-27-07 04:35  mfladischer    New Issue                                    
12-27-07 04:35  mfladischer    Status                   new => assigned     
12-27-07 04:35  mfladischer    Assigned To               => buildroot       
12-28-07 13:57  thomasez       Note Added: 0003294                          
======================================================================
