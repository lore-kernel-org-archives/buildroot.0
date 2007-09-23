From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 23 Sep 2007 09:58:21 -0700
Subject: [Buildroot] [buildroot 0001507]: Build fails for ARM920T,
	c++ compiler/gcj build
Message-ID: <1c04a338f9b742c833f117ad7f34d50e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1507 
====================================================================== 
Reported By:                APOLAUF
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1507
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-23-2007 09:56 PDT
Last Modified:              09-23-2007 09:58 PDT
====================================================================== 
Summary:                    Build fails for ARM920T, c++ compiler/gcj build
Description: 
When attempting to build toolchain for ARM920t, with "Build/install c++
compiler and libsdc++" option and "build/install java compiler and
libgcj", the following error shows up no matter what distro I use (Fedora,
Debian, Gentoo, etc.):


)
# Now for the ugly 3.3.x soft float hack... 
#
#
# Ok... that's enough of that. ft
mkdir -p /root/buildroot/project_build_arm/uclibc/root/usr/lib
/root/buildroot/pro ject_build_arm/uclibc/root/usr/sbin
touch /root/buildroot/toolchain_build_arm/gcc-4.2.1-final/.installed 
# These are in /lib, so ...
rm -rf /root/bui
Idroot/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so* 
cp -dpf
/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/libgcc_s*
\
/root/buildroot/project_build_arm/uclibc/root/lib/ 
cp -dpf
/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/libstdc++
/root/buildroot/project_build_arm/uclibc/root/usr/lib/
cp : cannot stat
?/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/l
ibstdc++.so*? : Mo such file or directory
make : ***
[/root/buildroot/toolchain_build_arm/gcc-4.2.1-final/.libs_installed]
Error 1

I must have Java support on my toolchain, and this failure to compile
makes things very frustrating.  I saw something similar on these boards,
with the response being ~"fix your headers.", and stating that Gentoo had
correct headers. I'm using Gentoo, and it's apparently not helping. Please
help. Thanks,
-Adrian
====================================================================== 

---------------------------------------------------------------------- 
 APOLAUF - 09-23-07 09:58  
---------------------------------------------------------------------- 
the "ft" after "#Ok... that's enough of that" is my OCR software
incorrectly identifying the # symbol. I'm running this in a VM, and didn't
feel like piping the output over, so there may be a recognition error or
two. I took care to correct the rest of the output. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-23-07 09:56  APOLAUF        New Issue                                    
09-23-07 09:56  APOLAUF        Status                   new => assigned     
09-23-07 09:56  APOLAUF        Assigned To               => buildroot       
09-23-07 09:58  APOLAUF        Note Added: 0002766                          
======================================================================
