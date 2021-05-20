From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:10:21 +0200
Subject: [Buildroot] [PATCHv2] package/libopenssl: md5 is not optional
In-Reply-To: <20210519204935.2712775-1-yann.morin.1998@free.fr>
References: <20210519204935.2712775-1-yann.morin.1998@free.fr>
Message-ID: <20210520071021.GT2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2021-05-19 22:49 +0200, Yann E. MORIN spake thusly:
> Commit a83d41867c8d (package/libopenssl: add option to enable some
> features) made md5 an optional feature.
> 
> However, md5 has not been optional since 1.1.0, released in 2016.
> 
> Drop that option.
> 
> Fixes:
>    - http://autobuild.buildroot.net/results/9d79c9f313ff989449e9b47c1ff0afd3a167fd2d/
> 
> Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1-> v2:
>   - add autobuild reference
>   - fix typo
> 
> ---
>  package/libopenssl/Config.in     | 4 ----
>  package/libopenssl/libopenssl.mk | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index 7ed799075f..fcead4c11a 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -64,10 +64,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
>  	bool "enable MD4"
>  	default y
>  
> -config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5
> -	bool "enable MD5"
> -	default y
> -
>  config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
>  	bool "enable MDC2"
>  	default y
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index c7f8ae714e..389a0a8b32 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -90,7 +90,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4),,no-md4) \
> -			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5),,no-md5) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2),,no-mdc2) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2),,no-blake2) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA),,no-idea) \
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
