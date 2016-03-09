From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 9 Mar 2016 13:43:05 +0100
Subject: [Buildroot] Best regards
In-Reply-To: <1457276783-27985-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457276783-27985-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E01A59.5090606@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/03/2016 16:06, Thomas Petazzoni a ?crit :
> Now that we have added support for the lastest binutils version 2.26,
> it is time to remove the oldest version we currently support, 2.23, in
> order to keep only 3 versions: 2.24, 2.25 and 2.26.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

[snip]

> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index a532283..b5b0154 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -7,15 +7,6 @@ choice
>  	help
>  	  Select the version of binutils you wish to use.
>  
> -	config BR2_BINUTILS_VERSION_2_23_X
> -		depends on !BR2_aarch64 && !BR2_microblaze && \
> -			   !BR2_powerpc64le && !BR2_nios2
> -		# Unsupported for MIPS R6
> -		depends on !BR2_mips_32r6 && !BR2_mips_64r6
> -		# Unsupported ARM cores
> -		depends on !BR2_cortex_a17
> -		bool "binutils 2.23.2"
> -
>  	config BR2_BINUTILS_VERSION_2_24_X
>  		# supported, but broken on Nios-II and powerpc64le
>  		depends on !BR2_nios2 && !BR2_powerpc64le
> @@ -36,7 +27,6 @@ endchoice
>  config BR2_BINUTILS_VERSION
>  	string
>  	default "arc-2015.12"	if BR2_arc
> -	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
>  	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
>  	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
>  	default "2.26"		if BR2_BINUTILS_VERSION_2_26_X
> 

Since BR2_BINUTILS_VERSION_2_23_X symbol is removed we need to add it to
Config.in.legacy. Otherwise the old symbol BR2_BINUTILS_VERSION_2_23_2 which
select BR2_BINUTILS_VERSION_2_23_X do nothing.

Maybe we can also remove the binutils 2.22 and 2.23 hashes ?

Best regards,
Romain
