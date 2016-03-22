From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:54:28 +0100
Subject: [Buildroot] [PATCH v2 2/7] boot/uboot: compute CRC on SPLs for
 Altera SoC FPGA
In-Reply-To: <1445340745-1000-3-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-3-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160322235428.48851315@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Oct 2015 13:32:20 +0200, Jan Viktorin wrote:
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  boot/uboot/Config.in | 10 ++++++++++
>  boot/uboot/uboot.mk  |  9 +++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8643dab..b2a69f3 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -338,6 +338,16 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
>  	 for u-boot-dtb.img file so this U-Boot format is required
>  	 to be set.
>  
> +config BR2_TARGET_UBOOT_SOCFPGA_IMAGE_CRC

I've added ALTERA in the option name.

> +	bool "CRC SPL image for SoC FPGA"

In the prompt.

> +	depends on BR2_arm
> +	depends on BR2_TARGET_UBOOT_SPL
> +	help
> +	  Generate SPL image fixed by the mkpimage tool to enable
> +	  booting on the SoC FPGA based platforms. The tool is
> +	  available at https://github.com/maximeh/mkpimage.
> +	  It requires a Go language compiler installed on your host.

I've tweaked this description to longer refer to Maxime's tool since
you're not using it. I've also s/SoC FPGA/Altera SoC FPGA/. SoC FPGA is
really a poor choice from Altera, since it's just two generic terms put
next to each other, so we really need to write "Altera SoC FPGA"
everywhere, otherwise it's confusing.

Applied with those things fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
