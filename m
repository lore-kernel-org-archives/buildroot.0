From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:18:27 +0200
Subject: [Buildroot] [PATCH 1/5] package/nftables: check for python
In-Reply-To: <20200330234616.1665466-1-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
Message-ID: <20200401201827.GY22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-30 16:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If python or python3 is selected, nftables should depend on the package
> and set the --enable-python option, otherwise set --disable-python
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This one patch applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nftables/nftables.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index 11ef6844ce..210e950c11 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -27,6 +27,13 @@ else
>  NFTABLES_CONF_OPTS += --without-json
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> +NFTABLES_CONF_OPTS += --enable-python
> +NFTABLES_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> +else
> +NFTABLES_CONF_OPTS += --disable-python
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
>  NFTABLES_LIBS += -ljansson -lm
>  endif
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
