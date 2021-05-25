From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 22:51:29 +0200
Subject: [Buildroot] [PATCHv3 04/15] package/flare-engine: update
 explicit setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210525122750.5022-5-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-5-patrickdepinguin@gmail.com>
Message-ID: <e58f9d8c-21bc-5450-47a6-f6e4b959691b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The flare-engine package forces CMAKE_BUILD_TYPE=RelWithDebInfo in case
> Buildroot would normally set CMAKE_BUILD_TYPE=Debug. Previously, this would
> happen if BR2_ENABLE_DEBUG is set, but now we should check
> BR2_ENABLE_RUNTIME_DEBUG instead.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/flare-engine/flare-engine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
> index e2f3eefa28..503eb0825f 100644
> --- a/package/flare-engine/flare-engine.mk
> +++ b/package/flare-engine/flare-engine.mk
> @@ -15,7 +15,7 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
>  FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
>  
>  # Don't use the default Debug type as it adds -pg (gprof)

 Debug type is no longer default :-)

> -ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
>  FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo

 Since CMAKE_BUILD_TYPE is only used by flare-engine to set -O2 -g flags, maybe
it would be better/cleaner to just unconditionally set build type to Release?

 Regards,
 Arnout

>  endif
>  
> 
