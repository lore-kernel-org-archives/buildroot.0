From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:34:33 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI
 am335x-evm_sgx-qt5
In-Reply-To: <1471284800-17046-1-git-send-email-lothar.felten@gmail.com>
References: <1471284800-17046-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160918193433.67e76b34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 20:13:20 +0200, Lothar Felten wrote:
> Add a target configuration for the ti am335x-evm that supports the SGX530
> graphics acceleration and builds the qt5 demos with the eglfs backend.
> The imagination technologies demos and fbv are also included.
> The linux kernel is based on the omap2plus defconfig, a config fragment
> adds the required settings for SGX accelerator support.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

This looks good, but I have the same comments as the
am335x_evm_defconfig: i.e does it really supports multiple boards.

Also, I believe it would be useful to reference this defconfig in the
readme.txt file added in the previous patch.

Both patches should be sent in a series, since this patch depends on
the first one.

>  board/ti/am335x-evm/linux-4.1-sgx.fragment | 12 ++++++++++

Great idea to use a config fragment here.

>  configs/am335x-evm_sgx-qt5_defconfig       | 38 ++++++++++++++++++++++++++++++

Please this am335x_evm_sqx_qt5_deconfig

> diff --git a/configs/am335x-evm_sgx-qt5_defconfig b/configs/am335x-evm_sgx-qt5_defconfig
> new file mode 100644
> index 0000000..2c76ab0
> --- /dev/null
> +++ b/configs/am335x-evm_sgx-qt5_defconfig
> @@ -0,0 +1,38 @@
> +BR2_arm=y
> +BR2_cortex_a8=y
> +BR2_GLOBAL_PATCH_DIR="board/ti/am335x-evm/patches"
> +BR2_KERNEL_HEADERS_4_1=y

Please use the "headers from the kernel source" option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
