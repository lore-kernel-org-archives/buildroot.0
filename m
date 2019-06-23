From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:32:35 +0200
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020: Bump Linux
 and U-Boot
In-Reply-To: <20190618203203.14575-1-oleks@arcturusnetworks.com>
References: <20190618203203.14575-1-oleks@arcturusnetworks.com>
Message-ID: <20190623173235.49d4b079@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oleksandr,

On Tue, 18 Jun 2019 16:32:03 -0400
Oleksandr Zhadan <oleks@arcturusnetworks.com> wrote:

> Bump Linux and U-Boot versions.
> 
> Linux dot_config and patches is no longer needed.
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>

I've applied, after doing one change. See below.

>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.27"
> -BR2_LINUX_KERNEL_PATCH="board/arcturus/ppc-ucp1020/patches/linux"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-kernel,v20190618)/linux-v20190618.tar.gz"

You're using a tarball download for the kernel, which is good.

> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ArcturusNetworks/uCP1020-uboot.git"

But a Git download for U-Boot, while you could have also used a tarball
download, exactly like for the kernel.

So I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
