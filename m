From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 6 Dec 2020 18:03:19 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/bind: drop unrecognized
 option
In-Reply-To: <20201206140737.3890199-1-bernd.kuhls@t-online.de>
References: <20201206140737.3890199-1-bernd.kuhls@t-online.de>
Message-ID: <CAPi7W81J5Qe_zV0M2NXhQ_1VtQfkWmUhm__Jb8VKoxm3tQ77dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le dim. 6 d?c. 2020 ? 15:07, Bernd Kuhls <bernd.kuhls@t-online.de> a ?crit :
>
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Drop --enable-newstats option which is not recognized
>
> Unrecognized options:
>     --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --disable-nls, --enable-newstats
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes
No comment on this patch (obviously), however, concerning the second
patch of this serie (bump to 9.16.9), here is some feedback:
- openssl is mandatory since version 9.13.3 and
  https://github.com/isc-projects/bind9/commit/c3b8130fe8267185e786e9c12527df7c53b37589
- backtrace should be disabled (enabled by default) or build can fail
without libunwind
- gost has been dropped since version 9.13.1 and
  https://github.com/isc-projects/bind9/commit/27593e65dc4f1565bb45d91eb561a504da627c41
>
>  package/bind/bind.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index ba60c111ef..183c42f1e8 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -47,7 +47,7 @@ BIND_CONF_OPTS += --disable-linux-caps
>  endif
>
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
> -BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
> +BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
>  BIND_DEPENDENCIES += libxml2
>  else
>  BIND_CONF_OPTS += --with-libxml2=no
> --
> 2.29.2
>
Best Regards,

Fabrice
