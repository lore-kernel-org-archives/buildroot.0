From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jan 2019 23:06:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix building pcre extension
In-Reply-To: <20181228165634.63387-1-aduskett@gmail.com>
References: <20181228165634.63387-1-aduskett@gmail.com>
Message-ID: <28fe8df2-8077-3ea1-08c6-f90d92d30ce2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/12/2018 17:56, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> The configure option "--with-pcre-regex=$(STAGING_DIR)/usr" is broken.
> PHP will  prepend $(STAGING_DIR)/usr to the paths, which will cause a
> failure because it won't be able to find pcre, and will then fallback to
> searching for pcre2, which won't be installed.
> 
> Removing "=$(STAGING_DIR)/usr" from --with-pcre-regex fixes the issue.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/586/586f56e8fcf2d2bbbd3bdf69b1c3befff7ce8bbf
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Applied to master, thanks.

 Care to add yourself as a developer for php?

 Regards,
 Arnout

> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index fd428e192a..7d7d78353b 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -244,7 +244,7 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
>  
>  ### Use external PCRE if it's available
>  ifeq ($(BR2_PACKAGE_PCRE),y)
> -PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
> +PHP_CONF_OPTS += --with-pcre-regex
>  PHP_DEPENDENCIES += pcre
>  else
>  # The bundled pcre library is not configurable through ./configure options,
> 
