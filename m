From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:31:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/pppd: requires DES support in
 openssl
In-Reply-To: <20210612214720.655521-1-fontaine.fabrice@gmail.com>
References: <20210612214720.655521-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613073135.GO168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:47 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3cd38e6dfd5f94f0bd1689e7db4ea1d723dd2a80
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pppd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
> index 7db5674bf1..3e7759c87c 100644
> --- a/package/pppd/Config.in
> +++ b/package/pppd/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PPPD
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL

That is not sufficient: the openssl is only selected for glibc-based
toolchains, so we should not enable the option otherwise.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  An implementation of the Point-to-point protocol.
>  
> -- 
> 2.30.2
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
