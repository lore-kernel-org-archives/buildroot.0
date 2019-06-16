From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Jun 2019 13:23:01 +0300
Subject: [Buildroot] [PATCH] modem-manager: depend on host-libglib2
In-Reply-To: <20190616101128.14729-1-aleksander@aleksander.es>
References: <20190616101128.14729-1-aleksander@aleksander.es>
Message-ID: <8736k9sube.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aleksander,

On Sun, Jun 16 2019, Aleksander Morgado wrote:
> The build requires the gdbus-codegen tool from glib2, which isn't
> installed in target.
>
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>
> Hey,
>
> I'm getting build failures like this one reported via email:
> http://autobuild.buildroot.net/results/5d3e6449887b4cdbfbc0ddc672fa374896cfb102/build-end.log
>
> Not truly sure if this is the correct fix for the issue, but it looks like it could be?
>
> What I don't know is why gdbus-codegen isn't found, but glib-mkenums (also provided by glib2) doesn't have the same problem.
>
> Cheers!
>
> ---
>  package/modem-manager/modem-manager.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index aa27dc9ce5..41e37bd655 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>  MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool host-libglib2 libglib2

libglib2 depends on host-libglib2 already. So technically this doesn't
change anything.

Have you verified that the build failure is fixed with your patch
applied?

>  MODEM_MANAGER_INSTALL_STAGING = YES
>  MODEM_MANAGER_CONF_OPTS = --disable-more-warnings

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
