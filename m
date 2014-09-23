From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:21:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/xbmc: add option to enable libva
In-Reply-To: <1410090876-18822-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410090876-18822-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140923222147.4f84df00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Sep 2014 13:54:35 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/Config.in |    7 +++++++
>  package/xbmc/xbmc.mk   |    2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)

Applied, but I had to make one change, see below.

> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index ed0d4ed..3eda3b2 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -210,6 +210,13 @@ config BR2_PACKAGE_XBMC_LIBUSB
>  	help
>  	  Enable libusb support.
>  
> +config BR2_PACKAGE_XBMC_LIBVA
> +	bool "va"
> +	select BR2_PACKAGE_LIBVA
> +	depends on !BR2_PREFER_STATIC_LIB

This option has a new toolchain dependency, but you forgot the
corresponding comment. I added it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
