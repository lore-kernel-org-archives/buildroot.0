From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:31:31 +0200
Subject: [Buildroot] [PATCH 05/11] package/ktap: use kernel-module helper
In-Reply-To: <20150608232559.743f42e6@free-electrons.com>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <b83c94f8a4484928bd45a9b4ed55c6c7d9f2751c.1433628825.git.yann.morin.1998@free.fr>
 <20150608232559.743f42e6@free-electrons.com>
Message-ID: <20150608213131.GD3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-08 23:25 +0200, Thomas Petazzoni spake thusly:
> On Sun,  7 Jun 2015 00:20:41 +0200, Yann E. MORIN wrote:
> >  define KTAP_BUILD_CMDS
> >  	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(KTAP_FLAGS) ktap
> > -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) mod
> >  endef
> >  
> >  define KTAP_INSTALL_TARGET_CMDS
> >  	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
> > -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) modules_install
> >  endef
> 
> I think you are effectively getting rid of the KERNEL_SRC definition
> here. Did you test that it was working OK without this variable?

Well, it does build a kernel module, yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
