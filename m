From: paradoxxa <paradoxxa2001@web.de>
Date: Thu, 20 Mar 2008 01:00:45 -0700 (PDT)
Subject: [Buildroot] build for ARM926EJ-S fails with kernel-patches-2.6.24
Message-ID: <16119611.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The logs:


Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.3':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.3':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/paradoxxa/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/paradoxxa/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/home/paradoxxa/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc
echo "" > /home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc/issue
echo "" >> /home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc/issue
echo "Welcome to the Erik's uClibc development environment." >>
/home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc/issue
mkdir -p /home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc
echo "uclibc" >
/home/paradoxxa/buildroot/project_build_arm/uclibc/root/etc/hostname
toolchain/patch-kernel.sh
/home/paradoxxa/buildroot/project_build_arm/uclibc/linux-2.6.24
toolchain/kernel-headers \
                linux-2.6.24-\*.patch{,.gz,.bz2}
toolchain/patch-kernel.sh
/home/paradoxxa/buildroot/project_build_arm/uclibc/linux-2.6.24
/kernel-patches-2.6.24/ linux-2.6.24-\*.patch ; 
Aborting.  '/kernel-patches-2.6.24/' is not a directory.
make: ***
[/home/paradoxxa/buildroot/project_build_arm/uclibc/linux-2.6.24/.patched]
error 1

Have somebody an idea to fix this?

-- 
View this message in context: http://www.nabble.com/build-for-ARM926EJ-S-fails-with-kernel-patches-2.6.24-tp16119611p16119611.html
Sent from the BuildRoot mailing list archive at Nabble.com.
