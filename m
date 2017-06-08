From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 Jun 2017 12:51:12 +0300
Subject: [Buildroot] [PATCH] package/qt: enable static build for
 BR2_PACKAGE_QT_MOUSE_TSLIB
In-Reply-To: <20170608090259.28894-1-martin.kepplinger@ginzinger.com>
References: <20170608090259.28894-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170608095112.f7z7hnyi4m7vmzta@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Thu, Jun 08, 2017 at 11:02:59AM +0200, Martin Kepplinger wrote:
> The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
> static builds. But since
> 
>    commit 05fadfea1 ("package/tslib: enable statically linked building")
> 
> it does and we can remove this dependecy.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
>  package/qt/Config.mouse.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
> index 07573ebb8..eb9d2c0c2 100644
> --- a/package/qt/Config.mouse.in
> +++ b/package/qt/Config.mouse.in
> @@ -11,7 +11,6 @@ config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
>  
>  config BR2_PACKAGE_QT_MOUSE_TSLIB
>  	bool "tslib"
> -	depends on !BR2_STATIC_LIBS # tslib
>  	select BR2_PACKAGE_TSLIB
>  
>  comment "tslib support needs a toolchain w/ dynamic library"

This comment is not correct anymore.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
