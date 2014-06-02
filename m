From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Jun 2014 14:40:54 +0300
Subject: [Buildroot] [PATCH] rpm: needs mmu
In-Reply-To: <1401709003-29184-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401709003-29184-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140602114054.GC4473@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Jun 02, 2014 at 08:36:43AM -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/7fa/7fa2bd8e464c6708095ec4038b6f3d534b10dd82/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rpm/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index de06141..95cda38 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -4,6 +4,7 @@ comment "rpm needs a toolchain w/ threads"
>  config BR2_PACKAGE_RPM
>  	bool "rpm"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
> +	depends on BR2_USE_MMU # fork()

Please update the comment dependencies.

baruch

>  	select BR2_PACKAGE_BEECRYPT
>  	select BR2_PACKAGE_POPT
>  	select BR2_PACKAGE_OPENSSL

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
