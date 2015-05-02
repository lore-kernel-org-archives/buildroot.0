From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 15:10:48 +0200
Subject: [Buildroot] [PATCH 19/30] package/matchbox: enable support for
 the Xsession manager
In-Reply-To: <5543E1E7.1060208@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <f3e0f3a40f00196638e2a5edd185d81be7bf175e.1429725549.git.yann.morin.1998@free.fr>
 <5543E1E7.1060208@mind.be>
Message-ID: <20150502131048.GC13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 22:28 +0200, Arnout Vandecappelle spake thusly:
> On 22/04/15 20:09, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Although I wonder: are users really expected to go an select some X library to
> enable the multisession feature? I think this is one that falls under the
> "non-obvious dependency" class.

OK, I'll make that an option in Kconfig.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > ---
> >  package/matchbox/matchbox.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> > index 2d30ca0..5bd2587 100644
> > --- a/package/matchbox/matchbox.mk
> > +++ b/package/matchbox/matchbox.mk
> > @@ -35,6 +35,13 @@ else
> >  MATCHBOX_CONF_OPTS += --disable-startup-notification
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
> > +MATCHBOX_CONF_OPTS += --enable-session
> > +MATCHBOX_DEPENDENCIES += xlib_libSM
> > +else
> > +MATCHBOX_CONF_OPTS += --disable-session
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  
> >  # After we called a package infra, w ecan include more files
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
