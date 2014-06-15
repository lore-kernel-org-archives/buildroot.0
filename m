From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 10:41:18 +0300
Subject: [Buildroot] [PATCH 2/2] hostapd: disable for avr32
In-Reply-To: <717bd918392d0e89e911a125e21bbfd2b9261d2b.1402814913.git.baruch@tkos.co.il>
References: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
 <717bd918392d0e89e911a125e21bbfd2b9261d2b.1402814913.git.baruch@tkos.co.il>
Message-ID: <20140615074118.GB31459@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Sun, Jun 15, 2014 at 09:48:33AM +0300, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/hostapd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index eb530b3..5b57544 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOSTAPD
>  	bool "hostapd"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +	depends on !BR2_avr32 # no epoll_create1

Actually, this is not needed. Current hostapd Makefile does not support 
CONFIG_ELOOP_EPOLL, so select() is used for eloop. I'll mark this patch as 
Rejected on patchwork.

baruch

>  	select BR2_PACKAGE_LIBNL
>  	help
>  	  User space daemon for wireless access points.
> @@ -27,3 +28,4 @@ endif
>  
>  comment "hostapd needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_avr32

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
