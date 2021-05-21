From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 11:45:42 +0200
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: bump to version
 2.5
In-Reply-To: <20210521091332.28982-1-heiko.thiery@gmail.com>
References: <20210521091332.28982-1-heiko.thiery@gmail.com>
Message-ID: <20210521094542.GI3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-05-21 11:13 +0200, Heiko Thiery spake thusly:
> Release notes:
> https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-5
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  boot/arm-trusted-firmware/Config.in                 | 4 ++--
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index c06294040e..feef6eb50c 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -15,7 +15,7 @@ choice
>  	  Select the specific ATF version you want to use
>  
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> -	bool "v2.4"
> +	bool "v2.5"

I noticed that qemu_aarch64_sbsa_defconfig was using an unpinned version
of ATF, so bumping ATF would cause that defconfig to use a newer version
it was not tested against. So I've pinned qemu_aarch64_sbsa_defconfig to
use 2.4 and applied to next, thanks.

Regards,
Yann E. MORIN.

>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
>  
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
>  	string
> -	default "v2.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> +	default "v2.5"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
>  	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
>  	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
>  				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 970613f38d..1ab50a9e28 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  4bfda9fdbe5022f2e88ad3344165f7d38a8ae4a0e2d91d44d9a1603425cc642d  arm-trusted-firmware-v2.4.tar.gz
> +sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
>  sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
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
