From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Apr 2020 01:00:47 -0600
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
In-Reply-To: <CADvTj4omJYTytg_nmqAUg1jQqFgQvzFbA0=3kog-Bj0DQp_BSg@mail.gmail.com>
References: <20200428040638.122494-1-james.hilliard1@gmail.com>
 <20200428072202.5889620f@windsurf.home>
 <d96ae071-26fa-25a4-a508-d52d82daafeb@mind.be>
 <CADvTj4omJYTytg_nmqAUg1jQqFgQvzFbA0=3kog-Bj0DQp_BSg@mail.gmail.com>
Message-ID: <CADvTj4qgx3z=quJPSWPKS_ommCZAvmwdKayM4PgHZkctYzBt+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 28, 2020 at 12:55 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Tue, Apr 28, 2020 at 12:50 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> >
> > On 28/04/2020 07:22, Thomas Petazzoni wrote:
> > > +++ b/package/pkg-meson.mk
> > > @@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
> > >               --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> > >               --buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> > >               --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> > > +             -Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
> >
> >  This can't be right. Here you're setting the pkg_config_path to the one for
> > native build. It may work in the specific case of wayland-scanner where you
> > actually want the native one, but it will break anything that requires the cross
> > package config.
> We've essentially already been using this exact option for weston so I'm pretty
> sure it's correct. This option should only override pkgconfig for native: true
> dependencies.
See documentation here: https://mesonbuild.com/Builtin-options.html#core-options
> >
> >  (Of course, this statement is just from reading the code, I could be wrong.)
> >
> >  Regards,
> >  Arnout
> >
> > >               $$($$(PKG)_CONF_OPTS) \
> > >               $$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
