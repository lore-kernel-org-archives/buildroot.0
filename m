From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Jul 2014 12:32:00 +0300
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
In-Reply-To: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
References: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
Message-ID: <20140701093200.GL4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Tue, Jul 01, 2014 at 01:15:29PM +0400, Alexander Potashev wrote:
> Signed-off-by: Alexander Potashev <a.potashev@geoscan.aero>
> ---
>  package/wget/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wget/Config.in b/package/wget/Config.in
> index 26a2019..fc7ee26 100644
> --- a/package/wget/Config.in
> +++ b/package/wget/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_WGET
>  	# fork()
>  	depends on BR2_USE_MMU
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID

Care to explain why this is needed?

Also, you forgot to copy here the BR2_LARGEFILE dependency of util-linux.

baruch

>  	help
>  	  Network utility to retrieve files from http, https and ftp.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
