From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2013 17:57:51 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <20131013170541.398d8907@skate>
References: <525AAE63.3060601@gmail.com> <20131013145124.GA16563@free.fr>
 <525AB5F9.8090907@gmail.com> <20131013170541.398d8907@skate>
Message-ID: <20131013155751.GC16563@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-13 17:05 +0200, Thomas Petazzoni spake thusly:
> Dear Marco Trapanese,
> 
> On Sun, 13 Oct 2013 17:02:17 +0200, Marco Trapanese wrote:
> > Il 13/10/2013 16:51, Yann E. MORIN ha scritto:
> > > You're missing INSTALL_MOD_PATH=$(TARGET_DIR) on this command line 
> > > (the make line for 'MYKMOD_INSTALL_TARGET_CMDS' ). Regards, Yann E. 
> > > MORIN. 
> > 
> > Yann,
> > thank you for your quick answer. I changed the command line (in 
> > sensoray2253/sensoray2253.mk) in this way:
> > 
> > define SENSORAY2253_INSTALL_TARGET_CMDS
> >      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) 
> > INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> > endef
> > 
> > Is it correct?
> 
> Adding INSTALL_MOD_PATH should normally not be necessary, since
> LINUX_MAKE_FLAGS already contains INSTALL_MOD_PATH.
> 
> From linux/linux.mk:
> 
> LINUX_MAKE_FLAGS = \
>         HOSTCC="$(HOSTCC)" \
>         HOSTCFLAGS="$(HOSTCFLAGS)" \
>         ARCH=$(KERNEL_ARCH) \
>         INSTALL_MOD_PATH=$(TARGET_DIR) \
>         CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
>         DEPMOD=$(HOST_DIR)/sbin/depmod

We should document these variables: the list (to have the names of the
variables), their purpose, and their values.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
