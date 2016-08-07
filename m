From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:20:16 +0200
Subject: [Buildroot] [PATCH 2/2] iproute2: use @D instead of IPROUTE2_DIR
In-Reply-To: <1470416880-16148-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470416880-16148-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807202016.GI5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-05 19:08 +0200, Thomas Petazzoni spake thusly:
> We more generally use $(@D) instead of $(pkg_DIR) to refer to the
> package source directory, so this commit updates iproute2 to also use
> $(@D) everywhere.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/iproute2/iproute2.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index edc17ad..09e68c5 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -27,13 +27,13 @@ ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
>  IPROUTE2_DEPENDENCIES += iptables
>  define IPROUTE2_WITH_IPTABLES
>  	# Makefile is busted so it never passes IPT_LIB_DIR properly
> -	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
> +	$(SED) "s/-DIPT/-DXT/" $(@D)/tc/Makefile
>  endef
>  else
>  define IPROUTE2_WITH_IPTABLES
>  	# em_ipset needs xtables, but configure misdetects it
> -	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
> -	echo "TC_CONFIG_XT:=n" >>$(IPROUTE2_DIR)/Config
> +	echo "TC_CONFIG_IPSET:=n" >>$(@D)/Config
> +	echo "TC_CONFIG_XT:=n" >>$(@D)/Config
>  endef
>  endif
>  
> @@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>  IPROUTE2_DEPENDENCIES += berkeleydb
>  else
>  define IPROUTE2_DISABLE_ARPD
> -	echo "HAVE_BERKELEY_DB:=n" >> $(IPROUTE2_DIR)/Config
> +	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/Config
>  endef
>  endif
>  
> -- 
> 2.7.4
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
