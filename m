From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:39 -0800
Subject: [Buildroot] [buildroot 0000573]: make[2]: *** No rule to make
	target `|', needed by `../../extra/config/conf.o'.
Message-ID: <b1a10a7a9bcb4380b2f0073e8ef75088@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=573 
====================================================================== 
Reported By:                neelakantan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   573
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2005 23:58 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    make[2]: *** No rule to make target `|', needed by
`../../extra/config/conf.o'.
Description: 
I downloaded the latest buildroot snapshot namely
buildroot-snapshot.tar.bz2.I did a make clean,then make menuconfig and
then a make.

The make fails and it is not downloading the sources properly from the
net.
The make stops with the following error message


12:03:33 (4.48 KB/s) - `/home/neels/temp-20/dl/uClibc-snapshot.tar.bz2'
saved [3333082/3333082]

mkdir -p /home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc
bzcat /home/neels/temp-20/dl/uClibc-snapshot.tar.bz2 | tar -C
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc -xf -
toolchain/patch-kernel.sh
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc
toolchain/uClibc/ \*.patch
touch
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.unpacked
cp toolchain/uClibc/uClibc.config-locale
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/home/neels/cross-tools/bin/arm-linux-uclibc-",g'
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^.*TARGET_arm.*,TARGET_arm=y,g' \
       
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^TARGET_ARCH.*,TARGET_ARCH=\"arm\",g'
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/linux\",g'
\
       
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
       
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
       
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
       
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/bin/sed -i
-e 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.config
mkdir -p
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc_dev/usr/include
mkdir -p
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc_dev/usr/lib
mkdir -p
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc_dev/lib
make -C
/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc \
PREFIX=/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc_dev/
\
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc_dev/
\
HOSTCC="gcc" \
        pregen install_dev;
make[1]: /home/neels/cross-tools/bin/arm-linux-uclibc-gcc: Command not
found
make[1]: Entering directory
`/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc'
make[1]: /home/neels/cross-tools/bin/arm-linux-uclibc-gcc: Command not
found
PBPBmake -C extra/config conf
make[2]: /home/neels/cross-tools/bin/arm-linux-uclibc-gcc: Command not
found
make[2]: Entering directory
`/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/extra/config'
"/home/?make[2]: /home/neels/cross-tools/bin/arm-linux-uclibc-gcc: Command
not found
HBHBmake[2]: *** No rule to make target `|', needed by
`../../extra/config/conf.o'.  Stop.
make[2]: Leaving directory
`/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/extra/config'
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory
`/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc'
make: ***
[/home/neels/temp-20/buildroot/cross_toolchain_build_arm_uclibc/uClibc/.configured]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 psm - 12-01-05 01:42  
---------------------------------------------------------------------- 
make[1]: /home/neels/cross-tools/bin/arm-linux-uclibc-gcc: Command not
found

this is rather your problem
you used uClibc snapshot, but assigned to 0.9.27 

---------------------------------------------------------------------- 
 psm - 12-01-05 01:43  
---------------------------------------------------------------------- 
before make you should either run make pregen of make headers 

---------------------------------------------------------------------- 
 vapier - 12-29-05 03:21  
---------------------------------------------------------------------- 
make sure you have make-3.80 or better 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-05 23:58  neelakantan    New Issue                                    
11-30-05 23:58  neelakantan    Status                   new => assigned     
11-30-05 23:58  neelakantan    Assigned To               => uClibc          
12-01-05 01:42  psm            Note Added: 0000716                          
12-01-05 01:43  psm            Note Added: 0000717                          
12-29-05 03:21  vapier         Note Added: 0000825                          
12-29-05 03:21  vapier         Status                   assigned => closed  
12-29-05 03:21  vapier         Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
