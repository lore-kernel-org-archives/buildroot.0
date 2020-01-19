From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 10:02:51 +0100
Subject: [Buildroot] [PATCH v8 19/20] package/kodi-visualisation-*: mass
 version bump
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-20-bernd.kuhls@t-online.de>
 <20200118220358.GI32369@scaer>
 <frdcfgxnh9.ln2@ID-313208.user.individual.net>
 <20200119084406.GL32369@scaer>
Message-ID: <riidfgxktb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 19 Jan 2020 09:44:06 +0100 schrieb Yann E. MORIN:

> But OK, they rewrote the code. However, looking at the [atch you remove,
> and looking at the new code, I am not sure what we tried to fix is not
> broken again. For example, the pkg-config check was changed (in our
> patch):
> 
>     -pkg_check_modules(OpenGLES2 glesv2) +pkg_check_modules(OpenGLES2
>     glesv2 egl)
> 
> And their new code does something that is equivalent to the original
> line we patched:
> 
>     pkg_check_modules(PC_OPENGLES ${_brcmprefix}glesv2 QUIET)
> 
> So I wonder if we do not still need something similar to our patch...

Hi Yann,

the patch I removed existed to fix "The non-pkg-config path looks for 
both EGL *and* OpenGL ES".

This was true with package version 1.1.5:
https://github.com/xbmc/visualization.shadertoy/blob/
e88fd6ee830bb2ec7c35239a90d1e03155a5c6d7/FindOpenGLES2.cmake#L21

	find_library(OPENGLES2_egl_LIBRARY NAMES EGL)

Current version https://github.com/xbmc/visualization.shadertoy/blob/Leia/
FindOpenGLES.cmake however does not look for egl at all anymore, neither 
do FindOpenGl.cmake and CMakeLists.txt, so I doubt that our fix is still 
needed.

Regards, Bernd
