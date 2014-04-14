From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 15:23:26 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: Introduce kernel
 headers sanitization
In-Reply-To: <1397477816-6605-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1397477816-6605-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140414152326.4a23a673@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Mon, 14 Apr 2014 09:16:56 -0300, Ezequiel Garcia wrote:

> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 3990336..9a3ab6f 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -434,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	select BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
>  	help
>  	  Sourcery CodeBench toolchain for the Nios-II architecture,
>  	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
> @@ -1206,4 +1207,10 @@ config BR2_BFIN_INSTALL_FLAT_SHARED
>  	  into a buildroot rootfs image built with binary format that is not
>  	  shared FLAT.
>  
> +# Some toolchains have their headers broken and need to be sanitized.
> +# Currently, this is only needed on Nios-II external Sourcery toolchain,
> +# to fix the Linux headers.
> +config BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
> +	bool
> +

Why do we still have Config.in changes here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
