From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 20:12:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: fs needs mount
In-Reply-To: <20201015160622.846446-1-fontaine.fabrice@gmail.com>
References: <20201015160622.846446-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015201214.64792cc1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 18:06:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1f83436a84046da753a2ebf2aac7c0f0cc188fe0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libblockdev/Config.in      | 2 ++
>  package/libblockdev/libblockdev.mk | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index 3c501b7871..5836fa6cf2 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -28,6 +28,8 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
>  config BR2_PACKAGE_LIBBLOCKDEV_FS
>  	bool "filesystem"
>  	depends on BR2_ENABLE_LOCALE # parted
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT

Are you sure it's not BR2_PACKAGE_UTIL_LINUX_LIBMOUNT that is needed? I
guess libblockdev needs libmount, not the mount/umount programs. Could
you check this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
