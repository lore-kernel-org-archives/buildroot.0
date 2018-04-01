From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 16:42:24 +0200
Subject: [Buildroot] [v3 08/13] pkg-download: support new subdir for
 mirrors
In-Reply-To: <20180331142407.9522-8-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-8-maxime.hadjinlian@gmail.com>
Message-ID: <20180401144224.GI2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
> Since we introduced subdirectory to the DL_DIR, we need to support them
> in the PRIMARY and BACKUP mirror as they evolve to the new tree
> structure.
> 
> We check first the new URI (with the subdir), and in case of failure, we
> go check without.
> By checking both URIs, we ensure that old mirror are usable.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 0717943bb0..23f3403098 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -75,6 +75,7 @@ export BR_NO_CHECK_HASH_FOR =
>  
>  ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
>  DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE)/$(notdir $($(PKG)_DL_DIR)),urlencode) \
>  	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
>  endif
>  
> @@ -83,6 +84,7 @@ DOWNLOAD_URIS += \
>  	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
>  ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
>  DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE)/$(notdir $($(PKG)_DL_DIR)),urlencode) \
>  	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
>  endif
>  endif
> -- 
> 2.16.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
