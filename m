From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 21:36:26 +0100
Subject: [Buildroot] [PATCH 44/44] linux-firmware: fix typo in config
 file.
In-Reply-To: <20170206202457.31527-45-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
 <20170206202457.31527-45-aduskett@codeblue.com>
Message-ID: <20170206213626.7c542008@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 15:24:57 -0500, Adam Duskett wrote:
> Currently the help for the Chelsio T5 has (cxgb4).
> I changed this to (cxgb5)
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/linux-firmware/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 48af36a..f05201f 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -378,7 +378,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
>  config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
>  	bool "Chelsio T5"
>  	help
> -	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
> +	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb5)

Why? The option is named BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5 so it
seems like it's cxgb4 related. What makes you think it should be
changed to cxgb5, which is a non-existing Linux kernel driver.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
