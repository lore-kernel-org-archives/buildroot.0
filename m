From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Mar 2012 22:30:28 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal
 compliance info
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <4F57D374.3040208@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

for the lazy, here's how the output produced by 'make legal-info' looks 
like.
It is the result of the legal_info_test_defconfig supplied in the last 
patch,
generated fir an out-of-tree BR build (cool, looks like it works!).

$ make legal-info
...
WARNING: The Buildroot source code has not be saved
WARNING: The toolchain has not be saved
WARNING: freetype: cannot save license (FREETYPE_LICENSE_FILES not defined)
WARNING: iostat: cannot save license (IOSTAT_LICENSE_FILES not defined)
WARNING: jpeg: cannot save license (JPEG_LICENSE_FILES not defined)
...
WARNING: binutils: cannot save license (BINUTILS_LICENSE_FILES not defined)
WARNING: autoconf: cannot save license (AUTOCONF_LICENSE_FILES not defined)
WARNING: automake: cannot save license (AUTOMAKE_LICENSE_FILES not defined)
...
Legal info produced in /home/murray/devel/test-legal1/legal-info

$ ls -F legal-info/
buildroot.config  licenses/  licenses.txt  manifest.csv  README  sources/

$ cat legal-info/README
Most of the packages that were used by Buildroot to produce the image files,
including Buildroot itself, have open-source licenses. It is your
responsibility to comply to the requirements of these licenses.
To make this easier for you, Buildroot collected in this directory some
material you may need to get it done.

This material is composed of the following items.
  * The scripts used to control compilation of the packages and the 
generation
    of image files, i.e. the Buildroot sources.
    Note: this has not be saved due to technical limitations, you must 
collect
    it manually.
  * The Buildroot configuration file; this has been saved in 
buildroot.config.
  * The toolchain (cross-compiler and related tools) used to generate 
all the
    compiled programs.
    Note: this has not be saved due to technical limitations, you must 
collect
    it manually.
  * The source code for all packages; this has been saved in the sources/
    subdirectory (except for the proprietary packages, which have not been
    saved); patches applied to some packages by Buildroot are included 
in the
    Buildroot sources and were not duplicated in the sources/ subdirectory.
  * A manifest file listing the configured packages and related information;
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.

Due to technical limitations or lack of license definition in the package
makefile, some of the material listed above could not been saved, as the
following list details.

WARNING: The Buildroot source code has not be saved
WARNING: The toolchain has not be saved
WARNING: freetype: cannot save license (FREETYPE_LICENSE_FILES not defined)
WARNING: iostat: cannot save license (IOSTAT_LICENSE_FILES not defined)
WARNING: jpeg: cannot save license (JPEG_LICENSE_FILES not defined)
...
WARNING: Cannot produce any legal info for package ttcp
WARNING: Cannot produce any legal info for package uemacs
...

$ cat legal-info/manifest.csv
package,version,license,license files,source archive
buildroot,2012.05-git,GPLv2,COPYING,not saved
berkeleydb,4.4.20,Sleepycat License,LICENSE,db-4.4.20.NC.tar.gz
busybox,1.19.4,GPLv2-ONLY,LICENSE,busybox-1.19.4.tar.bz2
bzip2,1.0.5,BSD-like,LICENSE,bzip2-1.0.5.tar.gz
directfb,1.4.15,LGPLv2.1,COPYING,DirectFB-1.4.15.tar.gz
foobar,1.2.3.4,PROPRIETARY,not saved,not saved
freetype,2.4.8,unknown,not saved,freetype-2.4.8.tar.bz2
...

$ cat legal-info/licenses.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      buildroot: COPYING file
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


             GNU GENERAL PUBLIC LICENSE
                Version 2, June 1991

  Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA


...

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      binutils: unknown license file(s)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      autoconf: unknown license file(s)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


$ head legal-info/buildroot.config
#
# Automatically generated make config: don't edit
# Buildroot 2012.05-git Configuration
#
BR2_HAVE_DOT_CONFIG=y
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_bfin is not set
BR2_i386=y

$ ls -F legal-info/sources/
alsa-lib-1.0.24.1.tar.bz2  libtool-2.2.10.tar.gz
autoconf-2.65.tar.bz2      libusb-1.0.8.tar.bz2
automake-1.11.1.tar.bz2    libusb-compat-0.1.3.tar.bz2
binutils-2.21.1.tar.bz2    linux-3.2.6.tar.bz2
busybox-1.19.4.tar.bz2     lzo-2.06.tar.gz
bzip2-1.0.5.tar.gz         lzop-1.03.tar.gz
...

$ find legal-info/licenses -type f
legal-info/licenses/tslib/COPYING
legal-info/licenses/linux/COPYING
legal-info/licenses/berkeleydb/LICENSE
legal-info/licenses/libusb/COPYING
legal-info/licenses/directfb/COPYING
legal-info/licenses/pcre/LICENCE
...

Luca
