From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Nov 2014 17:40:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cramfs: Needs zlib
In-Reply-To: <1415460586-14317-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415460586-14317-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141108164045.GA7925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-08 16:29 +0100, Bernd Kuhls spake thusly:
> cramfs.mk contains
> 
> CRAMFS_DEPENDENCIES = zlib
> 
> but this dependency was missing in Config.in.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: Changed "depends on" to "select"
> 
>  package/cramfs/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
> index daf6e6d..b2a0c6c 100644
> --- a/package/cramfs/Config.in
> +++ b/package/cramfs/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_CRAMFS
>  	bool "cramfs"
> +	select BR2_PACKAGE_ZLIB
>  	help
>  	  cramfs is a compressed read-only filesystem. This package
>  	  contains the tools to generate and check a cramfs filesystem.
> -- 
> 1.7.10.4
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
