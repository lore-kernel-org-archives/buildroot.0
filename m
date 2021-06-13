From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:27:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/neon: requires DES and MD4
 support in openssl
In-Reply-To: <20210612214231.655042-1-fontaine.fabrice@gmail.com>
References: <20210612214231.655042-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613072705.GN168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:42 +0200, Fabrice Fontaine spake thusly:
> Enable DES and MD4 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9145df89497df52c7124b82525b76d365aa92fc9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/neon/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/neon/Config.in b/package/neon/Config.in
> index 983134339b..d055b37607 100644
> --- a/package/neon/Config.in
> +++ b/package/neon/Config.in
> @@ -16,6 +16,8 @@ config BR2_PACKAGE_NEON_ZLIB
>  config BR2_PACKAGE_NEON_SSL
>  	bool "SSL support"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  build with SSL support
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
