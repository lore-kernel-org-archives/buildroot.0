From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:25:26 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
In-Reply-To: <20210605220031.2750663-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 6 Jun 2021 00:00:31 +0200")
References: <20210605220031.2750663-1-fontaine.fabrice@gmail.com>
Message-ID: <87im2lh3gp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libmpv-static and libmpv-shared are disabled by default resulting in the
 > following build failure when building with gl but without rpi, wayland
 > or x11:

 > Checking for OpenGL without platform-specific code (e.g. for libmpv)      : libmpv-shared not found
 > Checking for OpenGL context support                                       : gl-cocoa not found
 > You manually enabled the feature 'gl', but the autodetection check failed.

 > Here is an extract of wscript:

 >     } , {
 >         'name': '--plain-gl',
 >         'desc': 'OpenGL without platform-specific code (e.g. for libmpv)',
 >         'deps': 'libmpv-shared || libmpv-static',
 >         'func': check_true,
 >     }, {
 >         'name': '--gl',
 >         'desc': 'OpenGL context support',
 >         'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
 >                  + 'gl-win32 || gl-wayland || rpi || '
 >                  + 'plain-gl',
 >         'func': check_true,
 >         'req': True,
 >         'fmsg': "No OpenGL video output found or enabled. " +
 >                 "Aborting. If you really mean to compile without OpenGL " +
 >                 "video outputs use --disable-gl.",
 >     }, {

 > Fixes:
 >  - http://autobuild.buildroot.org/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - shared and static can't be enabled simultaneously so prefer shared
 >    over static for BR2_SHARED_STATIC_LIBS

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
