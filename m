From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:13:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: disable samples
 and tutorials
In-Reply-To: <20210222170048.409719-1-fontaine.fabrice@gmail.com>
References: <20210222170048.409719-1-fontaine.fabrice@gmail.com>
Message-ID: <20210225211308.GI2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-22 18:00 +0100, Fabrice Fontaine spake thusly:
> Disable samples and tutorials which are enabled by default and fail to
> build with gcc 10 without upstream commit:
> https://github.com/Intel-Media-SDK/MediaSDK/commit/c7d40371eb0c2042261fe1f91a364f69a1457235
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9ee28e5dc0b2ba854766d9bc82b95c28be2722d3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-mediasdk/intel-mediasdk.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index a2ffe081db..5467c96380 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -12,6 +12,9 @@ INTEL_MEDIASDK_LICENSE_FILES = LICENSE
>  INTEL_MEDIASDK_INSTALL_STAGING = YES
>  INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
>  
> -INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include"
> +INTEL_MEDIASDK_CONF_OPTS = \
> +	-DBUILD_SAMPLES=OFF \
> +	-DBUILD_TUTORIALS=OFF \
> +	-DMFX_INCLUDE="$(@D)/api/include"
>  
>  $(eval $(cmake-package))
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
