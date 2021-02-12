From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2021 11:13:27 +0100
Subject: [Buildroot] [PATCH 7/7] package/sysrepo: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <c3e0dbe6-8fc8-4285-8196-8463d22e403f@cesnet.cz>
References: <20210210141256.6438-1-patrickdepinguin@gmail.com>
 <20210210141256.6438-8-patrickdepinguin@gmail.com>
 <c3e0dbe6-8fc8-4285-8196-8463d22e403f@cesnet.cz>
Message-ID: <CAAXf6LUqT99qn7LieU7f4QxPqLLOw7D5+mp-HS7Q08-FJFJOdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue, 11 feb 2021 a las 15:16, Jan Kundr?t (<jan.kundrat@cesnet.cz>) escribi?:
>
> On st?eda 10. ?nora 2021 15:12:56 CET, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > sysrepo explicitly set CMAKE_BUILD_TYPE=Release, ignoring any possible
> > value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
> >
> > With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> > longer be necessary. Users that do not wish to have additional runtime
> > debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  package/sysrepo/sysrepo.mk | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> > index e4d553cdbd..e0ac4cd245 100644
> > --- a/package/sysrepo/sysrepo.mk
> > +++ b/package/sysrepo/sysrepo.mk
> > @@ -13,7 +13,6 @@ SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
> >  HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
> >
> >  SYSREPO_CONF_OPTS = \
> > -     -DCMAKE_BUILD_TYPE=Release \
> >       -DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF)
>
> You'll need to pass -DREPO_PATH=/etc/sysrepo here so that sysrepo on the
> target does not accidentally try to use a path that only exists on the
> build host. See
> https://github.com/sysrepo/sysrepo/blob/v1.4.104/CMakeLists.txt#L138-L144
> for details.
>
> After that, feel free to add my Reviewed-by.

Thanks a lot, I will send a v2.
