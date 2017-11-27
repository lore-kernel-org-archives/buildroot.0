From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 12:12:15 +0100
Subject: [Buildroot] [PATCHv2] package/hackrf: new package
In-Reply-To: <20171126161600.n4lm7urhkwnzshm3@sapphire.tkos.co.il>
References: <20171126153550.13871-1-yann.morin.1998@free.fr>
 <20171126161600.n4lm7urhkwnzshm3@sapphire.tkos.co.il>
Message-ID: <20171127111215.GB2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-11-26 18:16 +0200, Baruch Siach spake thusly:
> Hi Yann,
> 
> On Sun, Nov 26, 2017 at 04:35:50PM +0100, Yann E. MORIN wrote:
> > diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
> > new file mode 100644
> > index 0000000000..af5d9c08f2
> > --- /dev/null
> > +++ b/package/hackrf/hackrf.mk
> > @@ -0,0 +1,22 @@
> > +################################################################################
> > +#
> > +# hackrf
> > +#
> > +################################################################################
> > +
> > +HACKRF_VERSION = fb83ad64953bf7f8707bc209968f9e49f894369e
> > +HACKRF_SITE = $(call github,mossmann,hackrf,$(HACKRF_VERSION))
> > +HACKRF_LICENSE = GPLv2 GPLv2+ BSD-3c
> 
> _LICENSE should use SPDX identifiers: GPL-2.0, GPL-2.0+, BSD-3-Clause.

Fixed, thanks! :-)

Regards,
Yann E. MORIN.

> baruch
> 
> > +HACKRF_LICENSE_FILES = COPYING
> > +HACKRF_DEPENDENCIES = host-pkgconf libusb fftw
> > +HACKRF_INSTALL_STAGING = YES
> > +HACKRF_SUBDIR = host
> > +HACKRF_SUPPORTS_IN_SOURCE_BUILD = NO
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> > +HACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
> > +else
> > +HACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
> > +endif
> > +
> > +$(eval $(cmake-package))
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
