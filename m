From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 19 Mar 2014 06:31:28 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <CAAXf6LWEAPs-EpsHzgqJ1eiiRL+u2rssa_SM0EE5=6yQxrtbZQ@mail.gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com> <53284881.1090803@gmail.com>
 <CAAXf6LUmEB2=XB=CuUnDREER139E3MiouKLMa4GAFrNvnDzJsw@mail.gmail.com>
 <53285568.7080900@gmail.com>
 <CAAXf6LX-dJFpaOkMaCg0A4PD1FphzO8xbPbLWTyLTX3xmO+ELA@mail.gmail.com>
 <53285C1B.9040201@gmail.com>
 <CAAXf6LWEAPs-EpsHzgqJ1eiiRL+u2rssa_SM0EE5=6yQxrtbZQ@mail.gmail.com>
Message-ID: <53292BB0.1010503@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

Il 18/03/2014 16:53, Thomas De Schampheleire ha scritto:

>
> This is actually a bug.
> Could you try following patch:
>
> $ hg diff
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk
> b/package/qt5/qt5multimedia/qt5multimedia.mk
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -25,7 +25,7 @@ QT5MULTIMEDIA_DEPENDENCIES += gst-plugin
>   endif
>
>   define QT5MULTIMEDIA_CONFIGURE_CMDS
> -       (cd $(@D); $(HOST_DIR)/usr/bin/qmake)
> +       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>   endef
>
>   define QT5MULTIMEDIA_BUILD_CMDS
>
> and after applying this patch run:
> make qt5multimedia-dirclean qt5multimedia
>
> I believe this should fix the problem. The same solution should be
> applied to the other qt5 packages.
> Or maybe someone else thinks the problem should be fixed in a different way.
> I'm adding some people to this thread so they can shed their light on it...


I confirm it compiled successfully after applying your patch. I haven't 
tried yet QtMultimedia on the target, but at least there were no errors 
at compile-time :-)

Thank you for your support!
Marco
