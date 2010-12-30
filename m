From: olyvine.chen at logiways.com.cn <olyvine.chen@logiways.com.cn>
Date: Thu, 30 Dec 2010 16:30:37 +0800
Subject: [Buildroot] libwvdial compile error
Message-ID: <1293697837.12063.15.camel@olyvine-desktop.logiways-sz.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all, 

I have run into an error when build wvdial, which can describe as below:

-1 error message:
############################################################################################################
>>> wvdial 1.61 Building
* Generating CC
* Generating CXX
linking
wvdial.../home/likewise-open/LOGIWAYS-SZ/ochen/prj/stlinux/roadmap_3G_work/SDK7105_TER_DVR_LINUX_debug/mgl_ei/buildroot/sh4/bin/sh4-linux-g++ -L/home/likewise-open/LOGIWAYS-SZ/ochen/prj/stlinux/roadmap_3G_work/SDK7105_TER_DVR_LINUX_debug/staging/usr/lib -L/home/likewise-open/LOGIWAYS-SZ/ochen/prj/stlinux/roadmap_3G_work/SDK7105_TER_DVR_LINUX_debug/staging/lib -L -ggdb -luniconf -lwvstreams -lwvutils -lwvbase -o wvdial wvdial.o wvdial.a -lwvstreams -lwvutils -lwvbase
/opt/STM/STLinux-LW/devkit/sh4/bin/../lib/gcc/sh4-linux/4.2.4/../../../../sh4-linux/bin/ld: skipping incompatible /lib/ld-linux.so.2 when searching for /lib/ld-linux.so.2
/opt/STM/STLinux-LW/devkit/sh4/bin/../lib/gcc/sh4-linux/4.2.4/../../../../sh4-linux/bin/ld: cannot find /lib/ld-linux.so.2
collect2: ld returned 1 exit status
make[3]: *** [wvdial] Error 1
make[2]: ***
[/home/likewise-open/LOGIWAYS-SZ/ochen/prj/stlinux/roadmap_3G_work/SDK7105_TER_DVR_LINUX_debug/mgl_ei/buildroot/output/build/wvdial-1.61/.stamp_built] Error 2
make[1]: *** [buildroot] Error 2
make: *** [buildroot] Error 2
############################################################################################################

-2 wvdial.mk
############################################################################################################
WVDIAL_VERSION = 1.61
WVDIAL_SOURCE = wvdial-$(WVDIAL_VERSION).tar.gz
WVDIAL_SITE = http://wvstreams.googlecode.com/files/
WVDIAL_INSTALL_STAGING = YES
WVDIAL_INSTALL_TARGET = YES
WVDIAL_DEPENDENCIES = wvstreams pppd
WVDIAL_CONF_OPT = CXX=$(TARGET_CXX)
WVDIAL_MAKE_OPT = CXX=$(TARGET_CXX)
WVDIAL_MAKE_OPT += EXTRACPPFLAGS=" -I
$(STAGING_DIR)/usr/include/wvstreams"
WVDIAL_MAKE_OPT += EXTRALDFLAGS=" -L$(STAGING_DIR)/usr/lib -L
$(STAGING_DIR)/lib"

$(eval $(call AUTOTARGETS,package,wvdial))
############################################################################################################
PS: the varible EXTRACPPFLAGS and EXTRALDFLAGS is defined by myself to
pass to the compiler and linker.

-3 my question is:
ld-linux.so.2 is lie in $(STAGING_DIR)/lib, and obviously I have passed
it to the linker, why does it find ld-linux.so.2 from /lib , not from
$(STAGING_DIR)/lib ?

Any help would be appreciated.

Thanks and Best regards!
Olyvine
