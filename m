From: Andreas Naumann <dev@andin.de>
Date: Wed, 12 Dec 2018 15:21:43 +0100
Subject: [Buildroot] [PATCH] netsurf: fix build error
In-Reply-To: <20181211150209.26270-1-francois.perrad@gadz.org>
References: <20181211150209.26270-1-francois.perrad@gadz.org>
Message-ID: <5dc03c9e-7e6d-dcc7-95f3-b87f66e27627@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

Am 11.12.18 um 16:02 schrieb Francois Perrad:
> add missing host dependency
> 
> see http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/build-end.log

Unfortunately it didnt fix the issue for me. In an ARM build I get

[mmia5] 2018-12-12T14:09:53 TESTMENT: build/Linux-framebuffer/testament.h
[mmia5] 2018-12-12T14:09:53 HOST CC: 
build/Linux-framebuffer/tools/convert_image
[mmia5] 2018-12-12T14:09:53 HOST CC: 
build/Linux-framebuffer/tools/convert_font
[mmia5] 2018-12-12T14:09:53 COMPILE: content/content.c
[mmia5] 2018-12-12T14:09:53 COMPILE: content/content_factory.c
[mmia5] 2018-12-12T14:09:53 frontends/framebuffer/convert_image.c:22:10: 
fatal error: png.h: No such file or directory
[mmia5] 2018-12-12T14:09:53 #include <png.h>
[mmia5] 2018-12-12T14:09:53 ^~~~~~~
[mmia5] 2018-12-12T14:09:53 compilation terminated.
[mmia5] 2018-12-12T14:09:53 frontends/framebuffer/Makefile:97: recipe 
for target 'build/Linux-framebuffer/tools/convert_image' failed
[mmia5] 2018-12-12T14:09:53 make[3]: *** 
[build/Linux-framebuffer/tools/convert_image] Error 1


regards,
Andreas


> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/netsurf/netsurf.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 162ac5d79..3339b35c9 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -25,7 +25,7 @@ endif
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
> -NETSURF_DEPENDENCIES += sdl
> +NETSURF_DEPENDENCIES += sdl host-libpng
>   NETSURF_FRONTEND = framebuffer
>   endif
>   
> 
