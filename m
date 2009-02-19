From: theHog <lists@t3i.nl>
Date: Thu, 19 Feb 2009 23:16:38 +0100
Subject: [Buildroot] Building kernel with buildroot fails
Message-ID: <E1LaHCA-0004vD-Qi@tweety.sipo.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build a kernel with buildroot, but the make fails. I need
kernel 2.6.26.6 and a custom patch.

In menuconfig, I've selected the following options:

Kernel/Kernel Type: Advanced configuration
Kernel/Linux Kernel Version: Linux 2.6.26
Kernel/Patches/Add kernel.org patch: yes
Kernel/Patches/Add a kernel.org patch to the Linux Kernel: (Add a '.#' minor
patch)
Kernel/Patches/patch level: 6
Additional patch to apply (from $(DL_DIR)): eddy-2.6.26.6.patch

I've put the 'eddy-2.6.26.6.patch' as a (non-zipped) patch file in the
download dir where all downloaded packages are.

After doing a make, the build process does the following (see output below):
- downloads and unpacks 2.6.26 kernel
- renames the directory to 2.6.26.6 (it does not download and patch with the
2.6.26.6 kernel patch)
- outputs a 'kernelrelease not valid' error
- outputs a 'No rule to make target `eddy-2.6.26.6.patch'' error

What am I doing wrong here?

Thanks,
Richard.

Output of make:
----------------
*** Unpacking kernel source
bzcat /home/eddy/work/packages/linux-2.6.26.tar.bz2 | tar -C
/home/eddy/work/buildroot-2009.02/project_build_arm/eddy   -xf -
# Rename the dir from the downloaded version to the AFTER patch version
mv -f /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26
/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6
echo `/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os -pipe -Os
-I/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/include
-I/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/include
--sysroot=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/ -isysroot
/home/eddy/work/buildroot-2009.02/build_arm/staging_dir -mabi=aapcs-linux
-msoft-float"
INSTALL_MOD_PATH=/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/root
CROSS_COMPILE=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-
LDFLAGS="-L/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/lib
-L/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/usr/lib
--sysroot=/home/eddy/work/buildroot-2009.02/build_arm/staging_dir/"
LZMA="/home/eddy/work/buildroot-2009.02/toolchain_build_arm/bin/lzma"
PATH=/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/u-boot-tools:/home/eddy/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
-C /home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6 -s
kernelrelease` >
/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/.linux-version
Makefile:1510: *** kernelrelease not valid - run 'make prepare' to update it.
 Stop.
touch
/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6/.unpacked
make: *** No rule to make target `eddy-2.6.26.6.patch', needed by
`/home/eddy/work/buildroot-2009.02/project_build_arm/eddy/linux-2.6.26.6/.patched'.
 Stop.
