From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 13:29:25 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
In-Reply-To: <20170213093502.26507-1-peter@korsgaard.com>
References: <20170213093502.26507-1-peter@korsgaard.com>
Message-ID: <20170213132925.5324f141@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 10:35:02 +0100, Peter Korsgaard wrote:

> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
> index 1d174c18b..3750897bb 100644
> --- a/package/kmsxx/Config.in
> +++ b/package/kmsxx/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_KMSXX
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	depends on !BR2_m68k # gcc ice

As usual, I really prefer if we report the bug to gcc upstream, and
then do a depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_xyz. Otherwise, it's
really tricky to keep track of when this or that issue gets resolved
and when we can re-enable m68k.

CC'ing Waldemar on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
