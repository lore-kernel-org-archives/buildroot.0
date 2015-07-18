From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:19:03 +0200
Subject: [Buildroot] [PATCH v4 4/7] boot/uboot: Generate BOOT.BIN file
 when building for Xilinx Zynq
In-Reply-To: <20150714171602.6e5b5bda@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171602.6e5b5bda@pcviktorin.fit.vutbr.cz>
Message-ID: <20150718231903.0e0252c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Tue, 14 Jul 2015 17:16:02 +0200, Jan Viktorin wrote:
> This commit integrates generation of a bootable image
> for Xilinx Zynq. The generation is independent on Xilinx
> flow and utilizes the host-zynq-boot-bin package. The only
> required step is to generate a proper U-Boot SPL (instead
> of the FSBL).
> 
> The SPL generation might work when providing the working
> ps7_init.c file to U-Boot. However, from U-Boot 2015.07
> a set of generic ps7_init.c files is included and used to
> build the U-Boot SPL for various boards. The ps7_init.c file
> has been released under GNU/GPL license for this purpose.
> For details, see
> 
> http://lists.denx.de/pipermail/u-boot/2015-April/210664.html
> 
> The SPL searchs for u-boot-dtb.img when booting so we
> enforce using of the BR2_TARGET_UBOOT_FORMAT_DTB_IMG format.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  boot/uboot/Config.in | 13 +++++++++++++
>  boot/uboot/uboot.mk  | 10 ++++++++++
>  2 files changed, 23 insertions(+)

I've made one change:

    [Thomas: remove select of BR2_PACKAGE_HOST_ZYNQ_BOOT_BIN, since this
    option no longer exists.]
    
and applied the patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
