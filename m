From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 23 Nov 2011 16:43:19 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><20111122230429.2bef52c2@skate><005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98><20111122232914.76a86e7d@skate><006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
Message-ID: <001701ccaa31$4c9081c0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to the previous email (about LIBFOO) I followed the instructions
for making a package subdirectory (I called it EtherCAT), made a Config.in
file for it, added 'source "package/EtherCAT/Config.in"' to
package/Config.in and made the EtherCAT.mk file.

I then ran 'make menuconfig' again and selected ethercat.  Now when I
'make', I get this error.  I will post the Config.in and EtherCAT.mk below.

user1 at linux-0mmn:~/buildroot-2011.05> make
/usr/bin/make -j2  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig
make[1]: Entering directory `/home/user1/buildroot-2011.05'
KCONFIG_AUTOCONFIG=/home/user1/buildroot-2011.05/output/build/buildroot-conf
ig/auto.conf
KCONFIG_AUTOHEADER=/home/user1/buildroot-2011.05/output/build/buildroot-conf
ig/autoconf.h
KCONFIG_TRISTATE=/home/user1/buildroot-2011.05/output/build/buildroot-config
/tristate.config BUILDROOT_CONFIG=/home/user1/buildroot-2011.05/.config
/home/user1/buildroot-2011.05/output/build/buildroot-config/conf
--silentoldconfig Config.in
#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
make[1]: Leaving directory `/home/user1/buildroot-2011.05'
>>> ethercat 1.0 Downloading
/home/user1/Desktop/EtherCAT4Atmel/etherlabmaster-4adb56c4198d.tar.bz2:
Scheme missing.
>>> ethercat 1.0 Extracting
bzcat: Can't open input file
/home/user1/buildroot-2011.05/dl/etherlabmaster-4adb56c4198d.tar.bz2: No
such file or directory.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make: ***
[/home/user1/buildroot-2011.05/output/build/ethercat-1.0/.stamp_extracted]
Error 2
user1 at linux-0mmn:~/buildroot-2011.05>

The code originally came in as a .bz2 file.  I unzipped it into a .tar file,
then extracted it.  I then used the .tar file to convert it back to bz2
using bzip2 shell command.  Now it is not recognized?  I get the same type
of error if I put it back as a tar file and use gzip to make a .gz
extension.

Thoughts?

Here are the files:

Config.in
--------------------------------------------------------
config BR2_PACKAGE_ETHERCAT
	bool "ethercat"
	help
	  Tries to build EtherCAT into the Linux image.





EtherCAT.mk
----------------------------------------------------------
#############################################################
#
# EtherCAT
#
#############################################################
ETHERCAT_VERSION = 1.0
ETHERCAT_SOURCE = etherlabmaster-4adb56c4198d.tar.gz
ETHERCAT_SITE = /home/user1/Desktop/EtherCAT4Atmel
ETHERCAT_INSTALL_STAGING = YES
ETHERCAT_INSTALL_TARGET = YES
ETHERCAT_CONF_OPT = --enable-generic
#####LIBFOO_DEPENDENCIES = libglib2 host-pkg-config

$(eval $(call AUTOTARGETS,package,ethercat))



-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Jeff Krasky
Sent: Wednesday, November 23, 2011 3:39 PM
To: buildroot at busybox.net
Subject: [Buildroot] LIBFOO_SITE in .mk file

According to the documentation for making the .mk file
(http://buildroot.uclibc.org/buildroot.html#autotools-tutorial), what is the
syntax for specifying a local (hard drive location) of the .bz2 file?

LIBFOO_SITE = http://www.foosoftware.org/download

Is the example given.  Can I just do something like

LIBFOO_SITE = /home/libfoo.tar.bz2
?

Thanks.
