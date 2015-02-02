From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 10:31:16 +0100
Subject: [Buildroot] [RFC 6/8] Makefile: remove uclibc, barebox, linux,
 busybox specific help
In-Reply-To: <1422394913-13257-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150202093116.GF4918@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On 2015-01-27 22:41 +0100, Thomas Petazzoni spake thusly:
> Now that each package has its own custom help text, there is no need
> to have those busybox, linux, uclibc and barebox specific targets
> mentionned in the main help text.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6cee027..1e5390b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -868,20 +868,6 @@ help:
>  	@echo '  randpackageconfig      - New config with random answer to package options'
>  	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
>  	@echo '  allnopackageconfig     - New config where package options are answered with no'
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
> -endif
> -ifeq ($(BR2_LINUX_KERNEL),y)
> -	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
> -	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
> -endif
> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
> -endif
> -ifeq ($(BR2_TARGET_BAREBOX),y)
> -	@echo '  barebox-menuconfig     - Run barebox menuconfig'
> -	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
> -endif
>  	@echo
>  	@echo 'Documentation:'
>  	@echo '  manual                 - build manual in all formats'
> -- 
> 2.1.0
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
