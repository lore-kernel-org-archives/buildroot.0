From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Aug 2016 22:23:25 +0200
Subject: [Buildroot] [PATCH] uclibc: disable PIE for microblaze
In-Reply-To: <20160731214126.GA18543@waldemar-brodkorb.de>
References: <20160731214126.GA18543@waldemar-brodkorb.de>
Message-ID: <299e428f-8003-22a1-fd5b-fc1c8cec4a7f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 31/07/2016 ? 23:41, Waldemar Brodkorb a ?crit :
> PIE is not supported at the moment for uClibc-ng/microblaze.
> Fixes:
> http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/

Thanks for the quick reply and fix.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 5752380..464e1d9 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -19,7 +19,7 @@ config BR2_TOOLCHAIN_USES_GLIBC
>  
>  config BR2_TOOLCHAIN_USES_UCLIBC
>  	bool
> -	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_microblaze && !BR2_STATIC_LIBS
>  
>  config BR2_TOOLCHAIN_USES_MUSL
>  	bool
> 
