From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:53:42 +0200
Subject: [Buildroot] [PATCH v5 2/4] configs/andes_nds32_ae3xx: new
 defconfig
In-Reply-To: <20190416072545.17633-3-nylon7@andestech.com>
References: <20190416072545.17633-1-nylon7@andestech.com>
 <20190416072545.17633-3-nylon7@andestech.com>
Message-ID: <20190417095342.7f3c813d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Apr 2019 15:25:43 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Add Andes 32-bit defconfig for AE3XX platform.
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>

The commit title was not matching the name of the defconfig file being
added, so I fixed that up.

> diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
> new file mode 100644
> index 0000000000..250e3ee157
> --- /dev/null
> +++ b/configs/andes_ae3xx_defconfig
> @@ -0,0 +1,14 @@
> +BR2_nds32=y
> +BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="nds32le-linux"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y

This should have used the external toolchain package that you added, so
I fixed that as well.

Applied with those two issues fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
