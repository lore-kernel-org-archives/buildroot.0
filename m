From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 18 Jan 2019 12:01:50 +0100
Subject: [Buildroot] [PATCH v3 12/17] package/imagemagick: use the new
 fftw-double package
In-Reply-To: <20190101210339.GB23435@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-13-thomas.petazzoni@bootlin.com>
 <20190101210339.GB23435@scaer>
Message-ID: <20190118120150.7efcd9a5@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Jan 2019 22:03:39 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, Gwenha?l, All,
> 
> On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/imagemagick/imagemagick.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/imagemagick/imagemagick.mk
> > b/package/imagemagick/imagemagick.mk index 72482267ce..7678980582 100644
> > --- a/package/imagemagick/imagemagick.mk
> > +++ b/package/imagemagick/imagemagick.mk
> > @@ -113,11 +113,11 @@ else
> >  IMAGEMAGICK_CONF_OPTS += --without-lzma
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_FFTW),y)
> > +ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)  
> 
> Same as for hackrf: why do we restrict it from any fftwe variant, to
> only fftw-double?
>
Lack on commit message... 
ImageMagick use fftw_xx (aka default, aka double).
This is the same situation for hackrf (with single), libvips, pulseaudio
Gwen
>
> Regards,
> Yann E. MORIN.
> 
> >  # configure script misdetects these leading to build errors
> >  IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
> >  IMAGEMAGICK_CONF_OPTS += --with-fftw
> > -IMAGEMAGICK_DEPENDENCIES += fftw
> > +IMAGEMAGICK_DEPENDENCIES += fftw-double
> >  else
> >  IMAGEMAGICK_CONF_OPTS += --without-fftw
> >  endif
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
