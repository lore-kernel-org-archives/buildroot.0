From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 19 Oct 2008 03:38:57 -0700
Subject: [Buildroot] [buildroot 0005564]: Removing initramfs has not
	complete support
Message-ID: <85f282868bd2414287b62d423ce052d8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5564 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5564
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-19-2008 03:38 PDT
Last Modified:              10-19-2008 03:38 PDT
====================================================================== 
Summary:                    Removing initramfs has not complete support
Description: 
After initramfs has been enabled (BR2_TARGET_ROOTFS_INITRAMFS=y) 'make'
recompile the entire kernel properly. Deletion of binaries/$project does
not hurt anything because 'make' redo all files in that directory. 

After initramfs has been disabled (# BR2_TARGET_ROOTFS_INITRAMFS is not
set) clear the binaries/$project directory still does not hurt because
there will be no any kernel recompilation until 'make linux26-menuconfig'
take place and then:

/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
CFLAGS_KERNEL="-Os
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
INSTALL_MOD_PATH=/home/roberto/gles/buildroot/project_build_i586/ugles/root
CROSS_COMPILE=/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-
LDFLAGS="-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/"
LZMA="/home/roberto/gles/buildroot/toolchain_build_i586/bin/lzma" -C
/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7
prepare
make[1]: Entering directory
`/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7'
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
make[1]: Leaving directory
`/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7'
touch
/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7/.depend_done
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=i386
CFLAGS_KERNEL="-Os
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
INSTALL_MOD_PATH=/home/roberto/gles/buildroot/project_build_i586/ugles/root
CROSS_COMPILE=/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-
LDFLAGS="-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/"
LZMA="/home/roberto/gles/buildroot/toolchain_build_i586/bin/lzma" \
		-C /home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7
bzImage
make[1]: Entering directory
`/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7'
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  CHK     include/linux/compile.h
 
/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7/scripts/gen_initramfs_list.sh:
Cannot open
'/home/roberto/gles/buildroot/binaries/ugles/rootfs.i586.initramfs_list'
make[2]: *** [usr/initramfs_data.cpio.gz] Error 1
make[1]: *** [usr] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7'
make: ***
[/home/roberto/gles/buildroot/project_build_i586/ugles/linux-2.6.21.7/arch/i386/boot/bzImage]
Error 2



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-08 03:38  robang74       New Issue                                    
10-19-08 03:38  robang74       Status                   new => assigned     
10-19-08 03:38  robang74       Assigned To               => buildroot       
======================================================================
