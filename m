From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 13:13:10 +0200
Subject: [Buildroot] [PATCH v2] dahdi-tools: unify dependencies comments
In-Reply-To: <f00ac4110933271a8d0f4240b8ae257e31a027b7.1534498995.git.baruch@tkos.co.il>
References: <f00ac4110933271a8d0f4240b8ae257e31a027b7.1534498995.git.baruch@tkos.co.il>
Message-ID: <20180817111310.GH2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-17 12:43 +0300, Baruch Siach spake thusly:
> The threads dependency comment is currently shown even though the
> toolchain supports threads, only because kernel build is disabled.
> 
> Merge the kernel and threads comments. This is similar to what we have
> in other packages that need the kernel.

... and as described in the manual.

> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: merge the two comments
> ---
>  package/dahdi-tools/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
> index 39042df04134..a5f145dfe8cb 100644
> --- a/package/dahdi-tools/Config.in
> +++ b/package/dahdi-tools/Config.in
> @@ -15,9 +15,5 @@ config BR2_PACKAGE_DAHDI_TOOLS
>  
>  	  http://www.asterisk.org/downloads/dahdi
>  
> -# Two comments, otherwise it may not fit in menuconfig for narrow terminals
> -comment "dahdi-tools needs a toolchain w/ threads"
> +comment "dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
> -
> -comment "dahdi-tools needs a Linux kernel to be built"
> -	depends on !BR2_LINUX_KERNEL
> -- 
> 2.18.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
