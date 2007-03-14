From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Mar 2007 00:21:48 -0700
Subject: [Buildroot] [buildroot 0001274]: march=mips does not finish make
	(march and ABI incompatibility)
Message-ID: <16519e71ef6d7cab34822e76f8ca44cd@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1274 
====================================================================== 
Reported By:                muckbert
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1274
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-14-2007 00:21 PDT
Last Modified:              03-14-2007 00:21 PDT
====================================================================== 
Summary:                    march=mips does not finish make (march and ABI
incompatibility)
Description: 
I selected the following:
Target Architecture: mips
Target ABI: N32
Target Processor Arch: mips32 (CONFIG_MIPS_ISA_MIPS32)
The Target-Processor is an Infineon INCAIP2/INCAIP 

After starting make menuconfig, I select only the target Architecture, no
more changes. After running make the build always breaks after a while
with the following message of incompatibility:

...
ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
make[3]: `conf' is up to date.
ln -fs sgidefs.h ./include/
:0: error: -march=mips32 is not compatible with the selected ABI
:0: error: -march=mips32 is not compatible with the selected ABI
  AS libc/string/mips/memcpy.os
libc/string/mips/memcpy.S:0: error: -march=mips32 is not compatible with
the selected ABI
make[2]: *** [libc/string/mips/memcpy.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory `/root/buildroot/toolchain_build_mips/uClibc'
...

A patch for this is required.

Regards
Bertram
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-07 00:21  muckbert       New Issue                                    
03-14-07 00:21  muckbert       Status                   new => assigned     
03-14-07 00:21  muckbert       Assigned To               => buildroot       
======================================================================
