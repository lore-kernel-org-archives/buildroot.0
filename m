From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:07:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: requires MD4,
 RC4 and RMD160 support in openssl
In-Reply-To: <20210613145252.1461896-1-fontaine.fabrice@gmail.com>
References: <20210613145252.1461896-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613200728.GZ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-13 16:52 +0200, Fabrice Fontaine spake thusly:
> Enable MD4, RC4 and RMD160 in openssl to fix build failure raised since
> commit a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bd884a34e8de8990fc85bf51389ec4d8d3424482
>  - http://autobuild.buildroot.org/results/faaa667b72ca7b8621d6b13b1912cd5413767222
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/Config.ext | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 44afea010b..1e8ca495a7 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -92,6 +92,9 @@ config BR2_PACKAGE_PHP_EXT_MCRYPT
>  config BR2_PACKAGE_PHP_EXT_OPENSSL
>  	bool "openssl"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  openssl support
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
