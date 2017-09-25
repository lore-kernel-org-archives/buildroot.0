From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Sep 2017 18:25:29 +0200
Subject: [Buildroot] [PATCH 44/49 v2] package/asterisk: add optional
 pjsip support
In-Reply-To: <22a9fa8b-5085-d903-a3a2-ebf59c4c19be@mind.be>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <3d6f2d5bc9faedd731435a6302a658c1315029f1.1504993178.git.yann.morin.1998@free.fr>
 <22a9fa8b-5085-d903-a3a2-ebf59c4c19be@mind.be>
Message-ID: <20170925162529.GC2985@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-23 19:07 +0200, Arnout Vandecappelle spake thusly:
> On 09-09-17 23:39, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/asterisk/asterisk.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> > index 284b338cb3..9327451254 100644
> > --- a/package/asterisk/asterisk.mk
> > +++ b/package/asterisk/asterisk.mk
> > @@ -70,7 +70,6 @@ ASTERISK_CONF_OPTS = \
> >  	--without-osptk \
> >  	--without-oss \
> >  	--without-postgres \
> > -	--without-pjproject \
> >  	--without-popt \
> >  	--without-pwlib \
> >  	--without-resample \
> > @@ -240,6 +239,13 @@ else
> >  ASTERISK_CONF_OPTS += --without-ssl
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_LIBPJSIP),y)
> > +ASTERISK_DEPENDENCIES += libpjsip
> > +ASTERISK_CONF_OPTS += --with-pjproject
> 
>  I believe Asterisk maintains a fork of pjsip with some specific patches. Does
> it work well with upstream pjsip?

Asterisk at least has a configure option to use an externalk pjsip
instead of the bundeld one.

I spotted an issue with this patch, so I'll have to respin it anyway.

Regards,
Yann E. MORIN.

> > +else
> > +ASTERISK_CONF_OPTS += --without-pjproject
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_SPANDSP),y)
> >  ASTERISK_DEPENDENCIES += spandsp
> >  ASTERISK_CONF_OPTS += --with-spandsp
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
