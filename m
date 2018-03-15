From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Mar 2018 22:24:44 +0200
Subject: [Buildroot] [PATCH] wine: Depend on shared libraries
In-Reply-To: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
References: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180315202444.sxjgx46inqbgt32v@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

On Thu, Mar 15, 2018 at 08:45:54PM +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/wine/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> index 627a9a7..52d7d2e 100644
> --- a/package/wine/Config.in
> +++ b/package/wine/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WINE
>  	bool "wine"
> +	depends on !BR2_STATIC_LIBS

A dependency comment would be nice.

baruch

>  	# Wine only builds on certain architectures
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
>  	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
