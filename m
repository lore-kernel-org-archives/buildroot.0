From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:43:37 +0200
Subject: [Buildroot] [PATCHv2 03/12]
 configs/amarula_a64_relic_defconfig: remove
 BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
In-Reply-To: <20200421172646.3340666-3-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-3-romain.naour@gmail.com>
Message-ID: <20200421214337.3ae2992a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 19:26:37 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This option is lost while loading the defconfig with:
> make amarula_a64_relic_defconfig
> 
> This fixes the new defconfig check.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> ---
> If android tools is really required for this defconfig,
> BR2_PACKAGE_HOST_ANDROID_TOOLS must be selected first.
> ---
>  configs/amarula_a64_relic_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
> index f2e7e7f965..5a62fbf6c4 100644
> --- a/configs/amarula_a64_relic_defconfig
> +++ b/configs/amarula_a64_relic_defconfig
> @@ -40,7 +40,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Amarula A64-Relic"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y

The intention is to have android-tools for the host enabled, because
board/amarula/a64-relic/readme.txt makes use of fastboot to reflash the
board.

So the proper fix is to add:

BR2_PACKAGE_HOST_ANDROID_TOOLS=y

and of course adjust the commit log accordingly. No need to resend the
whole series for that, we can fix when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
