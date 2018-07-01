From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jul 2018 10:54:04 +0200
Subject: [Buildroot] [PATCH] network-manager: sync kernel headers
 comment with actual dependency
In-Reply-To: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
References: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180701085404.GA2381@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-07-01 00:19 +0200, Thomas Petazzoni spake thusly:
> In commit 52282828f06dc8aa3f721727f68a5096b9ed8b49
> ("package/network-manager: add patches to build with kernel headers
> 3.2"), network-manager was changed to build with kernel headers as old
> as 3.2, instead of 3.7 before. The dependency was changed accordingly,
> but the Config.in comment was not.
> 
> This commit fixes this inconsistency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/network-manager/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 9602cc4a1a..ca508185f0 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -64,8 +64,8 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
>  
>  endif
>  
> -comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
> +comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_PACKAGE_HAS_UDEV || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
>  		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
> -- 
> 2.14.4
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
