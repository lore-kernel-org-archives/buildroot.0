From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:15 -0800
Subject: [Buildroot] [buildroot 0001112]: Buildroot fails
Message-ID: <b6cc6c1dccb95e2480f70eec8479938b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1112 
====================================================================== 
Reported By:                dash
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1112
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2006 12:39 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Buildroot fails
Description: 
This shouldn't come as any surprise, buildroot *never* works, it always
fails one way or another, every time I've tried to build a cross
compiler.

This time I pulled down latest SVN
Revision: 16856

Here's the .config:
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_OABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_2_6_19=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.19"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_16_91_0_7=y
BR2_BINUTILS_VERSION="2.16.91.0.7"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_3_4_2=y
BR2_GCC_VERSION="3.4.2"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_CCACHE=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_SNAPSHOT=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
BR2_PACKAGE_HDPARM=y
BR2_PACKAGE_SUDO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_COPYTO=""

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-21-06 03:44  
---------------------------------------------------------------------- 
linux-2.6.19.1, BR2_BINUTILS_VERSION_2_16_91_0_7=y and gcc-3.4.6 work for
me with your .config and revision 17027 (will checkin in an hour or so).

Please confirm. 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 09:51  
---------------------------------------------------------------------- 
Works with somewhat current packages, so closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-06 12:39  dash           New Issue                                    
12-12-06 12:39  dash           Status                   new => assigned     
12-12-06 12:39  dash           Assigned To               => uClibc          
12-21-06 03:44  bernhardf      Note Added: 0001899                          
01-09-07 05:14  stephaneC      Issue Monitored: stephaneC                    
01-19-07 09:51  bernhardf      Status                   assigned => closed  
01-19-07 09:51  bernhardf      Note Added: 0002003                          
01-19-07 09:51  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
