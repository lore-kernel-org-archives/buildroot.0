From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 09:35:57 +0200
Subject: [Buildroot] [PATCH] package/libnss: install certutil tool on
 target
In-Reply-To: <20200904113501.22230-1-julien.floret@6wind.com>
References: <20200904113501.22230-1-julien.floret@6wind.com>
Message-ID: <20200905073557.GT14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-09-04 13:35 +0200, Julien Floret spake thusly:
> certutil is a command-line utility for managing keys and certificate in
> both NSS databases and other NSS tokens.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index f28e16a40670..d0b2d51772bd 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -105,6 +105,8 @@ define LIBNSS_INSTALL_TARGET_CMDS
>  		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
>  	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
>  		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
> +	$(INSTALL) -D -m 755 $(@D)/$(LIBNSS_DISTDIR)/bin/certutil \
> +		$(TARGET_DIR)/usr/bin/certutil
>  	$(SED) 's/@VERSION@/$(LIBNSS_VERSION)/g;' \
>  		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
>  endef
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
