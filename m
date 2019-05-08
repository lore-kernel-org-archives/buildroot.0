From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 May 2019 16:31:27 +0200
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
In-Reply-To: <CY4PR1201MB012025B382EBDE4883CA80B8A1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190418093902.41835-1-abrodkin@synopsys.com>
 <20190418114336.61f3f404@windsurf>
 <ea5f11a1-a7cb-4cee-dfda-64d55d550d83@mind.be>
 <CY4PR1201MB01207D3F0C5E488EACEBA5DAA13E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <ed9e89cc-3f7e-1a05-0d1e-6c6da6a3eb38@mind.be>
 <20190427175603.GA27252@scaer>
 <CY4PR1201MB012025B382EBDE4883CA80B8A1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20190508143127.GD31209@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-05-08 13:19 +0000, Alexey Brodkin spake thusly:
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E. MORIN
[--SNIP--]
> > I'm not too fond of this, but what about the following:
> > 
> > diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> > new file mode 100644
> > index 0000000000..83503841b6
> > --- /dev/null
> > +++ b/arch/arch.mk.arc
> > @@ -0,0 +1,3 @@
> > +ifeq ($(BR2_arcle),y)
> > +ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> > +endif
> > diff --git a/toolchain/toolchain-wrapper.mk
> > b/toolchain/toolchain-wrapper.mk
> > index ca66fa7ba4..8f872506ec 100644
> > --- a/toolchain/toolchain-wrapper.mk
> > +++ b/toolchain/toolchain-wrapper.mk
> > @@ -17,6 +17,7 @@ TOOLCHAIN_WRAPPER_ARGS =
> > $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
> >  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
> > 
> >  TOOLCHAIN_WRAPPER_OPTS = \
> > +   $(ARCH_TOOLCHAIN_WRAPPER_OPTS) \
> >     $(call qstrip,$(BR2_SSP_OPTION)) \
> >     $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> 
> That looks good to me with only one change: prefer generic "BR2_arc"
> instead of little-endian only "BR2_arcle".

Yes, of course, it was just a quicky to demo what I was thinking...

> Care to send-out a patch?

Aw... But *you* are the arc guy! ;-)

OK, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
