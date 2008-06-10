From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 9 Jun 2008 22:14:15 -0700
Subject: [Buildroot] [buildroot 0003684]: Unable to generate jffs2 file
	system
Message-ID: <85f1eca519e479fdcf6f2c18da1e6050@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3684 
====================================================================== 
Reported By:                nataraj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3684
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-09-2008 22:14 PDT
Last Modified:              06-09-2008 22:14 PDT
====================================================================== 
Summary:                    Unable to generate jffs2 file system
Description: 
The compilation stops at the following giving errors.

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
C compiler version '4.2.4':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.4':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/kodi/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/kodi/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/home/kodi/buildroot/project_build_arm/uclibc/buildroot-config
rm -rf /home/kodi/buildroot/project_build_arm/uclibc/root/usr/include
find /home/kodi/buildroot/project_build_arm/uclibc/root/usr/lib -name
'*.a' -delete 
find /home/kodi/buildroot/project_build_arm/uclibc/root/lib -name '*.a'
-delete 
find /home/kodi/buildroot/project_build_arm/uclibc/root/usr/lib -name
'*.la' -delete 
find /home/kodi/buildroot/project_build_arm/uclibc/root/lib -name '*.la'
-delete 
CC="/usr/bin/gcc" CROSS=
CFLAGS=-I/home/kodi/buildroot/toolchain_build_arm/linux/include \
                /usr/bin/make -j1 LINUXDIR= \
                BUILDDIR=/home/kodi/buildroot/toolchain_build_arm/mtd_orig
\
                -C /home/kodi/buildroot/toolchain_build_arm/mtd_orig
mkfs.jffs2
make[1]: Entering directory
`/home/kodi/buildroot/toolchain_build_arm/mtd_orig'
mkdir -p /home/kodi/buildroot/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o
/home/kodi/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2.o
mkfs.jffs2.c -g -Wp,-MD    
,/home/kodi/buildroot/toolchain_build_arm/mtd_orig/.mkfs.jffs2.c.dep
mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
mkfs.jffs2.c: In function ???formalize_posix_acl???:
mkfs.jffs2.c:1084: error: ???ACL_USER_OBJ??? undeclared (first use in this
function)
mkfs.jffs2.c:1084: error: (Each undeclared identifier is reported only
once
mkfs.jffs2.c:1084: error: for each function it appears in.)
mkfs.jffs2.c:1085: error: ???ACL_GROUP_OBJ??? undeclared (first use in
this function)
mkfs.jffs2.c:1086: error: ???ACL_MASK??? undeclared (first use in this
function)
mkfs.jffs2.c:1087: error: ???ACL_OTHER??? undeclared (first use in this
function)
mkfs.jffs2.c:1093: error: ???ACL_USER??? undeclared (first use in this
function)

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-09-08 22:14  nataraj        New Issue                                    
06-09-08 22:14  nataraj        Status                   new => assigned     
06-09-08 22:14  nataraj        Assigned To               => buildroot       
======================================================================
