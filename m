From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:22:25 +0200
Subject: [Buildroot] [PATCH] uboot: add default for
 BR2_TARGET_UBOOT_PATCH
In-Reply-To: <1429623936-4438-1-git-send-email-fhunleth@troodon-software.com>
References: <1429623936-4438-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150422222225.4b80a2bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue, 21 Apr 2015 09:45:36 -0400, Frank Hunleth wrote:
> Automatically copy over the value from BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
> to make handling its deprecation easier. Thanks to Arnout for the
> suggestion.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  boot/uboot/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 4f01499..419b183 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -84,6 +84,7 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  
>  config BR2_TARGET_UBOOT_PATCH
>  	string "Custom U-Boot patches"
> +	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  	help
>  	  A space-separated list of patches to apply to U-Boot.
>  	  Each patch can be described as an URL, a local file path,

Does this actually works? I've tried removing BR2_TARGET_UBOOT_PATCH=""
from my .config, add BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="foo bar", and
ran 'make menuconfig'. I was hoping to see "foo bar" in
BR2_TARGET_UBOOT_PATCH, but it wasn't the case. Am I missing something?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
