From: s.vineeth amalraj <vineeth.laesr@gmail.com>
Date: Mon, 7 May 2018 12:32:39 +0530
Subject: [Buildroot] regarding creating my own customized package in
 buildroot and use it in my OS in Raspberry Pi
Message-ID: <CANMfZMiHNh87+NfnNfYiKpOZGx5uKXwytgF9g2CQhViP5CTfrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sir,

I am Vineeth. I would like to create a simple python package in my
customized os for RPi-3. I could able to see the package name in the make
menuconfig after following the steps below, but when building it says no
file (in my case tamiltest.c) is present and make error is coming.


Kindly help me out with this. Below are the steps which I followed. Thank
you!

1. Created a package (i.e folder) named *"tamil"* under
/home/sands/Documents/vineeth/buildroot-at91/package.
2. Inside *tamil* folder, I created 2 files named *tamil.mk
<http://tamil.mk/>* and *Config.in*

3.Under *Config.in*  the below code is pasted:

*config BR2_PACKAGE_TAMIL*
*       bool "tamil"*
*       help*
*               This is sample tamil package.*
*        https://en.wikipedia.org/wiki/Tamils
<https://en.wikipedia.org/wiki/Tamils>*

4. Next under *tamil.mk <http://tamil.mk/>* file the below code is pasted:

*TAMIL_MODULE_VERSION = 1.0*
*TAMIL_SITE = /home/sands/Documents/vineeth/testtamil.c*
*TAMIL_SITE_METHOD = local*
*TAMIL_LICENSE = GPLv2*
*TAMIL_LICENSE_FILES = COPYING*
*TAMIL_MODULE_MAKE_OPTS = \*
*        CONFIG_DUMMY1= \*
*        CONFIG_DUMMY2=y*

*define KERNEL_MODULE_BUILD_CMDS*
*        $(MAKE) -C '$(@D)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)'
LD='$(TARGET_LD)' modules*
*endef*

*$(eval $(kernel-module))*
*$(eval $(generic-package))*

5.Then in the *buildroot-->package-->Config.in file*, add the below lines (
*Note:* this Config.in is different. this is only used to display our
created package name in the make menuconfig)

*menu "My tamil package"*
*        source "package/tamil/Config.in"*
*endmenu*


6. I created a file named *testtamil.c* and saved in /home/sands/Documents/
vineeth/testtamil.c.  and in the file testtamil.c i have pasted the below
code:

*#include<stdio.h>*
*int main()*
*{*
*printf("tamil is tested\n");*
*printf("working fine");*

*return 1;*
*}*

*Issue:* This is reflecting in *make menuconfig* but not building and
getting make error and below is the error which i faced.

ERROR: /home/sands/Documents/vineeth/testtamil.c does not exist
package/pkg-generic.mk:194: recipe for target '/home/sands/Documents/vineeth
/buildroot-at91/output/build/tamil/.stamp_rsynced' failed
make[1]: *** [/home/sands/Documents/vineeth/buildroot-at91/output/build/tamil/.stamp_rsynced]
Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180507/a04f36c3/attachment.html>
