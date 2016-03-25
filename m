From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 16:07:38 +0100
Subject: [Buildroot] [PATCH] linknx: add missing libcurl dependency
In-Reply-To: <1458914922-9400-1-git-send-email-ltrimas@synopsys.com>
References: <1458914922-9400-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160325160738.12944c96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Mar 2016 17:08:42 +0300, Lada Trimasova wrote:
> "LIBCURL_CHECK_CONFIG" macros used in "configure.ac" file can be
> resolved only when libcurl is installed.
> Earlier we used generated "configure" file with already resolved
> "LIBCURL_CHECK_CONFIG" macros. And now we need autoreconf.
> (See https://git.busybox.net/buildroot/commit/package/linknx/linknx.mk?id=f35f54585f9e63400bdbd9c9ba2b9fd67be538ea)
> So it's impossible to generate configure file without libcurl installed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9d2/9d23babaa739ecb8e7c2ad09036a5bc0461d3a8c/build-end.log
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/linknx/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linknx/Config.in b/package/linknx/Config.in
> index 36838fe..55c14ab 100644
> --- a/package/linknx/Config.in
> +++ b/package/linknx/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LINKNX
>  	select BR2_PACKAGE_ARGP_STANDALONE \
>  	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_LIBCURL

Adding a depends on for library dependencies is not the approach we
use in Buildroot. Rather, we use a select for such dependencies.
However, someone else has already submitted a patch fixing the same
problem, with a select. See http://patchwork.ozlabs.org/patch/598613/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
