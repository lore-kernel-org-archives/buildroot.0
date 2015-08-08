From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:52:52 +0200
Subject: [Buildroot] [PATCH 3/7] package/libv4l: disable for musl
 toolchains
In-Reply-To: <1438987639-30593-3-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
 <1438987639-30593-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150808115252.78475b7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 00:47:15 +0200, Romain Naour wrote:
> musl toolchains are not supported yet in libv4l but
> it's a work in progress.
> 
> see:
> http://git.linuxtv.org/cgit.cgi/v4l-utils.git/commit/?id=70570c6095fa5859cecd0f9522fe7fd749f1d554
> http://git.linuxtv.org/cgit.cgi/v4l-utils.git/commit/?id=403a4e2697a1ff96fe2fa16589039595f21cadf0
> 
> But it's not enough.
> 
> Disable musl toolchains for libv4l 1.6.3 and wait for a
> new release.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libv4l/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index 0ae12d1..89e9270 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBV4L
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # wait for libv4l 1.7+
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help

You forgot to update the Config.in comment, so I've done so before
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
