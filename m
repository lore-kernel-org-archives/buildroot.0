From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 May 2020 00:14:38 -0600
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
 <20200502143243.4e2b3ef3@windsurf.home>
 <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
Message-ID: <CADvTj4qsNdRjZZKzVNUfguexcRQta9LgWY8j_R+04QewWEi_vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 2, 2020 at 1:36 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> On Sat, May 2, 2020 at 6:32 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Sat,  2 May 2020 00:04:35 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> > > index eefb2c83f7..d98eaf945a 100644
> > > --- a/package/gobject-introspection/gobject-introspection.mk
> > > +++ b/package/gobject-introspection/gobject-introspection.mk
> > > @@ -136,6 +136,36 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > >  endef
> > >  GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > >
> > > +define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > > +     # Set prefix to /usr because pkg-config appends the sysroot directory
> > > +     $(SED) "s%^prefix=.*%prefix=\/usr%g" \
> > > +             $(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> >
> > No, the host variant of pkg-config should not append the sysroot
> > directory. If it does, then it is wrong.
> Well this was when building the target package that uses the host
> pkgconfig libdir.
I submitted a pull request upstream that would let us fix this a better way:
https://github.com/mesonbuild/meson/pull/7072
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
