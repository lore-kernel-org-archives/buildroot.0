From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 09:37:16 +0100
Subject: [Buildroot] [PATCH] trousers: disable on ARC
In-Reply-To: <1487197241-31996-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487197241-31996-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170216093716.0985abab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding ARC/Synopsys folks in Cc, which I forgot to do when sending the
patch.

Thomas

On Wed, 15 Feb 2017 23:20:41 +0100, Thomas Petazzoni wrote:
> This package has been failing to build on ARC due to a toolchain bug
> since December 2015, causing a total of 168 build failures. Therefore,
> let's disable this package for now, until the toolchain issue gets
> resolved.
> 
> Fixes^Wavoids:
> 
>   http://autobuild.buildroot.net/results/e65d1d7c5a4dd4616167cfe2aa938be6af139602/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/tpm-tools/Config.in | 2 ++
>  package/trousers/Config.in  | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
> index dd59aaa..83b65f3 100644
> --- a/package/tpm-tools/Config.in
> +++ b/package/tpm-tools/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_TPM_TOOLS
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
>  	depends on !BR2_STATIC_LIBS # trousers
> +	depends on !BR2_arc # trousers
>  	help
>  	  Tools to manage and diagnose a TPM
>  
> @@ -12,3 +13,4 @@ config BR2_PACKAGE_TPM_TOOLS
>  
>  comment "tpm-tools needs a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_arc
> diff --git a/package/trousers/Config.in b/package/trousers/Config.in
> index 6ab74bf..11ab874 100644
> --- a/package/trousers/Config.in
> +++ b/package/trousers/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_TROUSERS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# doesn't build properly in static only configurations
>  	depends on !BR2_STATIC_LIBS
> +	# broken toolchain
> +	depends on !BR2_arc
>  	help
>  	  The open-source TCG Software Stack (TSS).
>  
> @@ -16,3 +18,4 @@ config BR2_PACKAGE_TROUSERS
>  
>  comment "trousers needs a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_arc



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
