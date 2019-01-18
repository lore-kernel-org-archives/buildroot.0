From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 18 Jan 2019 12:00:42 +0100
Subject: [Buildroot] [PATCH v3 09/17] package/gqrx: remove unneeded fftw
 dependency
In-Reply-To: <20190101123312.GQ26917@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-10-thomas.petazzoni@bootlin.com>
 <20190101122951.GP26917@scaer> <20190101123312.GQ26917@scaer>
Message-ID: <20190118120042.188eea60@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On Tue, 1 Jan 2019 13:33:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Gwenha?l, All,
> 
> On 2019-01-01 13:29 +0100, Yann E. MORIN spake thusly:
> > On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:  
> > > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > > 
> > > Thanks to the new fftw package organization, gnuradio already selects
> > > the appropriate fftw precision, and there is no need to propagate the
> > > "depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE" that used to be present
> > > in the gnuradio package.
> > > 
> > > Signed-off-by: Gwenhael Goavec-Merou
> > > <gwenhael.goavec-merou@trabucayre.com> Signed-off-by: Thomas Petazzoni
> > > <thomas.petazzoni@bootlin.com>  
> > 
> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > However, Gwenha?l, one question: why does it depend on gnuradio rather
> > than selecting it (and propagating its dependencies, of course)?
> > 
> > As I understand it, gqrx is an application, and for applications, we try
> > as much as posiible to have them visible and select the libraries they
> > need, rather than hide them behind their libs.  
> 
> Oh, I see why, now: that's because of the historical fftw precision
> dependency that we could not select gnuradio so far. But now we could.
> 
True. My fault.

Regards,
Gwen
>
> > Regards,
> > Yann E. MORIN.
> >   
> > > ---
> > >  package/gqrx/Config.in | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> > > index 1dc40c6d24..94ccb60d44 100644
> > > --- a/package/gqrx/Config.in
> > > +++ b/package/gqrx/Config.in
> > > @@ -2,13 +2,11 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar"
> > >  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> > > || \ !BR2_USE_WCHAR
> > >  
> > > -comment "gqrx needs qt5, gnuradio, fftw's single precision"
> > > -	depends on !BR2_PACKAGE_GNURADIO
> > > || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
> > > -		!BR2_PACKAGE_QT5
> > > +comment "gqrx needs qt5, gnuradio"
> > > +	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_QT5
> > >  
> > >  config BR2_PACKAGE_GQRX
> > >  	bool "gqrx"
> > > -	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
> > >  	depends on BR2_PACKAGE_GNURADIO
> > >  	depends on BR2_PACKAGE_QT5
> > >  	depends on BR2_INSTALL_LIBSTDCPP # boost
> > > -- 
> > > 2.20.1
> > >   
> > 
> > -- 
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> > conspiracy: | | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |
> > ___               | | +33 223 225 172 `------------.-------:  X
> > AGAINST      |  \e/  There is no  | | http://ymorin.is-a-geek.org/ | _/*\_
> > | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> > _______________________________________________ buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
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
