From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 4 Apr 2018 18:28:35 +0200
Subject: [Buildroot] [PATCH] libkrb5: needs dynamic library support
In-Reply-To: <57d1b0676093d283f22717d1c822643dc44bcf1a.1522828164.git.baruch@tkos.co.il>
References: <57d1b0676093d283f22717d1c822643dc44bcf1a.1522828164.git.baruch@tkos.co.il>
Message-ID: <baaca571-99ae-5db7-300f-8c0204cf3cfc@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.04.2018 um 09:49 schrieb Baruch Siach:
> Even though the configure script checks for the presence of dlfcn.h, the
> code includes this header unconditionally.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0e1/0e19af38d74aa74919a11ff1ebdb3b8c1a494b33/
> 
> Cc: Andr? Hentschel <nerv@dawncrow.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libkrb5/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
> index 9147c9048924..f6af7130f0f2 100644
> --- a/package/libkrb5/Config.in
> +++ b/package/libkrb5/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBKRB5
>  	bool "libkrb5"
>  	# needs fork()
>  	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  Kerberos is a system for authenticating users and services
>  	  on a network. Kerberos is a trusted third-party service.
> @@ -11,3 +12,7 @@ config BR2_PACKAGE_LIBKRB5
>  	  reference implementation of Kerberos V5.
>  
>  	  https://web.mit.edu/kerberos/
> +
> +comment "apache needs a toolchain w/ dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS
> 

Thanks!
apache is wrong though :)
