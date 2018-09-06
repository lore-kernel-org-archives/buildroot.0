From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 23:39:11 +0200
Subject: [Buildroot] [PATCH v2] rust: Modify Rust to be usable as
 host-tool only
In-Reply-To: <20180822223350.8735-1-sam.voss@gmail.com>
References: <20180822223350.8735-1-sam.voss@gmail.com>
Message-ID: <20180906233911.14895697@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Wed, 22 Aug 2018 17:33:50 -0500, sam.voss at gmail.com wrote:
> From: Sam Voss <sam.voss@gmail.com>
> 
> Modify host-rust virtual package to default to host-rust-bin when no
> other selection has been made, as long as the host supports rust. This
> allows host only tools to still use rust when the target architecture
> does not support it.
> 
> Add target-specific variable which is used to differentiate host and
> target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
> 
> A target package shall depend on this variable where a host package will
> use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
> "target" version is selectable for the same set of architectures as
> before, but now depends on the host variant.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I'm not sure why you have added my Signed-off-by here, it shouldn't be
there.

I have a minor nit below, but once fixed, this has my:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 2ae8f89d3f..93873c3a56 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -1,4 +1,10 @@
> +# All host rust packages should depend on this configuration

on this *option*

>  config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +
> +# All target rust packages should depend on this configuration

on this *option

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
