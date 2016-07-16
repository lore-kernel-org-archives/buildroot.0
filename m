From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 16 Jul 2016 17:36:15 +0200
Subject: [Buildroot] [PATCH v2] directfb: depends on NPTL threading
In-Reply-To: <20160708222129.GA22796@waldemar-brodkorb.de>
References: <20160708222129.GA22796@waldemar-brodkorb.de>
Message-ID: <f5a4dbc5-844f-7098-eb32-fc11db1976db@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 09/07/2016 ? 00:21, Waldemar Brodkorb a ?crit :
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/

Please propagate BR2_TOOLCHAIN_HAS_THREADS_NPTL to the comment dependency at the
bottom of the file.

With that fixed:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - rather adding an experimental patch without runtime testing for
>     an unmaintained software, we depend on NPTL as discussed with
>     Thomas Petazzoni on IRC
> ---
>  package/directfb/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index f0bcaaa..f38f051 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_DIRECTFB
>  	bool "directfb"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
> 
