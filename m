From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Mon, 03 Nov 2008 21:48:24 +0900
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <20081030094501.66983ff9@surf>
References: <20081030094501.66983ff9@surf>
Message-ID: <490EF318.5030004@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
>  * Change the description and help message of the BR2_LARGEFILE,
>    BR2_INET_IPV6, BR2_INET_RPC, and BR2_SOFT_FLOAT option in
>    toolchain/external-toolchain/Config.in. In the case of an external
>    toolchain, the semantic of these options is not to enable large
>    file support, IPV6 or RPC (since the toolchain is already compiled,
>    it has been decided previously). Their semantic is to let Buildroot
>    know about the characteristics of the external toolchain being
>    used.

[snip]

> Index: buildroot/toolchain/external-toolchain/Config.in
> ===================================================================
> --- buildroot.orig/toolchain/external-toolchain/Config.in
> +++ buildroot/toolchain/external-toolchain/Config.in
> @@ -69,32 +69,29 @@
>  endchoice
>  
>  config BR2_LARGEFILE
> -	bool "Enable large file (files > 2 GB) support?"
> +	bool "Toolchain supports large files (> 2 GB) ?"
>  	depends on !BR2_cris
>  	default y
>  	help
> -	  Enable large file (files > 2 GB) support
> +	  Set this option if the external toolchain supports large
> +	  files (> 2 GB)
> +
>  
>  config BR2_INET_IPV6
> -	bool "Enable IPv6"
> +	bool "Toolchain supports IPv6 ?"
>  	help
> -	    Enable IPv6.
> +	  Set this option if the external toolchain supports IPv6.
>  
>  config BR2_INET_RPC
> -	bool "Enable RPC"
> +	bool "Toolchain supports RPC ?"
>  	help
> -	    Enable RPC. RPC support is needed for nfs.
> +	  Set this option if the external toolchain supports RPC.
>  
>  config BR2_SOFT_FLOAT
> -	bool "Use software floating point by default"
> +	bool "Toolchain supports soft float ?"
>  	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
>  	help
> -	  If your target CPU does not have a Floating Point Unit (FPU) or a
> -	  kernel FPU emulator, but you still wish to support floating point
> -	  functions, then everything will need to be compiled with soft
> -	  floating point support (-msoft-float).
> -
> -	  Most people will answer N.
> +	  Set this option if the external toolchain supports soft float.
>  
>  config BR2_TARGET_OPTIMIZATION
>  	string "Target Optimizations"

Why did you change these help text?  The previous messages seemed to be
better, at least for me.  These options should be enabled based on what
we want to do, not based on the toolchain's capabilities.

I know that we share the same recognition of course, but current
"Toolchain supports XXX?" feels somewhat misleading.

Thanks,

  Shinya
