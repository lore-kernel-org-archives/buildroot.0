From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2013 23:12:06 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <525AB9F0.3020708@gmail.com>
References: <525AAE63.3060601@gmail.com>	<20131013145124.GA16563@free.fr>	<525AB5F9.8090907@gmail.com>
 <20131013170541.398d8907@skate> <525AB9F0.3020708@gmail.com>
Message-ID: <525B0CA6.6000103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/13 17:19, Marco Trapanese wrote:
> Il 13/10/2013 17:05, Thomas Petazzoni ha scritto:
>> Macro, can you post your current package (.mk file and Config.in files,
>> or even better, a patch against Buildroot), so that we can potentially
>> reproduce your issue and help you solve it?
>
>
> Thomas,
> I don't know how to post a patch against Buildroot (please, may you
> provide a link where is explained how to?) but I can post here the
> content of the two files for sure:
>
> Config.in
> config BR2_PACKAGE_SENSORAY2253
>      bool "sensoray2253"
>      depends on BR2_LINUX_KERNEL
>      help
>        Kernel module for Sensoray 2253
>
>        http://it.sensoray.com/products/2253.htm
>
>
> sensoray2253.mk
> ################################################################################
>
> #
> # sensoray2253
> #
> ################################################################################
>
>
> SENSORAY2253_VERSION = 1.2.6
> SENSORAY2253_SOURCE = sdk_x53_linux_$(SENSORAY2253_VERSION).tar.bz2
> SENSORAY2253_SITE = http://it.sensoray.com/downloads/
> SENSORAY2253_DEPENDENCIES = linux
>
> define SENSORAY2253_BUILD_CMDS
>      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules

  The module is in the driver directory, so I guess this should be 
M=$(@D)/driver

  Regards,
  Arnout

> endef
>
> define SENSORAY2253_INSTALL_TARGET_CMDS
>      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
> endef
>
> $(eval $(generic-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
