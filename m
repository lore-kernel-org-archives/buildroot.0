From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Oct 2017 22:40:23 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Deselect all unconfigured
 compression options
In-Reply-To: <20171021193848.ca2hamhrfoowntke@xdna.net>
References: <20171019105917.11803-1-camh@xdna.net>
 <20171021181837.GE7022@scaer>
 <20171021193848.ca2hamhrfoowntke@xdna.net>
Message-ID: <20171021204023.GH7022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On 2017-10-22 06:38 +1100, Cam Hutchison spake thusly:
> Yann E. MORIN wrote:
> > On 2017-10-19 21:59 +1100, Cam Hutchison spake thusly:
[--SNIP--]
> > > @@ -252,7 +252,7 @@ endif
> > >  define LINUX_KCONFIG_FIXUP_CMDS
> > >  	$(if $(LINUX_NEEDS_MODULES),
> > >  		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
> > > -	$(call KCONFIG_ENABLE_OPT,$(LINUX_COMPRESSION_OPT_y),$(@D)/.config)
> > > +	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)),$(@D)/.config)
> > I think the strip is not needed, because leading spaces in arguments to
> > a call are anyway stripped.
> Actually, that's not true. I did need the strip, otherwise the var had a
> space in the output.
> 
> The GNU make docs have this to say about $(call):
> 
>     A final caution: be careful when adding whitespace to the arguments
>     to call. As with other functions, any whitespace contained in the
>     second and subsequent arguments is kept; this can cause strange
>     effects. It?s generally safest to remove all extraneous whitespace
>     when providing parameters to call.

Right, I forgot about that one. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
