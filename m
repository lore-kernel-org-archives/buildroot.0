From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Wed, 06 Feb 2019 00:12:57 +0100
Subject: [Buildroot] [PATCH v2] configs/rock64: new defconfig
In-Reply-To: <20190205230758.17059-1-michal.lyszczek@bofc.pl>
References: <20190205230758.17059-1-michal.lyszczek@bofc.pl>
Message-ID: <20190205231257.h53ptsaywzypvpv6@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-02-06 00:07:58, Micha? ?yszczek wrote:
> Configuration contains:
>   - building tpl, spl and u-boot (forked u-boot repository)
>   - booting from SD card and network via PXE
>   - working ethernet, usb and uart
>   - minimal rootfs with busybox
>   - ready to flash SD card image
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2:
>   - add entry to DEVELOPERS file
>   - use proper format for included .patch file
>   - make use of BR2_GLOBAL_PATCH_DIR
>   - add board homepage to readme.txt
>   - use BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19 instead of
>     BR2_KERNEL_HEADERS_4_19
>   - use fixed version of ATF instead of latest one
>   - refresh .gitlab-ci.yml

Note: this patch requires 2 more patches that were not yet merged:

boot/arm-trusted-firmware: add new version
    https://patchwork.ozlabs.org/patch/1037225/

uboot: add support for bundling ATF BL31 in ELF format into U-Boot
    https://patchwork.ozlabs.org/patch/996196/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190206/298b8a57/attachment.asc>
