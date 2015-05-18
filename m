From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 May 2015 08:52:57 +0300
Subject: [Buildroot] [PATCH 1/1] wvstreams: not available for static
 only builds
In-Reply-To: <1431928065-20878-1-git-send-email-imrehg@gmail.com>
References: <1431928065-20878-1-git-send-email-imrehg@gmail.com>
Message-ID: <20150518055256.GI2845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gergely,

On Mon, May 18, 2015 at 05:47:55AM +0000, Gergely Imreh wrote:
> diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
> index 3080dc7..0cbe60a 100644
> --- a/package/wvstreams/Config.in
> +++ b/package/wvstreams/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_WVSTREAMS
>  	bool "wvstreams"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS

You need to propagate this to packages selecting BR2_PACKAGE_WVSTREAMS. In 
this case only wvdial seems to be affected.

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
