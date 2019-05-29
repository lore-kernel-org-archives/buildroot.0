From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 May 2019 00:25:01 +0200
Subject: [Buildroot] [PATCH] package/flare-engine: fix check-package
 failure
In-Reply-To: <20190529183233.3544-1-giulio.benetti@micronovasrl.com>
References: <20190529183233.3544-1-giulio.benetti@micronovasrl.com>
Message-ID: <3ae3e90a-91be-6bd5-b682-80c8ad28f047@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 20:32, Giulio Benetti wrote:
> Check-package gives error on flare-engine due to trailing whitespace in
> flare-engine.mk comment inserted with commit:
> https://git.buildroot.net/buildroot/commit/?id=1203cca1b51eefb4ee236d998ab6ec32bdd087d8
> 
> Remove trailing whitespace in flare-engine.mk comment.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 Applied to master, thanks.

 I *really* shouldn't have applied that flare-engine patch to master :-)

 Regards,
 Arnout

> ---
>  package/flare-engine/flare-engine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
> index 3ed0256901..8a656d695f 100644
> --- a/package/flare-engine/flare-engine.mk
> +++ b/package/flare-engine/flare-engine.mk
> @@ -21,7 +21,7 @@ endif
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  # CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
> -# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS. 
> +# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
>  # Override CMAKE_BUILD_TYPE so no overrides are applied.
>  FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
>  FLARE_ENGINE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
> 
