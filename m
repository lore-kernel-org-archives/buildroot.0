From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 18 Jan 2019 12:00:25 +0100
Subject: [Buildroot] [PATCH v3 08/17] package/gnuradio: use the new
 fftw-single package
In-Reply-To: <20190101121657.GN26917@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-9-thomas.petazzoni@bootlin.com>
 <20190101121657.GN26917@scaer>
Message-ID: <20190118120025.175f2fa5@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Jan 2019 13:16:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, Gwenha?l, All,
> 
> On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Thanks to the new fftw package organization, we can use a "select"
> > instead of "depends on".
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
[SNIP]
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
> > -GNURADIO_DEPENDENCIES += fftw
> > +GNURADIO_DEPENDENCIES += fftw-single  
> 
> ... here we only have fftw-single as a dependency. That's a bit weird.
> 
In fact this modification is not needed because GNURadio selects explicitly
single precision and fftw-single is in FFTW_DEPENDENCIES build order will
be respected.

Regards,
Gwen

> But heck...
> 
> Regards,
> Yann E. MORIN.
> 
> >  GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
> >  else
> >  GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
> > -- 
> > 2.20.1
> >   
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: | | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |
> ___               | | +33 223 225 172 `------------.-------:  X  AGAINST
> |  \e/  There is no  | | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML
> MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________ buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
