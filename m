From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 6 Apr 2008 14:28:48 -0700
Subject: [Buildroot] [buildroot 0002864]: Java compiler and libgcj build
	fails (arm-iwmmxt-eabi)
Message-ID: <df3eaaf350fe226f6d324e44d6a1aef9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2864 
====================================================================== 
Reported By:                Francesco
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2864
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-06-2008 14:28 PDT
Last Modified:              04-06-2008 14:28 PDT
====================================================================== 
Summary:                    Java compiler and libgcj build fails
(arm-iwmmxt-eabi)
Description: 
I get this error while trying to compile libgcj and java compiler for
arm-iwmmxt-eabi:

#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
mkdir -p /root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/sbin
touch /root/tmp/buildroot/toolchain_build_arm/gcc-4.2.3-final/.installed
# These are in /lib, so...
rm -rf
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf
root/tmp/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libgcc_s*
\
                /root/tmp/buildroot/project_build_arm/uclibc/root/lib/
cp -dpf
/root/tmp/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libstdc++.so*
\
               
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib/
cp -dpf /root/tmp/buildroot/build_arm/staging_dir/lib/libgcj.so*
/root/tmp/buildroot/project_build_arm/uclibc/root/lib/
cp: cannot stat
`/root/tmp/buildroot/build_arm/staging_dir/lib/libgcj.so*': No such file
or directory
make: ***
[/root/tmp/buildroot/toolchain_build_arm/gcc-4.2.3-final/.libs_installed]
Error 1



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-06-08 14:28  Francesco      New Issue                                    
04-06-08 14:28  Francesco      Status                   new => assigned     
04-06-08 14:28  Francesco      Assigned To               => buildroot       
04-06-08 14:28  Francesco      File Added: .config                          
======================================================================
