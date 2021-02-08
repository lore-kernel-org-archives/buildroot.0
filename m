From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 8 Feb 2021 22:33:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/wlroots: change mesa3d
 dependency to virtual libegl/libgles
In-Reply-To: <20210207164551.GN2384@scaer>
References: <20210207105155.516654-1-gilles.talis@gmail.com>
 <20210207164551.GN2384@scaer>
Message-ID: <CAKcgs2xX7Ay0ZV0tnvHq_8cJZAa-zB+Nzj7S0CXnLb9nBCi1AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,


Le dim. 7 f?vr. 2021 ? 17:46, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Gilles, All,
>
> On 2021-02-07 11:51 +0100, Gilles Talis spake thusly:
> > From: Julien Olivain <ju.o@free.fr>
> >
> > Since commits:
> > https://github.com/swaywm/wlroots/commit/c2288a7b88240e4377bfc1c67b44efb58f704a42
> > https://github.com/swaywm/wlroots/commit/e18599b05e0f0cbeba11adbd489e801285470eab
> >
> > Mesa dependency is no longer required. Wlroots is able to run on drivers
> > that provide EGL and GLES2.0 support (with specific EGL wayland extensions)
>
> HEre, you said "with specific EGL wayland extensions", so...
>
> [--SNIP--]
> > @@ -12,11 +12,8 @@ config BR2_PACKAGE_WLROOTS
> >       depends on !BR2_STATIC_LIBS # wayland
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
> >       depends on BR2_PACKAGE_HAS_UDEV # libinput
> > -     # Technically wlroots should work with any OpenGL implementation
> > -     # which provides EGL, GLES2, and libgbm; but in practice only
> > -     # Mesa ships an usable libgbm.
> > -     depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> > -     depends on BR2_PACKAGE_MESA3D_OPENGL_ES
> > +     depends on BR2_PACKAGE_HAS_LIBEGL
>
> ... should not that be also depend on BR2_PACKAGE_HAS_LIBEGL_WAYLAND ?
>
> Note that BR2_PACKAGE_HAS_LIBEGL_WAYLAND is a sub-option of
> BR2_PACKAGE_HAS_LIBEGL, so both should be added as dependency, but...
You're correct. Thanks for spotting that one.


>
> [--SNIP--]
> > diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> > index 5665d5a956..0160b1aedb 100644
> > --- a/package/wlroots/wlroots.mk
> > +++ b/package/wlroots/wlroots.mk
> > @@ -15,7 +15,8 @@ WLROOTS_DEPENDENCIES = \
> >       host-wayland \
> >       libinput \
> >       libxkbcommon \
> > -     mesa3d \
> > +     libegl \
>
> ... indeed only libegl needs to be added to _DEPENDENCIES.
>
> Regards,
> Yann E. MORIN.
>
> > +     libgles \
> >       pixman \
> >       udev \
> >       wayland \
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

thanks for the review. I'll prepare and send a v2.
thanks
Gilles.
