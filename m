From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Apr 2019 22:01:00 +0200
Subject: [Buildroot] [PATCH 1/1] linux: use host pkg-config when host
 libelf is set
In-Reply-To: <899a55d6cfd3f183da8053082c645342242c9bdd.camel@intel.com>
References: <20190405184712.5582-1-stuart.summers@intel.com>
 <20190408184233.10697-1-stuart.summers@intel.com>
 <20190408192840.GB23890@scaer>
 <899a55d6cfd3f183da8053082c645342242c9bdd.camel@intel.com>
Message-ID: <20190408200100.GC23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stuart, All,

On 2019-04-08 19:41 +0000, Summers, Stuart spake thusly:
> On Mon, 2019-04-08 at 21:28 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > >  $(2)_CONFIGURATOR_MAKE_ENV = \
> > > -	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=%
> > > PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
> > > +	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
> > > +	   PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=%
> > > PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
> > > +	   PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
> > 
> > I'm not too happy abfor the poout the look the above has, but I have
> > no better
> > formatting suggestion to provide...
> Yeah, I agree it looks ugly.. If you have suggestions, I'm happy to
> take a look.

No, I ahve no better suggestion, really, hence I gave my:

> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thanks for the review and the time here!
> 
> Given this is my first patch, I'm not sure I have push rights. Can you
> help with merging? Also, would you like a re-post with the commit
> message recommendations above?

When one of the three maintainer have time, they'll pick up that patch
and apply; it's not going to be forgotten: all patches are tracked on
patchwork:
    https://patchwork.ozlabs.org/project/buildroot/list/

The committer can probably apply the tweaks I suggested when they apply,
so no need to respin unless requested, now.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
