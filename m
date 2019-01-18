From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 18 Jan 2019 12:01:02 +0100
Subject: [Buildroot] [PATCH v3 11/17] package/httping: use the new
 fftw-double package
In-Reply-To: <20190101181637.GA23435@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-12-thomas.petazzoni@bootlin.com>
 <20190101181637.GA23435@scaer>
Message-ID: <20190118120102.6206e19c@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Jan 2019 19:16:37 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, Gwenha?l, All,
> 
> On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  package/httping/httping.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/httping/httping.mk b/package/httping/httping.mk
> > index 955ee3131b..b3a625a8e1 100644
> > --- a/package/httping/httping.mk
> > +++ b/package/httping/httping.mk
> > @@ -17,9 +17,9 @@ HTTPING_DEPENDENCIES = \
> >  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
> >  	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
> >  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
> > -	$(if $(BR2_PACKAGE_FFTW),fftw)
> > +	$(if $(BR2_PACKAGE_FFTW_DOUBLE),fftw-double)  
> 
> How did we go from fftw (aka any variant thereof), to fftw-double only?
My fault (again) I've missed to add detail in commit message. httping is only
compatible with fftw-double.

Gwen
> 
> Regards,
> Yann E. MORIN.
> 
> >  HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
> > -	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
> > +	FW=$(if $(BR2_PACKAGE_FFTW_DOUBLE),yes,no) \
> >  	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
> >  	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
> >  	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
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
