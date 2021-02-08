From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 8 Feb 2021 22:36:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/cage: update dependencies to
 match wlroot's
In-Reply-To: <20210207164923.GO2384@scaer>
References: <20210207105155.516654-1-gilles.talis@gmail.com>
 <20210207105155.516654-2-gilles.talis@gmail.com> <20210207164923.GO2384@scaer>
Message-ID: <CAKcgs2z_d8PptEyAKY3DFHauRR=YSch-=PUupGrLeYfckESvuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Le dim. 7 f?vr. 2021 ? 17:49, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Gilles, All,
>
> On 2021-02-07 11:51 +0100, Gilles Talis spake thusly:
> > From: Julien Olivain <ju.o@free.fr>
> >
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  package/cage/Config.in | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/cage/Config.in b/package/cage/Config.in
> > index 3bef08f037..4f823c768c 100644
> > --- a/package/cage/Config.in
> > +++ b/package/cage/Config.in
> > @@ -1,6 +1,6 @@
> > -comment "cage needs udev, mesa3d w/ EGL and GLES support"
> > -     depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> > -             !BR2_PACKAGE_MESA3D_OPENGL_ES || \
> > +comment "cage needs udev, EGL and OpenGL ES support"
> > +     depends on !BR2_PACKAGE_HAS_LIBEGL || \
> > +             !BR2_PACKAGE_HAS_LIBGLES || \
> >               !BR2_PACKAGE_HAS_UDEV
> >
> >  comment "cage needs a toolchain w/ threads, dynamic library"
> > @@ -11,9 +11,9 @@ config BR2_PACKAGE_CAGE
> >       bool "cage"
> >       depends on !BR2_STATIC_LIBS # wlroots
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
> > +     depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
> > +     depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
> >       depends on BR2_PACKAGE_HAS_UDEV # wlroots
> > -     depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
> > -     depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
>
> Although indeed we try to keep changes to different packages in
> different patches, this one change really should be in the previous
> patch.
>
> Indeed, it is a single semantic change: updating the dependencies of
> wlroots, and as a consequence, propagatign these new dependencies to the
> dependees of wlroots.
>
> Otherwise:
>
>   - if we only apply patch 1, then the dependencies of cage would be
>     incorrect and the comments misleading;
>
>   - if we apply both, and later find an issue and revert only the first,
>     then the dependences of cage would also be incorrect and the
>     comments misleading.
>
> So, to me, these two patches should be squashed together.
Your comment makes sense. I'll squash the patches in the v2.

>
> Regards,
> Yann E. MORIN.
>
> >       select BR2_PACKAGE_WLROOTS
> >       help
> >         Kiosk compositor for Wayland, which displays a single
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
thanks for the review!
Gilles.
