From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Feb 2012 20:36:29 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
Message-ID: <201202132036.29563.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 February 2012 10:43:46 Mathieu Briand wrote:
> Buildroot config and Linux Kernel config.
> Freescale binaries (xf86 video driver and multimedia codecs) not supported yet.
> 
> Signed-off-by: Mathieu Briand <mbriand@adeneo-embedded.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


[snip]
> +BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
 Given that this is the u-boot board name, I think mx53loco_defconfig is
indeed a good name.

> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/uboot-imx.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx5"
 I haven't looked at it, but isn't this a defconfig that requires a
device tree blob?  Or is it just one that includes a number of
devboard BSPs?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120213/453ad31f/attachment.html>
