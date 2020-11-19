From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2020 19:40:00 +0100
Subject: [Buildroot] [PATCH v1] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
In-Reply-To: <20201117212519.7559-1-ps.report@gmx.net>
References: <20201117212519.7559-1-ps.report@gmx.net>
Message-ID: <20201119184000.GM771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-11-17 22:25 +0100, Peter Seiderer spake thusly:
> Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
> 'depends on BR2_m68k' to 'depends on !BR2_m68k'.

Uh-oh... My bad...

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index aadea56d19..b9c243084e 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	bool
>  	default y
>  	# Invalid packing size of ControlValue struct on m68k
> -	depends on BR2_m68k
> +	depends on !BR2_m68k
>  
>  menuconfig BR2_PACKAGE_LIBCAMERA
>  	bool "libcamera"
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
