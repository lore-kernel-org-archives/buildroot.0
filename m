From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 13 Oct 2013 17:19:12 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <20131013170541.398d8907@skate>
References: <525AAE63.3060601@gmail.com>	<20131013145124.GA16563@free.fr>	<525AB5F9.8090907@gmail.com>
 <20131013170541.398d8907@skate>
Message-ID: <525AB9F0.3020708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/10/2013 17:05, Thomas Petazzoni ha scritto:
> Macro, can you post your current package (.mk file and Config.in files,
> or even better, a patch against Buildroot), so that we can potentially
> reproduce your issue and help you solve it?


Thomas,
I don't know how to post a patch against Buildroot (please, may you 
provide a link where is explained how to?) but I can post here the 
content of the two files for sure:

Config.in
config BR2_PACKAGE_SENSORAY2253
     bool "sensoray2253"
     depends on BR2_LINUX_KERNEL
     help
       Kernel module for Sensoray 2253

       http://it.sensoray.com/products/2253.htm


sensoray2253.mk
################################################################################
#
# sensoray2253
#
################################################################################

SENSORAY2253_VERSION = 1.2.6
SENSORAY2253_SOURCE = sdk_x53_linux_$(SENSORAY2253_VERSION).tar.bz2
SENSORAY2253_SITE = http://it.sensoray.com/downloads/
SENSORAY2253_DEPENDENCIES = linux

define SENSORAY2253_BUILD_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define SENSORAY2253_INSTALL_TARGET_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))
