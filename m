From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 17:05:41 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <525AB5F9.8090907@gmail.com>
References: <525AAE63.3060601@gmail.com> <20131013145124.GA16563@free.fr>
 <525AB5F9.8090907@gmail.com>
Message-ID: <20131013170541.398d8907@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sun, 13 Oct 2013 17:02:17 +0200, Marco Trapanese wrote:
> Il 13/10/2013 16:51, Yann E. MORIN ha scritto:
> > You're missing INSTALL_MOD_PATH=$(TARGET_DIR) on this command line 
> > (the make line for 'MYKMOD_INSTALL_TARGET_CMDS' ). Regards, Yann E. 
> > MORIN. 
> 
> Yann,
> thank you for your quick answer. I changed the command line (in 
> sensoray2253/sensoray2253.mk) in this way:
> 
> define SENSORAY2253_INSTALL_TARGET_CMDS
>      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) 
> INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> endef
> 
> Is it correct?

Adding INSTALL_MOD_PATH should normally not be necessary, since
LINUX_MAKE_FLAGS already contains INSTALL_MOD_PATH.

From linux/linux.mk:

LINUX_MAKE_FLAGS = \
        HOSTCC="$(HOSTCC)" \
        HOSTCFLAGS="$(HOSTCFLAGS)" \
        ARCH=$(KERNEL_ARCH) \
        INSTALL_MOD_PATH=$(TARGET_DIR) \
        CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
        DEPMOD=$(HOST_DIR)/sbin/depmod

Macro, can you post your current package (.mk file and Config.in files,
or even better, a patch against Buildroot), so that we can potentially
reproduce your issue and help you solve it?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
