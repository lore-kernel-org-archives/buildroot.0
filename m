From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 17:02:04 +0200
Subject: [Buildroot] [PATCH 7/7 v3] Add powerpc64 petitboot defconfig
In-Reply-To: <1402982507.186219.497008212672.7.gpush@pablo>
References: <1402982507.186219.497008212672.7.gpush@pablo>
Message-ID: <543A97EC.3020108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/06/14 07:21, Jeremy Kerr wrote:
> A simple defconfig for building a petitboot-based bootloader for
> powerpc64 machines.

 It would be nice if you could also create one for a qemu target, so people can
actually experiment with it.

> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> 
> ---
>  configs/powerpc64_petitboot_defconfig |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/configs/powerpc64_petitboot_defconfig b/configs/powerpc64_petitboot_defconfig
> new file mode 100644
> index 0000000..fa629ab
> --- /dev/null
> +++ b/configs/powerpc64_petitboot_defconfig
> @@ -0,0 +1,17 @@
> +BR2_powerpc64=y
> +BR2_GENERATE_LOCALE="en_US.UTF-8"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_BNX2X=y
> +BR2_PACKAGE_LINUX_FIRMWARE_CXGB4=y
> +BR2_PACKAGE_NCURSES_WCHAR=y

 Is this needed?

> +BR2_PACKAGE_DROPBEAR=y

 Is this useful?

> +# BR2_PACKAGE_DROPBEAR_SERVER is not set
> +BR2_PACKAGE_ETHTOOL=y

 Is this useful?

> +BR2_PACKAGE_NETCAT=y

 Is this useful?

> +BR2_PACKAGE_RSYNC=y

 Is this useful?

> +BR2_PACKAGE_PETITBOOT=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_XZ=y
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
