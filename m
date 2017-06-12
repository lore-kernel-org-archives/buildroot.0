From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:20:56 +0200
Subject: [Buildroot] [PATCH v4] board: Add support for Engicam i.CoreM6
 Quad/Dual boards
In-Reply-To: <1497291701-17509-1-git-send-email-jteki@openedev.com>
References: <1497291701-17509-1-git-send-email-jteki@openedev.com>
Message-ID: <20170612232056.322e2dd7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 23:51:41 +0530, Jagan Teki wrote:

> diff --git a/configs/engicam_imx6q_icore_defconfig b/configs/engicam_imx6q_icore_defconfig
> new file mode 100644
> index 0000000..2412f19
> --- /dev/null
> +++ b/configs/engicam_imx6q_icore_defconfig
> @@ -0,0 +1,38 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_VFPV3=y

One thing was missing here:

# Linux headers same as kernel, a 4.11 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y

This is necessary, otherwise as soon as we add support for Linux 4.12,
the toolchain would be built with Linux headers 4.12... but your
defconfig would still be using Linux 4.11 as the running kernel.

So in all defconfigs, we explicitly set the version of the kernel
headers being used.

Other than that: applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
