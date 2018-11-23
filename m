From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:02:04 +0100
Subject: [Buildroot] [PATCH/next 1/1] sdl2: fix build with
 --disable-threads
In-Reply-To: <20181121220923.24849-1-fontaine.fabrice@gmail.com>
References: <20181121220923.24849-1-fontaine.fabrice@gmail.com>
Message-ID: <20181123220204.26d38eb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Nov 2018 23:09:23 +0100, Fabrice Fontaine wrote:
> SDL_LinuxSetThreadPriority() has been added since version 2.0.9 and
> https://github.com/SDL-mirror/SDL/commit/f25a7fa870bdceb339e5105973f689606bcb9086
> 
> However, this function is used in src/dynapi/SDL_dynapi_procs.h even
> when SDL_THREADS_DISABLED
> 
> However, when SDL_THREADS_DISABLED is set, SDL_LinuxSetThreadPriority is
> not defined because thread/pthread/SDL_systhread.c is not built
> 
> So check SDL_THREADS_DISABLED in addition to __LINUX__
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/539cb9ab6c605dc6be73ebe90debab1a998f2451
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-build-with-disable-threads.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/sdl2/0001-fix-build-with-disable-threads.patch

I like how the inverted SDL_THREADS_DISABLED macro makes the code
readable. !SDL_THREADS_DISABLED means thread support is enabled...

But anyway, that's not your fault, that's how the existing SDL2 code
is. So applied to next, thanks! Please make sure you submit this
upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
