From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Oct 2015 23:06:23 +0100
Subject: [Buildroot] [PATCH v3 2/4] package/kodi-pvr-argustv: add
 jsoncpp reverse dependency
In-Reply-To: <1443803497-9936-2-git-send-email-bernd.kuhls@t-online.de>
References: <1443803497-9936-1-git-send-email-bernd.kuhls@t-online.de>
 <1443803497-9936-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151002220623.GC4284@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-10-02 18:31 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3: removed reference to c++ from comment (Baruch)
> v2: added missing "select BR2_PACKAGE_JSONCPP" (Baruch)
> 
>  package/kodi-pvr-argustv/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
> index 698ff46..247d83c 100644
> --- a/package/kodi-pvr-argustv/Config.in
> +++ b/package/kodi-pvr-argustv/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_KODI_PVR_ARGUSTV
>  	bool "kodi-pvr-argustv"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> +	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  Kodi's ARGUS TV client addon
>  
>  	  https://github.com/kodi-pvr/pvr.argustv
> +
> +comment "kodi-pvr-argustv needs a toolchain w/ gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> -- 
> 2.5.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
