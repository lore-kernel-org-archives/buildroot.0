From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Feb 2018 18:28:38 +0200
Subject: [Buildroot] [PATCH] erlang: enable host-erlang for x86/x86_64
 architectures only
In-Reply-To: <20180226155947.9220-1-johan.oudinet@gmail.com>
References: <20180226155947.9220-1-johan.oudinet@gmail.com>
Message-ID: <20180226162838.6je7y772r5peqfm5@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Mon, Feb 26, 2018 at 04:59:47PM +0100, Johan Oudinet wrote:
> And make erlang depends on host-erlang.

A reference to the autobuilder failure would be nice.

> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 96af5516fd..bf745555e8 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -1,9 +1,16 @@
> +config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_HOSTARCH = "x86_64"
> +	default y if BR2_HOSTARCH = "x86"
> +
>  config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	bool
>  	# see HOWTO/INSTALL.md for Erlang's supported platforms
>  	# when using its native atomic ops implementation
>  	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
>  		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel
> +	# erlang needs host-erlang
> +	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>  
>  comment "erlang needs a toolchain w/ dynamic library"
>  	depends on BR2_USE_MMU # fork()

This comment also needs the new dependency.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
