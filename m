From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:06:40 +0200
Subject: [Buildroot] [PATCH v2 1/9] configs: update at91sam9g45m10ek
 defconfig
In-Reply-To: <1431544977-2274-2-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1431544977-2274-2-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20150518230640.376e0748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

On Wed, 13 May 2015 21:22:49 +0200, Alexandre Belloni wrote:
> Use kernel (3.18) and u-boot (2015.01) from Atmel's repositories.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  configs/at91sam9g45m10ek_defconfig | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
> index c958859df1a3..147789d165df 100644
> --- a/configs/at91sam9g45m10ek_defconfig
> +++ b/configs/at91sam9g45m10ek_defconfig
> @@ -1,9 +1,21 @@
>  BR2_arm=y
>  BR2_arm926t=y
> -BR2_PACKAGE_HOST_SAM_BA=y
> -BR2_TARGET_AT91BOOTSTRAP=y
> -BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9m10g45ek"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"

You also need to ensure that the kernel headers used for the toolchain
are of the same version or older than the kernel you're
building/running.

So, something like:

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.18"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y

And ditto for all your other defconfigs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
