From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jul 2015 22:38:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150726193803.GB17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Sun, Jul 26, 2015 at 06:35:11PM +0100, Brendan Heading wrote:
> exfat-utils build would not build on Linux unless __GLIBC__ was defined.
> Reworked header file to relax this requirement in favour of other libcs.
> patch submitted to the exfat-utils mailing list for comment.
> 
> Also added missing dependency - exfat requires libfuse.
> 
> See http://autobuild.buildroot.net/results/c60/c60d0f9a93c90d41c3c86c78b0a0
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---

[snip]

> diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
> index aedff5f..ead5d47 100644
> --- a/package/exfat-utils/Config.in
> +++ b/package/exfat-utils/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_EXFAT_UTILS
>  	bool "exfat-utils"
> +	select BR2_PACKAGE_LIBFUSE
>  	depends on BR2_USE_WCHAR

Please propagate BR2_PACKAGE_LIBFUSE dependencies.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
