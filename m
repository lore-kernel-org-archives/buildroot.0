From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2016 22:55:03 +0200
Subject: [Buildroot] [PATCH] uboot build and deploy added to juno board
In-Reply-To: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
References: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
Message-ID: <57193E27.2070801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/20/16 19:47, Joao Pinto wrote:
> This patch has the goal to add to the juno board defconfig the u-boot build
> configurations. The juno board readme file was also updated with the
> necessary steps to build the ARM Trusted Firmware (with u-boot in it) and
> how to deploy it.
>
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
[snip]
> diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
> index 87b6374..9ed4258 100644
> --- a/configs/arm_juno_defconfig
> +++ b/configs/arm_juno_defconfig
> @@ -12,3 +12,9 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
> +BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.03"

  Is there any reason to use a git clone rather than just downloading the 
tarball? I.e., doesn't this work:

BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
