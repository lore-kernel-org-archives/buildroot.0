From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Jan 2008 09:36:09 -0800
Subject: [Buildroot] [buildroot 0001889]: EABI is not compatible with mipsel
	-mips32
Message-ID: <5d81f6454208c9f4f2f1c3762379fd93@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1889 
====================================================================== 
Reported By:                alec_v
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1889
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-04-2008 09:36 PST
Last Modified:              01-04-2008 09:36 PST
====================================================================== 
Summary:                    EABI is not compatible with mipsel  -mips32
Description: 


.....
/usr/bin/make MAKE="/usr/bin/make -j1" -C
/home/alec/mips/buildroot-20080104/toolchain_build_mipsel/uClibc-0.9.29 \
        PREFIX= \
        DEVEL_PREFIX=/ \
        RUNTIME_PREFIX=/ \
        HOSTCC="/usr/bin/gcc" \
        all
make[1]: Entering directory
`/home/alec/mips/buildroot-20080104/toolchain_build_mipsel/uClibc-0.9.29'
make[2]: `conf' is up to date.
ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:1: error: -march=mips32 is not compatible with the
selected ABI
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/alec/mips/buildroot-20080104/toolchain_build_mipsel/uClibc-0.9.29'
make: ***
[/home/alec/mips/buildroot-20080104/toolchain_build_mipsel/uClibc-0.9.29/lib/libc.a]
Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-04-08 09:36  alec_v         New Issue                                    
01-04-08 09:36  alec_v         Status                   new => assigned     
01-04-08 09:36  alec_v         Assigned To               => buildroot       
======================================================================
