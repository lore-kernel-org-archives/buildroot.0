From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 09:14:57 +0200
Subject: [Buildroot] [git commit branch/trash] package/librsvg: add
 gobject-introspection support
In-Reply-To: <874krnjqxj.fsf@tarshish>
References: <20200607065638.2756F8453F@busybox.osuosl.org>
 <874krnjqxj.fsf@tarshish>
Message-ID: <20200607071457.GM13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-06-07 10:06 +0300, Baruch Siach spake thusly:
> On Sun, Jun 07 2020, Yann E. MORIN wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=f7402a7ae7e63b956b6ca2b2f517c1b238f24bb6
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/trash
> What is this 'trash' branch?

That's me lacking enough caffeine in my blood so early in the morning.

I was on a temporary branch yesterday evening, and forgot to switch back
this morning before applying patches.

> I see this and the libvips commits in master.

Yes, I've re-applied the commits on master, and deleted the temp branch
now.

Sorry for the mess...

Regards,
Yann E. MORIN.

> baruch
> 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  package/librsvg/librsvg.mk | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> > index 470910d94c..e124fdd5d3 100644
> > --- a/package/librsvg/librsvg.mk
> > +++ b/package/librsvg/librsvg.mk
> > @@ -10,7 +10,7 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_
> >  LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
> >  LIBRSVG_INSTALL_STAGING = YES
> >  LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> > -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
> > +LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
> >  HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
> >  LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
> >  	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
> > @@ -19,5 +19,12 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libgli
> >  LIBRSVG_LICENSE = LGPL-2.0+
> >  LIBRSVG_LICENSE_FILES = COPYING.LIB
> >  
> > +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> > +LIBRSVG_CONF_OPTS += --enable-introspection
> > +LIBRSVG_DEPENDENCIES += gobject-introspection
> > +else
> > +LIBRSVG_CONF_OPTS += --disable-introspection
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
