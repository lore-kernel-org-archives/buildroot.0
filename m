From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 6 Jul 2019 08:04:22 -0300
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: drop
 host-intltool
In-Reply-To: <20190705214809.27903-1-fontaine.fabrice@gmail.com>
References: <20190705214809.27903-1-fontaine.fabrice@gmail.com>
Message-ID: <CAJ4jsacmULAxeNsXrPcgcUYiry7BF57MRYO2PQZ7SGNFvGkZUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 5, 2019 at 6:48 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> intltool is not needed since
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/commit/984625165e09f02b4d6b8389092d5055fdbb0f03
>
> So drop it and add TARGET_NLS_DEPENDENCIES
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/modem-manager/modem-manager.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index a2c38a68c9..61658cf48a 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
>  MODEM_MANAGER_INSTALL_STAGING = YES
>  MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
>
> --
> 2.20.1

Tested-by: Carlos Santos <unixmania@gmail.com>
---
Verified that modem-manager builds correctly with NLS enabled. Used a
glibc-based toolchain.
