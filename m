From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Oct 2012 19:39:13 +0200
Subject: [Buildroot] [PATCH 05/47] package/usbredir: new package
In-Reply-To: <5089B76F.8070003@mind.be>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-6-git-send-email-yann.morin.1998@free.fr>
 <5089B76F.8070003@mind.be>
Message-ID: <201210261939.13810.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Friday 26 October 2012 Arnout Vandecappelle wrote:
> On 24/10/12 23:25, Yann E. MORIN wrote:
> [snip]
> > +USBREDIR_VERSION         = 0.4.3
> > +USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
> > +USBREDIR_SITE            =http://spice-space.org/download/usbredir
> > +USBREDIR_LICENSE         = LGPLv2.1+
> > +USBREDIR_LICENSE_FILES   = COPYING.LIB
> > +USBREDIR_INSTALL_STAGING = YES
> > +USBREDIR_DEPENDENCIES    = libusb
> > +
> > +USBREDIR_DEPENDENCIES    += host-pkg-config
> > +
> > +ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> > +
> > +USBREDIR_LICENSE         += GPLv2+
> > +USBREDIR_LICENSE_FILES   += COPYING
> 
>   Nice!
> 
> > +
> > +else # BR2_PACKAGE_USBREDIR_SERVER != y
> > +
> > +# It's much easier to remove unwanted files after-the-fact, rather than trying
> > +# to install only what we want. Sad-and-dull life, but life nonetheless...
> > +# Note: do not forget to update the license, above, if you keep the server.
> 
>   It's not the first time this is done in buildroot, so: comment is redundant.

OK. The last sentence is wrong, too, as it's properly taken care of a few
lines above.

BTW, this series was just a kind of "drop the stuff onto the wall and see
what happens", after requests on the IRC chan. It was not meant for
inclusion. But getting early review is very nice! Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
