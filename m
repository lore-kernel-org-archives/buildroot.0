From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Nov 2020 00:00:25 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: really break circular
 dependency
In-Reply-To: <20201113225207.302037-1-romain.naour@gmail.com>
References: <20201113225207.302037-1-romain.naour@gmail.com>
Message-ID: <CAPi7W82vQbqf-F4qNmfFeXSxsc_ULxj=n=SnmKjtukdKo=CS_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Le ven. 13 nov. 2020 ? 23:52, Romain Naour <romain.naour@gmail.com> a ?crit :
>
> The commit [1] should fix a circular dependency by
> using util-linux-libs instead of util-linux if
> BR2_PACKAGE_UTIL_LINUX_LIBS is set.
>
> But util-linux is still in CRYPTSETUP_DEPENDENCIES.
> Remove it to really break the circular dependency.
Thanks for fixing this mistake.
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> [1] e3c86f5c9e466ed5135e824d6dcebcfd7f5ac1ab
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/cryptsetup/cryptsetup.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 60097595b4..a59a0c7570 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -9,7 +9,7 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
> -       lvm2 popt util-linux host-pkgconf json-c libargon2 \
> +       lvm2 popt host-pkgconf json-c libargon2 \
>         $(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
>         $(TARGET_NLS_DEPENDENCIES)
> --
> 2.25.4
>
Best Regards,

Fabrice
