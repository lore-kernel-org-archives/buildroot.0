From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:14:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: add dependency to
 BR2_INSTALL_LIBSTDCPP to examples
In-Reply-To: <20210520065428.16860-1-heiko.thiery@gmail.com>
References: <20210520065428.16860-1-heiko.thiery@gmail.com>
Message-ID: <20210520071439.GU2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-05-20 08:54 +0200, Heiko Thiery spake thusly:
> The examples require libstdc++.so.6 so add the required dependency to
> the Config.in.
> 
>   ./tiger: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/imx-gpu-viv/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 6668ee8bb5..ca46c5036f 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -84,11 +84,17 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
>  
>  config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
>  	bool "install examples"
> +	# example binaries are linked against libstdc++.so.6
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  Copy the Vivante examples to the target.
>  
>  	  Warning: examples take approximately 150 MB of disk space.
>  
> +comment "imx-gpu-viv-examples need a toolchain w/ C++ support"
> +    depends on !BR2_INSTALL_LIBSTDCPP
> +
> +
>  config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
>  	bool "install gmem_info tool"
>  	help
> -- 
> 2.30.0
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
