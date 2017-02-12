From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 14:37:09 +0100
Subject: [Buildroot] [PATCHv3] package/ccache: do not force colored
	diagnostics
In-Reply-To: <20170212143432.4aa112f0@free-electrons.com>
References: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
 <20170212143432.4aa112f0@free-electrons.com>
Message-ID: <20170212133709.GD11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-12 14:34 +0100, Thomas Petazzoni spake thusly:
> On Sun, 12 Feb 2017 14:30:27 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > +# too old to support colored output diagnostics.
> > +ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),yy)
> > +define CCACHE_NO_GCC_COLORS
> > +	sed -i  '/if (getenv("GCC_COLORS")/,+3d' $(@D)/ccache.c
> 
> Using $(SED) not possible here?

I did as was done in the other macro, above.

> > +endef
> > +
> > +#HOST_CCACHE_POST_PATCH_HOOKS += CCACHE_NO_GCC_COLORS
> 
> Line commented? :-)

Meh, I again forgot to commit --ammend

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
