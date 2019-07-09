From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Jul 2019 19:52:06 +0200
Subject: [Buildroot] [PATCH] package/libgpgme: C++ binding requires gcc 5
In-Reply-To: <484c7343585f22729e4810e626f12dc04958012c.1562667804.git.baruch@tkos.co.il>
References: <484c7343585f22729e4810e626f12dc04958012c.1562667804.git.baruch@tkos.co.il>
Message-ID: <4271d491-bacb-3ed5-03cb-7c6cbc67c491@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/07/2019 12:23, Baruch Siach wrote:
> libgpgme now use the -Wsuggest-override warning parameter when building
> the C++ binding. This requires gcc 5 or newer.

 We could instead patch away the -Wsuggest-override since it's anyway not
interesting in Buildroot context. However, let's not spend time on old toolchains.

 Applied to master, thanks.

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/6eed9cae57af445f53c9854e007815b882c5c65a/
> http://autobuild.buildroot.net/results/75617aee53a6f2b009a0d4ddc5b9a8c4cd406895/
> http://autobuild.buildroot.net/results/8191a732918c6987b84309df3dfd66ab54b43fb7/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libgpgme/libgpgme.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
> index f916ca180cfb..1a045862ddc5 100644
> --- a/package/libgpgme/libgpgme.mk
> +++ b/package/libgpgme/libgpgme.mk
> @@ -23,8 +23,8 @@ LIBGPGME_CONF_OPTS = \
>  	--disable-gpg-test \
>  	--enable-languages=$(LIBGPGME_LANGUAGE_BINDINGS)
>  
> -# C++ bindings require a C++11 capable gcc
> -ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),yy)
> +# C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
> +ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),yy)
>  LIBGPGME_LANGUAGE_BINDINGS := $(LIBGPGME_LANGUAGE_BINDINGS),cpp
>  endif
>  
> 
