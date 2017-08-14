From: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@gmail.com>
Date: Mon, 14 Aug 2017 07:21:05 +0200
Subject: [Buildroot] [PATCH] socrates_cyclone5_defconfig: U-Boot needs
	DTC
In-Reply-To: <20170813232524.17775-1-arnout@mind.be>
References: <20170813232524.17775-1-arnout@mind.be>
Message-ID: <852592dd-c7b9-b33d-603d-67fb83645c03@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

W dniu 14.08.2017 o 01:25, Arnout Vandecappelle (Essensium/Mind) pisze:
> Probably not noticed before because dtc was already built or it was
> installed on the host.
> 
> Fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979369
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> ---
>  configs/socrates_cyclone5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
> index 5793458b74..45355c1b85 100644
> --- a/configs/socrates_cyclone5_defconfig
> +++ b/configs/socrates_cyclone5_defconfig
> @@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
>  BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
> 


Hi, I tested it on clear buildroot (clone -> patch -> make) and yes, I
have dtc installed on my host. Thanks for catching that!

-- 
Best Regards
Micha? ?yszczek

-- 
Z wyrazami szacunku
?yszczek Micha?
+48-727-564-419

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170814/6111f186/attachment.asc>
