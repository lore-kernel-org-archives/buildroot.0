From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 10:31:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/libostree: add introspection
 support
In-Reply-To: <20200320222359.88689-2-aduskett@gmail.com>
References: <20200320222359.88689-1-aduskett@gmail.com>
 <20200320222359.88689-2-aduskett@gmail.com>
Message-ID: <20200322093142.GT4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-20 15:23 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, explicitly set --enable-introspection in
> the configure options and add a dependency for gobject-introspection.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've sent an alternate proposal that replaces this patch, nad gets away
with the previous one too:
    https://patchwork.ozlabs.org/patch/1259614/

Regards,
Yann E. MORIN.

> ---
>  package/libostree/libostree.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index bdbe6b5aba..63e6bbfde3 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -30,6 +30,13 @@ else
>  LIBOSTREE_CONF_OPTS += --without-openssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBOSTREE_CONF_OPTS += --enable-introspection
> +LIBOSTREE_DEPENDENCIES += gobject-introspection
> +else
> +LIBOSTREE_CONF_OPTS += --disable-introspection
> +endif
> +
>  # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
>  # and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
>  # option yet, use the avahi-daemon and dbus config symbols to check for
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
