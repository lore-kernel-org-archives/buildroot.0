From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 11:09:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/sunxi-boards: needs host gcc >=
 4.9
In-Reply-To: <20210115063149.2072523-1-fontaine.fabrice@gmail.com>
References: <20210115063149.2072523-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117100912.GC2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-15 07:31 +0100, Fabrice Fontaine spake thusly:
> Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate the
> host gcc dependency from host-sunxi-tools to sunxi-boards
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22fc93746b45a197cd64bfd116edb33494756bda
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sunxi-boards/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
> index d9fd8529f3..eaf492f2b2 100644
> --- a/package/sunxi-boards/Config.in
> +++ b/package/sunxi-boards/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SUNXI_BOARDS
>  	bool "sunxi script.bin board file"
>  	depends on BR2_arm
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-sunxi-tools
>  	select BR2_PACKAGE_HOST_SUNXI_TOOLS
>  	help
>  	  Sunxi-boards requires a compiled .fex files for hardware
> @@ -23,3 +24,7 @@ config BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE
>  	  See inside sys_config/ directory in sunxi-boards source code
>  	  to see the list of valid .fex files.
>  endif
> +
> +comment "sunxi script.bin board file needs a toolchain w/ host gcc >= 4.9"
> +	depends on BR2_arm
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> -- 
> 2.29.2
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
