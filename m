From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 12:43:58 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: select
 BR2_PACKAGE_RPCBIND only if needed
In-Reply-To: <20201116114033.844188-1-angelo@amarulasolutions.com>
References: <20201116114033.844188-1-angelo@amarulasolutions.com>
Message-ID: <20210103114358.GN2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-11-16 12:40 +0100, Angelo Compagnucci spake thusly:
> rpcbind is only used by nfsd to export nfs share supporting older
> v2, v3 protocols.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/nfs-utils/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index cfca034019..36d799486a 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_NFS_UTILS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
> -	select BR2_PACKAGE_RPCBIND # runtime
> +	select BR2_PACKAGE_RPCBIND if BR2_PACKAGE_NFS_UTILS_RPC_NFSD # runtime# runtime

Then why is the select not moved to the BR2_PACKAGE_NFS_UTILS_RPC_NFSD
symbol itself?

Also, duplicated comment...

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  The NFS Linux kernel server.
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
