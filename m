From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 27 Jun 2015 11:21:11 +0200
Subject: [Buildroot] [PATCH] ARC: switch to RC1 of upcoming arc-2015.06
 tools
In-Reply-To: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
References: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150627092110.GI31780@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,
Alexey Brodkin wrote,

> Even though this is only RC1 it's been heavily used internally so it should
> not be any worse than existing arc-2014.12.
> 
> Moreover this relase (and so its RC1) finally delivers support of NPTL
> for ARC in uClibc.
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 15a590f..32c356a 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -33,6 +33,7 @@ choice
>  		bool "uClibc Git ARC"
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL
>  		depends on BR2_arc
>  
>  	config BR2_UCLIBC_VERSION_NG
> @@ -41,7 +42,7 @@ choice
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
>  		       if BR2_m68k || BR2_arm || BR2_armeb
>  		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> -		       if !BR2_arc && !BR2_m68k && !BR2_x86_i386
> +		       if !BR2_m68k && !BR2_x86_i386
>  
>  	config BR2_UCLIBC_VERSION_SNAPSHOT
>  		bool "daily snapshot"
> @@ -63,7 +64,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
>  config BR2_UCLIBC_VERSION_STRING
>  	string
>  	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
> -	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
> +	default "arc-2015.06-rc1" if BR2_UCLIBC_VERSION_ARC_GIT

Is there any reason uClibc-ng 1.0.3 can not be used as default?
Do you have pending patches for ARC?

best regards
 Waldemar
