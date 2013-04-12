From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Apr 2013 11:55:48 +0200
Subject: [Buildroot] [PATCH] integrator926: Update the defconfig
In-Reply-To: <1365760002-21814-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 12 Apr 2013 11:46:42 +0200")
References: <1365760002-21814-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87wqs8qdi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> the integrator926 defconfig has not been updated for quite some time,
 Maxime> and is still asking for very old linux and u-boot releases. Now that
 Maxime> these versions aren't present in Buildroot anymore, they default to a
 Maxime> newer release, where, in the u-boot case, the defconfig name has
 Maxime> changed, leading to a build failure.

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  configs/integrator926_defconfig |    5 +----
 Maxime>  1 file changed, 1 insertion(+), 4 deletions(-)

 Maxime> diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
 Maxime> index e596d33..e1a084c 100644
 Maxime> --- a/configs/integrator926_defconfig
 Maxime> +++ b/configs/integrator926_defconfig
 Maxime> @@ -4,13 +4,10 @@ BR2_arm926t=y
 
 Maxime>  # Bootloader
 Maxime>  BR2_TARGET_UBOOT=y
 Maxime> -BR2_TARGET_UBOOT_BOARDNAME="cp926ejs"
 Maxime> -BR2_TARGET_UBOOT_2010_06=y
 Maxime> +BR2_TARGET_UBOOT_BOARDNAME="integratorcp_cm926ejs"
 
 Maxime>  # Kernel
 Maxime>  BR2_LINUX_KERNEL=y
 Maxime> -BR2_LINUX_KERNEL_2_6_35=
 Maxime> -BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 Maxime>  BR2_LINUX_KERNEL_DEFCONFIG="integrator"

Could you still lock the version (using custom) like we do for the qemu
defconfigs, please?

-- 
Bye, Peter Korsgaard
