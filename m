From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 21:42:06 +0100
Subject: [Buildroot] [PATCH] configs/{ea3250, fdi3250,
 phy3250}: lock down kernel headers version
In-Reply-To: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5112C01E.2090807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 21:21, Gustavo Zacarias wrote:
> Update {ea3250,fdi3250,phy3250}_defconfig to lock down kernel headers to
> an appropiate version.
> Otherwise the target is building with, at the moment of this writing,
> version 3.7 headers and a 2.6.34 kernel which usually isn't wise.

  This should really be done for all defconfigs that build a custom 
kernel version:

arm_foundationv8_defconfig
armadeus_apf9328_defconfig
at91sam9g20dfc_defconfig
atstk100x_defconfig
beaglebone_defconfig
calao_snowball_defconfig
kb9202_defconfig
mini2440_defconfig
mx53loco_defconfig
sheevaplug_defconfig

  And the ones that allow it should probably set 
BR2_LINUX_KERNEL_SAME_AS_HEADERS.

  But all that is a lot of testing :-)

>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   configs/ea3250_defconfig  | 4 ++++
>   configs/fdi3250_defconfig | 4 ++++
>   configs/phy3250_defconfig | 4 ++++
>   3 files changed, 12 insertions(+)
>
> diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
> index 9cd7b34..2574dde 100644
> --- a/configs/ea3250_defconfig
> +++ b/configs/ea3250_defconfig
> @@ -11,6 +11,10 @@ BR2_ARM_EABI=y
>   # that will compile a kernel with ethernet working correctly
>   BR2_GCC_VERSION_4_3_X=y
>
> +# Lock down headers to avoid breaking with new defaults
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
> +BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"

  Only BR2_DEFAULT_KERNEL_VERSION is necessary - 
BR2_DEFAULT_KERNEL_HEADERS is derived from it by Kconfig.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
