From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 13:08:48 +0200
Subject: [Buildroot] [v4 06/13] support/download: make sure the download
 folder is created
In-Reply-To: <20180402081434.4411-6-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-6-maxime.hadjinlian@gmail.com>
Message-ID: <20180402110848.GE3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-04-02 10:14 +0200, Maxime Hadjinlian spake thusly:
> At the moment, it means that we make sure that BR2_DL_DIR is created, in
> the future, it will make sure that BR2_DL_DIR/PKG_NAME/ is created.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-download.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 151b2e5423..e88d3f9fda 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -88,7 +88,8 @@ endif
>  endif
>  
>  define DOWNLOAD
> -	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
> +	$(Q)mkdir -p $($(PKG)_DL_DIR)/
> +	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1))) \

This extra semi-colon should not be added in the first place, in patch
2/13.

Regards,
Yann E. MORIN.

>  	$(EXTRA_ENV) $(DL_WRAPPER) \
>  		-c $($(PKG)_DL_VERSION) \
>  		-f $(notdir $(1)) \
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
