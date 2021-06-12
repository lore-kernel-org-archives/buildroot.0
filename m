From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:32:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtorrent: requires RC4
 support in openssl
In-Reply-To: <20210609165837.78559-1-fontaine.fabrice@gmail.com>
References: <20210609165837.78559-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612123231.GV168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-09 18:58 +0200, Fabrice Fontaine spake thusly:
> Enable RC4 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c909fedb5f59d8a434a3bde469155ff550615e3c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libtorrent/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
> index 4787f9c60d..de6487a758 100644
> --- a/package/libtorrent/Config.in
> +++ b/package/libtorrent/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBTORRENT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  BitTorrent library written in C++ for *nix
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
