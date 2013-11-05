From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Nov 2013 18:12:16 +0200
Subject: [Buildroot] [PATCH v2] sconeserver: Can't be built with uClibc.
In-Reply-To: <1383665533-2430-1-git-send-email-sonic.adi@gmail.com>
References: <1383665533-2430-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20131105161215.GB20511@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sonic,

On Tue, Nov 05, 2013 at 11:32:13PM +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> General shadow password file API such as getspnam is not supported in uClibc.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/sconeserver/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
> index 58c1e03..72aa17c 100644
> --- a/package/sconeserver/Config.in
> +++ b/package/sconeserver/Config.in
> @@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
>  	bool "sconeserver"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

Please add a comment explaining this dependency. Something like:

	depends on !BR2_TOOLCHAIN_USES_UCLIBC # getspnam()

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
