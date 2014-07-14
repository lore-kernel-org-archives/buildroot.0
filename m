From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 16:40:56 +0200
Subject: [Buildroot] [PATCH 3 of 6] uclibc: replace custom kconfig
 helpers with those provided by pkg-utils
In-Reply-To: <CAAXf6LUrfRoSRiyZt_wm7xwrj82UhL7eX6a=jmu33KRF=Z1Z9w@mail.gmail.com>
References: <patchbomb.1405338624@localhost>
 <0b5a6fcf97ef3323869c.1405338627@localhost>
 <20140714143643.GJ3684@free.fr>
 <CAAXf6LUrfRoSRiyZt_wm7xwrj82UhL7eX6a=jmu33KRF=Z1Z9w@mail.gmail.com>
Message-ID: <20140714144056.GL3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-14 16:39 +0200, Thomas De Schampheleire spake thusly:
> Hi Yann,
> 
> On Mon, Jul 14, 2014 at 4:36 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Thomas, All,
> >
> > On 2014-07-14 13:50 +0200, Thomas De Schampheleire spake thusly:
> >> This patch removes the custom kconfig helpers UCLIBC_OPT_SET and
> >> UCLIBC_OPT_UNSET with the common KCONFIG_SET_OPT, KCONFIG_ENABLE_OPT and
> >> KCONFIG_DISABLE_OPT.
> >>
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > But see below:
> >
> >>       $(SED) '/CONFIG_ARM_.ABI/d' $(@D)/.config
> >>       $(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(@D)/.config
> >>       $(SED) '/CONFIG_MIPS_ISA_.*/d' $(@D)/.config
> >>       $(SED) '/CONFIG_SH[234A]*/d' $(@D)/.config
> >>       $(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
> >>                $(@D)/.config
> >
> > Ideally, we should have KCONFIG helpers for those, too.
> >
> 
> Yes, but it has to be a new helper I think, because of the pattern matching.

Absolutely, yes. And it can come in a later patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
