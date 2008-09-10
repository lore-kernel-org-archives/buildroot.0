From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 10 Sep 2008 00:30:13 -0700
Subject: [Buildroot] [buildroot 0004384]: GCC 4.3.1 fails with cannot
	compute suffix of object files
Message-ID: <862f24f6d8118f7b54d2d9781b120fab@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4384 
====================================================================== 
Reported By:                kreuters
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4384
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-31-2008 04:57 PDT
Last Modified:              09-10-2008 00:30 PDT
====================================================================== 
Summary:                    GCC 4.3.1 fails with cannot compute suffix of object
files
Description: 
from buildroot-20080731.tar.bz, only things selected are gcc 4.3.1 and
EABI.


checking for arm-linux-uclibcgnueabi-gcc... 
/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/xgcc
-B/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/include
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/sys-include

checking for suffix of object files... configure: error: cannot compute
suffix of object files: cannot compile

====================================================================== 

---------------------------------------------------------------------- 
 antezedens - 09-10-08 00:30  
---------------------------------------------------------------------- 
For those eager to get gcc-4.3.1 running. I've found out that gcc does not
find the shared objects of two libs. The attached patch points gcc to the
right directories. It is just a quick fix but it should do until there is
an official bugfix. This is what to do:

make   <= will stop with the above error

cd buildroot/toolchain_build_ARCH

patch -p2 < gcc-4.3.1-compile.patch
rm -Rf gcc-4.3.1-initial

make   <= should compile 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-31-08 04:57  kreuters       New Issue                                    
07-31-08 04:57  kreuters       Status                   new => assigned     
07-31-08 04:57  kreuters       Assigned To               => buildroot       
09-03-08 09:05  haizaar        Issue Monitored: haizaar                     
09-10-08 00:29  antezedens     File Added: gcc-4.3.1-compile.patch              
     
09-10-08 00:30  antezedens     Note Added: 0011294                          
======================================================================
