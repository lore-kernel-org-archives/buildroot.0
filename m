From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 14:55:39 +0100
Subject: [Buildroot] [PATCH v1] sdl2: rpi video support needs OpenGL ES
In-Reply-To: <20180228090426.8951-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 28 Feb 2018 10:04:26 +0100")
References: <20180228090426.8951-1-ps.report@gmx.net>
Message-ID: <87woyxjk10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_Create':
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: error: 'RPI_GLES_DefaultProfileConfig' undeclared (first use in this function); did you mean 'RPI_GLES_DeleteContext'?
 device-> GL_DefaultProfileConfig = RPI_GLES_DefaultProfileConfig;
 >                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >                                          RPI_GLES_DeleteContext
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: note: each undeclared identifier is reported only once for each function it appears in
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_CreateWindow':
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:281:17: error: 'SDL_VideoDevice {aka struct SDL_VideoDevice}' has no member named 'egl_data'; did you mean 'gl_data'?
 >        if (!_this->egl_data) {
 >                    ^~~~~~~~
 >                    gl_data
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:10: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
 wdata-> egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
 >             ^~
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:26: warning: implicit declaration of function 'SDL_EGL_CreateSurface'; did you mean 'SDL_Vulkan_CreateSurface'? [-Wimplicit-function-declaration]
 wdata-> egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
 >                             ^~~~~~~~~~~~~~~~~~~~~
 >                             SDL_Vulkan_CreateSurface
 >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:288:14: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
 >        if (wdata->egl_surface == EGL_NO_SURFACE) {
 >                 ^~

 > [1] http://autobuild.buildroot.net/results/9612d43b192bbb88214a11fe18f8b8da6ad10313

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
