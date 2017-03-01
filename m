From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 1 Mar 2017 22:08:59 +0100
Subject: [Buildroot] [git commit] linux-headers: bump to 4.10 kernel
 version
In-Reply-To: <20170301170422.EA26B80279@busybox.osuosl.org>
References: <20170301170422.EA26B80279@busybox.osuosl.org>
Message-ID: <20170301220859.7de79d6a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Fabio,

On Mon, 20 Feb 2017 21:56:41 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=1cc0c0dc82b62433d697f8dc811ed8ce3b51daea
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linux-headers/Config.in.host | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index b1d117a..3610426 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
>  choice
>  	prompt "Kernel Headers"
>  	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
> -	default BR2_KERNEL_HEADERS_4_9
> +	default BR2_KERNEL_HEADERS_4_10
>  	help
>  	  Select the kernel version to get headers from.
>  
> @@ -67,6 +67,10 @@ choice
>  		bool "Linux 4.9.x kernel headers"
>  		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
>  
> +	config BR2_KERNEL_HEADERS_4_10
> +		bool "Linux 4.10.x kernel headers"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> +
>  	config BR2_KERNEL_HEADERS_VERSION
>  		bool "Manually specified Linux version"
>  endchoice
> @@ -87,6 +91,10 @@ choice
>  	  This is used to hide/show some packages that have strict
>  	  requirements on the version of kernel headers.
>  
> +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10
> +	bool "4.10.x"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> +
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9
>  	bool "4.9.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> @@ -224,5 +232,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
>  	default "4.4.48"	if BR2_KERNEL_HEADERS_4_4
>  	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
> -	default "4.9.9"		if BR2_KERNEL_HEADERS_4_9
> +	default "4.10"		if BR2_KERNEL_HEADERS_4_10

Is the removing of the 4.9.9. line intended? Would have expected only the
added 4.10 line...

Regards,
Peter

>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
