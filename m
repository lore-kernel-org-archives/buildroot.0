From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 13:04:02 +0200
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.10.8 in vdk
 defconfig
In-Reply-To: <1491495579-26960-1-git-send-email-vzakhar@synopsys.com>
References: <1491495579-26960-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <019deebb-fe10-91e9-19c6-ad59edb7a895@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-04-17 18:19, Vlad Zakharov wrote:
> With this commit we update snps_archs38_vdk_defconfig with the
> following:
>   - bump linux kernel version to 4.10.8
>   - set up host linux headers to 4.10

 This fails to build because the vdk patches in
board/synopsys/vdk/patches/linux no longer apply to the 4.10 kernel. Have you
even tested this?

 See also https://gitlab.com/buildroot.org/buildroot/builds/14419270

 Regards,
 Arnout

> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/snps_archs38_vdk_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
> index 7cbd68c..2cca0b8 100644
> --- a/configs/snps_archs38_vdk_defconfig
> +++ b/configs/snps_archs38_vdk_defconfig
> @@ -8,13 +8,13 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
>  BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
>  BR2_TARGET_ROOTFS_EXT2=y
>  
> -# Linux headers same as kernel, a 4.9 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +# Linux headers same as kernel, a 4.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.8"
>  BR2_LINUX_KERNEL_PATCH="board/synopsys/vdk/patches/linux"
>  BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
>  BR2_LINUX_KERNEL_VMLINUX=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
