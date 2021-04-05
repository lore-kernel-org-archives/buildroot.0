From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 10:59:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: AD DC support needs ADS
In-Reply-To: <20210404172858.1514191-1-bernd.kuhls@t-online.de>
References: <20210404172858.1514191-1-bernd.kuhls@t-online.de>
Message-ID: <20210405105925.6082f6f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Apr 2021 19:28:58 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index e890313b71..db7783949a 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -31,14 +31,15 @@ if BR2_PACKAGE_SAMBA4
>  config BR2_PACKAGE_SAMBA4_AD_DC
>  	bool "AD DC"
>  	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_SAMBA4_ADS

I've replaced this "depends on" by a "select" and dropped the Config.in
comment. And of course, applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
