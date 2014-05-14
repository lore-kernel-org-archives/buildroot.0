From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 May 2014 21:38:16 +0300
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: needs MMU (fork)
In-Reply-To: <1400092133-16971-2-git-send-email-bernd.kuhls@t-online.de>
References: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
 <1400092133-16971-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140514183816.GI4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Wed, May 14, 2014 at 08:28:53PM +0200, Bernd Kuhls wrote:
> fixes http://autobuild.buildroot.net/results/5c0/5c03bf3a1e4e922a18b40f854ff59d905a93a89f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rsyslog/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
> index 8a84fea..82a6922 100644
> --- a/package/rsyslog/Config.in
> +++ b/package/rsyslog/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_RSYSLOG
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_LARGEFILE # util-linux
> +	depends on BR2_USE_MMU # fork()

Please also update the dependencies comment.

baruch

>  	depends on BR2_USE_WCHAR # util-linux
>  	help
>  	  Rsyslog is a powerful and flexible syslog implementation
> -- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
