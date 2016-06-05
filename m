From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 5 Jun 2016 12:23:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/wiringpi: uses fork(), needs mmu
In-Reply-To: <1465061225-26087-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465061225-26087-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160605122335.76c31e23@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat,  4 Jun 2016 19:27:05 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/c60/c6013c214674f9802309d8cd770d3da2f751674d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wiringpi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
> index 9275b82..a292b3f 100644
> --- a/package/wiringpi/Config.in
> +++ b/package/wiringpi/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WIRINGPI
>  	bool "wiringpi"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  wiringPi libraries (and gpio command)
>  

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Thanks for spotting (and fixing) it...

Regards,
Peter
