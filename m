From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 13 Oct 2013 17:02:17 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <20131013145124.GA16563@free.fr>
References: <525AAE63.3060601@gmail.com> <20131013145124.GA16563@free.fr>
Message-ID: <525AB5F9.8090907@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/10/2013 16:51, Yann E. MORIN ha scritto:
> You're missing INSTALL_MOD_PATH=$(TARGET_DIR) on this command line 
> (the make line for 'MYKMOD_INSTALL_TARGET_CMDS' ). Regards, Yann E. 
> MORIN. 

Yann,
thank you for your quick answer. I changed the command line (in 
sensoray2253/sensoray2253.mk) in this way:

define SENSORAY2253_INSTALL_TARGET_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) 
INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef

Is it correct?
Mark
