From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:07:10 +0200
Subject: [Buildroot] [PATCH 2/2] configs/arm_juno: Point to 4.6 mainline
 kernel
In-Reply-To: <ab333dc1e75fd0650ecea52f62495b4a245425d8.1465468621.git.jpinto@synopsys.com>
References: <cover.1465468621.git.jpinto@synopsys.com>
 <ab333dc1e75fd0650ecea52f62495b4a245425d8.1465468621.git.jpinto@synopsys.com>
Message-ID: <20160609220710.45d49169@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 11:40:31 +0100, Joao Pinto wrote:

> diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
> index 5ce882c..153060a 100644
> --- a/configs/arm_juno_defconfig
> +++ b/configs/arm_juno_defconfig
> @@ -1,13 +1,12 @@
>  BR2_aarch64=y
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="4.2.2"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
> +BR2_DEFAULT_KERNEL_VERSION="4.6"

No, you should have kept using
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_Y, since this tells Buildroot
to use the kernel sources specified below for the kernel headers used
to build the toolchain.

>  BR2_TARGET_GENERIC_HOSTNAME="juno-buildroot"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno by Buildroot"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/kernel/linux-linaro-tracking.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-4.3-2015.11"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.6"

I've already applied, but when using such an official release, using
the tarball would be much more download efficient.

Applied with the kernel headers change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
