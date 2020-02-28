From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 23:19:36 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
In-Reply-To: <20200228175814.128730-1-giulio.benetti@benettiengineering.com>
References: <20200228175814.128730-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200228231936.1dc26a1f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 18:58:13 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> On OpenRisc binutils it still present ld bug 21464 leading to a package
> protobuf to fail building:
> http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/
> 
> The bug was already reported and it's been updated:
> https://sourceware.org/bugzilla/show_bug.cgi?id=21464
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 87509f3d64..d71bb2a65a 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -81,6 +81,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
>  config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
>  	bool
>  
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
> +# Affect toolchains built with binutils 2.31.1, still not fixed.
> +config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> +	bool
> +	default y if BR2_or1k

The problem here is that we don't have any Config.in options for
binutils versions, so should this problem be fixed one day, we would
have no way to update this Config.in option.

To be honest, I am starting to wonder if we should keep support for
OpenRISC. It's using a now quite old gcc version, and I'm not sure the
OpenRISC support has been upstreamed to gcc.

Also, we don't have anyone specifically interested in OpenRISC and
maintaining it...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
