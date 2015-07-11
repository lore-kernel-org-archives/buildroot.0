From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 14:11:37 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for i.MX28 NAND
 format
In-Reply-To: <1427645447-2419-1-git-send-email-joerg.krause@embedded.rocks>
References: <1427645447-2419-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150711141137.23d3de04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 29 Mar 2015 18:10:46 +0200, J?rg Krause wrote:
> Allow to generate 'u-boot.nand', Freescale i.MX28 BootStream format (.sb)
> with a header for booting from NAND flash.
> 
> There are two possibilities when preparing an image writable to NAND flash:
> 1) The NAND was not written at all yet or the BCB (Boot Control Blocks) is
>    broken. In this case, the NAND image 'u-boot.nand' needs to written.
> 2) The NAND flash was already written with a good BCB. This applies after
>    'u-boot.nand' was correctly written. There is no need to write the BCB
>    again. In this case, the bootloader can be upgraded by writing 'u-boot.sb'.
> 
> To satisfy both cases 'u-boot.nand' as well as the make target 'u-boot.sb' are
> copied to the binaries directory.
> 
> mxsboot for NAND images needs all three parameters typed in as integer values
> (hex values do not work). The default values choosen are typical sizes for a
> NAND flash.
> 
> For more information see:
> http://www.denx-cs.de/doku/?q=m28evkrunuboot
> 
> Commit Note: This patch is based on top of
> "[PATCH v2 1/2] boot/uboot: add support for i.MX28 SD format"
> http://patchwork.ozlabs.org/patch/453116/
> 
> ---
> Changes v1 -> v2 (all suggested by Arnout Vandecappelle):
>   - Rebase on top of boot/uboot: add support for i.MX28 SD format
>     http://patchwork.ozlabs.org/patch/453116/
>   - Remove trailing whitespace
>   - Fix typo and wrapping
>   - Add an explanation like in the commit log to the help text, so the user
>     knows why he gets two images (u-boot.nand and u-boot.sb) in the binaries
>     directory
>   - Explicitly mention in mxsboots options help text that the value has to
>     be "a decimal integer value"
>   - erase -> eraseblock in BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
>   - Add dependency on host-elftosb

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
