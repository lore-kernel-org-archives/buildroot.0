From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:24:37 +0100
Subject: [Buildroot] [PATCH] netsurf: fix build error
In-Reply-To: <20181211150209.26270-1-francois.perrad@gadz.org>
References: <20181211150209.26270-1-francois.perrad@gadz.org>
Message-ID: <cdb7c384-d631-cae4-f5a1-8a9803b89ba8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

On 11/12/2018 16:02, Francois Perrad wrote:
> add missing host dependency
> 
> see http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/build-end.log
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Applied to master, thanks.

 I've rewritten the commit message as follows:

    package/netsurf: add dependency on host-libpng for sdl

    libpng is used by the convert_image host tool, which is built when SDL
    is enabled.

    Fixes:

http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/

 The important bits are:

- package/netsurf instead of netsurf - we recently agreed on that formatting;

- the subject line should describe what is done, not just "fix an error"

- having "Fixes:" in the commit message makes sure that the F column in
patchwork is tagged, that's convenient for locating the more urgent patches.

 Regards,
 Arnout

> ---
>  package/netsurf/netsurf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 162ac5d79..3339b35c9 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -25,7 +25,7 @@ endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
> -NETSURF_DEPENDENCIES += sdl
> +NETSURF_DEPENDENCIES += sdl host-libpng
>  NETSURF_FRONTEND = framebuffer
>  endif
>  
> 
