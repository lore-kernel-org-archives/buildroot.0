From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 6 Sep 2013 11:35:58 -0500
Subject: [Buildroot] [PATCH 6/6] glmark2: new package
In-Reply-To: <20130827224815.7a21e42f@skate>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-7-git-send-email-spenser@gillilanding.com>
 <20130827224815.7a21e42f@skate>
Message-ID: <CAEBucnAz_S25ndE_qpJ0u=j2=89vXPs8G_YNeXnkPh130c-3Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> It's probably me not having enough OpenGL/Mesa knowledge, but my
> understanding was that Mesa was the OpenGL/EGL/OpenVG implementations
> for "desktop" graphics cards, and that therefore Mesa was equivalent to
> the OpenGL implementations provided by ARM SoC vendors, so that OpenGL
> applications such as glmark2 would only have to depends on HAS_OPENGL
> || (HAS_OPENGL_EGL && HAS_OPENGL_ES), and not depend on Mesa in
> addition to this.

GLMark2 depends on Mesa because Mesa provides libgbm which is a
required dependency of glmark2.

>
> With the dependencies you've listed, on a TI OMAP3 platform, we would
> need both Mesa *and* the ti-gfx package. Is this expected? I suppose
> that this means Mesa provides more stuff that just GL/GLES/EGL/VG. If
> that's the case, do you have a few more details?

Everything you have mentioned is completely correct.

>> +     select BR2_PACKAGE_JPEG
>> +     select BR2_PACKAGE_LIBPNG12
>> +     select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_i386 || BR2_x86_64 # libdrm
>> +     select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS # libdrm
>
> glmark2 is directly using libpciaccess and libpthread-stubs?

Fixed in recent version.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
