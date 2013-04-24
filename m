From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 21:41:58 +0200
Subject: [Buildroot] [PATCH v2 10/12] kernel-headers: Add 3.9-rc8
	headers to make ARC work
In-Reply-To: <1366798403-6984-11-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Wed, 24 Apr 2013 12:13:21 +0200")
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <1366798403-6984-11-git-send-email-mjonker@synopsys.com>
Message-ID: <87txmvbtrt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> Add 3.9 release candidate kernel, so that the ARC architecture builds.
 Mischa> Also make sure that older kernels are not selected for ARC.

The final 3.9 is supposed to be released by the end of the week, so I
would prefer to not add -rc8.


 Mischa> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
 Mischa> ---
 Mischa>  Makefile                           |    1 +
 Mischa>  toolchain/kernel-headers/Config.in |   18 +++++++++++++-----
 Mischa>  2 files changed, 14 insertions(+), 5 deletions(-)

 Mischa> diff --git a/Makefile b/Makefile
 Mischa> index 0a91658..8fef492 100644
 Mischa> --- a/Makefile
 Mischa> +++ b/Makefile
 Mischa> @@ -238,6 +238,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 
 Mischa>  KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 Mischa>  	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 Mischa> +	-e s/arc.*/arc/ \
 Mischa>  	-e s/arm.*/arm/ -e s/sa110/arm/ \
 Mischa>  	-e s/aarch64/arm64/ \
 Mischa>  	-e s/bfin/blackfin/ \
 Mischa> diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
 Mischa> index ec75c34..1c972f3 100644
 Mischa> --- a/toolchain/kernel-headers/Config.in
 Mischa> +++ b/toolchain/kernel-headers/Config.in
 Mischa> @@ -17,35 +17,42 @@ choice
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_0
 Mischa>  		bool "Linux 3.0.x kernel headers"
 Mischa> +		depends on !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_1
 Mischa>  		bool "Linux 3.1.x kernel headers"
 Mischa> -		depends on BR2_DEPRECATED
 Mischa> +		depends on BR2_DEPRECATED && !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_2
 Mischa>  		bool "Linux 3.2.x kernel headers"
 Mischa> +		depends on !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_3
 Mischa>  		bool "Linux 3.3.x kernel headers"
 Mischa> -		depends on BR2_DEPRECATED
 Mischa> +		depends on BR2_DEPRECATED && !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_4
 Mischa>  		bool "Linux 3.4.x kernel headers"
 Mischa> +		depends on !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_5
 Mischa>  		bool "Linux 3.5.x kernel headers"
 Mischa> -		depends on BR2_DEPRECATED
 Mischa> +		depends on BR2_DEPRECATED && !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_6
 Mischa>  		bool "Linux 3.6.x kernel headers"
 Mischa> -		depends on BR2_DEPRECATED
 Mischa> +		depends on BR2_DEPRECATED && !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_7
 Mischa>  		bool "Linux 3.7.x kernel headers"
 Mischa> -		depends on BR2_DEPRECATED
 Mischa> +		depends on BR2_DEPRECATED && !BR2_arc
 
 Mischa>  	config BR2_KERNEL_HEADERS_3_8
 Mischa>  		bool "Linux 3.8.x kernel headers"
 Mischa> +		depends on !BR2_arc
 Mischa> +	
 Mischa> +	config BR2_KERNEL_HEADERS_3_9
 Mischa> +		bool "Linux 3.9.x kernel headers"
 
 Mischa>  	config BR2_KERNEL_HEADERS_VERSION
 Mischa>  		bool "Manually specified Linux version"
 Mischa> @@ -72,5 +79,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 Mischa>  	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 Mischa>  	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 Mischa>  	default "3.8.8"		if BR2_KERNEL_HEADERS_3_8
 Mischa> +	default "3.9-rc8"	if BR2_KERNEL_HEADERS_3_9
 Mischa>  	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 Mischa>  	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 Mischa> -- 
 Mischa> 1.7.0.4

 Mischa> _______________________________________________
 Mischa> buildroot mailing list
 Mischa> buildroot at busybox.net
 Mischa> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
