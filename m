From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 11:32:50 +0100
Subject: [Buildroot] [PATCH] kexec: disable on unsupported architectures
In-Reply-To: <1353053588-5156-1-git-send-email-spdawson@gmail.com>
References: <1353053588-5156-1-git-send-email-spdawson@gmail.com>
Message-ID: <20121116113250.10aa952d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Fri, 16 Nov 2012 08:13:08 +0000, spdawson at gmail.com wrote:
> diff --git a/package/kexec/Config.in b/package/kexec/Config.in
> index e59a07b..fe50e06 100644
> --- a/package/kexec/Config.in
> +++ b/package/kexec/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_KEXEC
>  	bool "kexec"
> -	depends on !BR2_avr32
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_sh3
>  	help
>  	  Kexec is a user space utiltity for loading another kernel
>  	  and asking the currently running kernel to do something with it.

Provided the line gets split to ~80 characters:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
