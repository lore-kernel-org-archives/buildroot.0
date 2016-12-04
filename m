From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 4 Dec 2016 18:12:14 +0100
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime_mali:
	bump kernel version
In-Reply-To: <1480869026-6208-1-git-send-email-romain.naour@gmail.com>
References: <1480869026-6208-1-git-send-email-romain.naour@gmail.com>
Message-ID: <CAB0FRsvXTowx6+e3Zx1RYCkRANSgyE-VDZReuqzSY6X4+2CHLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-12-04 17:30 GMT+01:00 Romain Naour <romain.naour@gmail.com>:
> Bump the kernel to the next commit which fix the build with gcc6.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> Build tested only.
> For the same reason, the kernel used by
> olimex_a20_olinuxino_lime2_defconfig needs to bumped
> to 4.1.43 (at least). But since it's a big change, it
> require a runtime test on the board.

At this time, the latest 4.1.x is 4.1.36 (not 4.1.43).

Currently, olimex_a20_olinuxino_lime_defconfig uses a 4.4 kernel.
With BR2017.02, I plan a bump to the upcoming 4.9 which will be also a
LTS (like 4.1 & 4.4).

On my desk, I have only a LIME board, but no LIME2.

Fran?ois

> ---
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> index 35af5f9..4930660 100644
> --- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> @@ -20,7 +20,7 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
>  # based on Linux version 3.4.113
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dbabbacbbf8984dea0a8c893b38b376a6ecbb3c1"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc385cc6dfa350382ecc94a520a716b57e654410"
>  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>  BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> --
> 2.5.5
>
