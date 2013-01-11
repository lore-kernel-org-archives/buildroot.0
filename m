From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 Jan 2013 11:57:12 +0200
Subject: [Buildroot] [PATCH] mtd: add options to build flash_otp_unlock
 and flash_otp_write
In-Reply-To: <1357897708-20616-1-git-send-email-arnout@mind.be>
References: <1357897708-20616-1-git-send-email-arnout@mind.be>
Message-ID: <20130111095711.GD4162@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Jan 11, 2013 at 10:48:28AM +0100, Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/mtd/Config.in |    6 ++++++
>  package/mtd/mtd.mk    |    2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 7330dd5..ddc3737 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -30,6 +30,12 @@ config BR2_PACKAGE_MTD_FLASH_OTP_DUMP
>  config BR2_PACKAGE_MTD_FLASH_OTP_INFO
>  	bool "flash_otp_info"
>  
> +config BR2_PACKAGE_MTD_FLASH_OTP_LOCK
> +	bool "flash_otp_lock"
> +
> +config BR2_PACKAGE_MTD_FLASH_OTP_WRITE
> +	bool "flash_otp_write"
> +
>  config BR2_PACKAGE_MTD_FLASH_UNLOCK
>  	bool "flash_unlock"
>  	default y
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index aef478f..c48b59f 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -38,6 +38,8 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
> +MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_lock

$(BR2_PACKAGE_MTD_FLASH_OTP_LOCK)?

> +MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_write

$(BR2_PACKAGE_MTD_FLASH_OTP_WRITE)?

>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
>  MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
