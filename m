From: zhou_c at hoperun.com <zhou_c@hoperun.com>
Date: Thu, 28 Feb 2019 15:32:43 +0800
Subject: [Buildroot] GCC in my pc has been used during my customize package
 building
Message-ID: <201902281532433257768@hoperun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, Fix the mail.

====================================================

Hi all,

I am new guy in buildroot developing, and maybe have some stupid
questions.

I tried to integrate some package in github into buildroot for my
requirements. Just like the following:

??? ################################################################################
??? #
??? # ioc-cbc-tools
??? #
??? ################################################################################
??? IOC_CBC_TOOLS_VERSION = master
??? IOC_CBC_TOOLS_SITE =$(call github,intel,ioc-cbc-tools,$(IOC_CBC_TOOLS_VERSION))
??? IOC_CBC_TOOLS_LICENSE = BSD-3
??? IOC_CBC_TOOLS_LICENSE_FILES = COPYING
???
??? define IOC_CBC_TOOLS_BUILD_CMDS
??? $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
??? endef
???
??? define IOC_CBC_TOOLS_INSTALL_CMDS
??? $(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install
??? endef
???
??? $(eval $(generic-package))

but the makefile in this project just like this:

??? $(OUT_DIR)/cbc_lifecycle: cbc_lifecycle.c
??? gcc -o $@ $(CFLAGS) $(LDFLAGS) cbc_lifecycle.c -pthread -lacrn-mngr
???
??? clean:
??? rm $(OUT_DIR)/cbc_lifecycle

It take "gcc" directly. But there isn't gcc in my "buildroot/output/host/bin".

??? buildroot $ find? output/host/ -name "*gcc"
??? output/host/libexec/gcc
??? output/host/lib/gcc
??? output/host/bin/x86_64-linux-gcc
??? output/host/bin/x86_64-xxx-linux-gnu-gcc

Could anybody give me some hints?

Thanks for any comments.

Thanks,
Jerry


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
