From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:53:01 +0200
Subject: [Buildroot] [PATCH 1/3] uboot: add support for patch files and
 URLs
In-Reply-To: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150418155301.59cb5aef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Fri, 17 Apr 2015 16:26:13 -0400, Frank Hunleth wrote:
> The existing u-boot patch option only allowed directories to be
> specified. As suggested by Arnout Vandecappelle, hooking into the
> generic patch framework enables files and URLs to be specified. The
> downside is that patch directories need to be converted to lists of
> files to use this approach.
> 
> This change is useful for Intel Edison support, so that Intel's u-boot
> patch can be downloaded rather than stored in the Buildroot source tree.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 3f39ee8..32fcb21 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -79,6 +79,14 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  
>  	  Most users may leave this empty
>  
> +config BR2_TARGET_UBOOT_PATCHES
> +	string "custom patches"
> +	help
> +	  If your board requires custom patches, add a list of patches
> +	  here.
> +
> +	  Most users may leave this empty

What about doing like for the Linux kernel: a single option to list
patches, which can be local patches, local directories, or remote
patches to be downloaded?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
