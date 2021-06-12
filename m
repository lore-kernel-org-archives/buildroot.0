From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:32:50 +0200
Subject: [Buildroot] [PATCH/next] package/freerdp: needs rc4 from
 libopenssl
In-Reply-To: <20210606075932.1242642-1-yann.morin.1998@free.fr>
References: <20210606075932.1242642-1-yann.morin.1998@free.fr>
Message-ID: <20210612123250.GW168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-06 09:59 +0200, Yann E. MORIN spake thusly:
> Fixes:
>     http://autobuild.buildroot.org/results/b21b21a66bef2bc09231e475037a8f9be5584fa4/
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freerdp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> index 5705ce0e0c..14c5f98671 100644
> --- a/package/freerdp/Config.in
> +++ b/package/freerdp/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_FREERDP
>  	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_LIBGLIB2
>  	help
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
