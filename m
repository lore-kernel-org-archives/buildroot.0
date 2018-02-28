From: Guillermo A . Amaral <g@maral.me>
Date: Wed, 28 Feb 2018 11:55:23 -0800
Subject: [Buildroot] [PATCH v1] sdl2: rpi video support needs OpenGL ES
In-Reply-To: <87woyxjk10.fsf@dell.be.48ers.dk>
References: <20180228090426.8951-1-ps.report@gmx.net>
 <87woyxjk10.fsf@dell.be.48ers.dk>
Message-ID: <20180228195523.GA22406@enterprise.starfleet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah! You guys beat me to the punch. Thanks for the fix! :-)

On Wed, Feb 28, 2018 at 02:55:39PM +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
>  > Fixes [1]:
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_Create':
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: error: 'RPI_GLES_DefaultProfileConfig' undeclared (first use in this function); did you mean 'RPI_GLES_DeleteContext'?
>  device-> GL_DefaultProfileConfig = RPI_GLES_DefaultProfileConfig;
>  >                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  >                                          RPI_GLES_DeleteContext
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: note: each undeclared identifier is reported only once for each function it appears in
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_CreateWindow':
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:281:17: error: 'SDL_VideoDevice {aka struct SDL_VideoDevice}' has no member named 'egl_data'; did you mean 'gl_data'?
>  >        if (!_this->egl_data) {
>  >                    ^~~~~~~~
>  >                    gl_data
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:10: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
>  wdata-> egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
>  >             ^~
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:26: warning: implicit declaration of function 'SDL_EGL_CreateSurface'; did you mean 'SDL_Vulkan_CreateSurface'? [-Wimplicit-function-declaration]
>  wdata-> egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
>  >                             ^~~~~~~~~~~~~~~~~~~~~
>  >                             SDL_Vulkan_CreateSurface
>  >   .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:288:14: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
>  >        if (wdata->egl_surface == EGL_NO_SURFACE) {
>  >                 ^~
> 
>  > [1] http://autobuild.buildroot.net/results/9612d43b192bbb88214a11fe18f8b8da6ad10313
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Committed, thanks.
> 
> -- 
> Bye, Peter Korsgaard

-- 
gamaral
http://about.me/gamaral
