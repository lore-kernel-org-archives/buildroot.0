From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Nov 2017 16:51:42 +0200
Subject: [Buildroot] [PATCH 2/2] squid: Add libkrb5 dependency check
In-Reply-To: <20171106154644.68d6bbea@windsurf.home>
References: <1509898955-17124-1-git-send-email-nerv@dawncrow.de>
 <1509898955-17124-2-git-send-email-nerv@dawncrow.de>
 <20171105164235.i5i36g545t3xri7m@tarshish>
 <20171106154644.68d6bbea@windsurf.home>
Message-ID: <20171106145142.p3ttgf4cpu4rdivz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 06, 2017 at 03:46:44PM +0100, Thomas Petazzoni wrote:
> On Sun, 5 Nov 2017 18:42:35 +0200, Baruch Siach wrote:
> > On Sun, Nov 05, 2017 at 05:22:35PM +0100, Andr? Hentschel wrote:
> > > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> > > ---
> > >  package/squid/squid.mk | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> > > index d334d14..3b3649a 100644
> > > --- a/package/squid/squid.mk
> > > +++ b/package/squid/squid.mk
> > > @@ -29,7 +29,6 @@ SQUID_CONF_OPTS = \
> > >  	--enable-removal-policies="lru,heap" \
> > >  	--with-filedescriptors=1024 \
> > >  	--disable-ident-lookups \
> > > -	--without-mit-krb5 \
> > >  	--enable-auth-basic="fake getpwnam" \
> > >  	--enable-auth-digest="file" \
> > >  	--enable-auth-negotiate="wrapper" \
> > > @@ -50,6 +49,13 @@ else
> > >  SQUID_CONF_ENV += squid_cv_gnu_atomics=no
> > >  endif
> > >  
> > > +ifeq ($(BR2_PACKAGE_LIBKRB5),y)
> > > +SQUID_CONF_OPTS += --without-krb5  
> > 
> > without? Are you sure this is correct? If so, it needs an explanation comment.
> > 
> > > +SQUID_DEPENDENCIES += libkrb5
> > > +else
> > > +SQUID_CONF_OPTS += --without-mit-krb5
> > > +endif
> 
> Since a respin is needed, I want to suggest a better commit title too:
> 
> 	squid: add optional dependency on libkrb5

v2 of this patch is at http://patchwork.ozlabs.org/patch/834393/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
