From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Apr 2014 00:33:35 +0200
Subject: [Buildroot] [PATCH 1/2] infozip: Add a host variant
In-Reply-To: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140401223335.GA9670@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-04-02 00:24 +0200, Maxime Hadjinlian spake thusly:
> Adding a host variant to the package infozip.
> It will be used by XBMC.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It's a bit too late for me here to run a test, but I'll try to do a
build tomorrow.

Regards,
Yann E. MORIN.

> ---
>  package/infozip/infozip.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
> index 8e51224..9648b4f 100644
> --- a/package/infozip/infozip.mk
> +++ b/package/infozip/infozip.mk
> @@ -26,4 +26,17 @@ define INFOZIP_INSTALL_TARGET_CMDS
>  		prefix=$(TARGET_DIR)/usr
>  endef
>  
> +define HOST_INFOZIP_BUILD_CMDS
> +	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
> +		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
> +		AS="$(HOST_CC) -c" \
> +		-f unix/Makefile generic
> +endef
> +
> +define HOST_INFOZIP_INSTALL_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
> +		prefix=$(HOST_DIR)/usr
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 1.9.1
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
