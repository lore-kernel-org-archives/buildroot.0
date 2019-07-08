From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 8 Jul 2019 13:11:17 -0700
Subject: [Buildroot] [PATCH 1/1] package/at-spi2-core: fix build with NLS
In-Reply-To: <20190704170538.19478-1-fontaine.fabrice@gmail.com>
References: <20190704170538.19478-1-fontaine.fabrice@gmail.com>
Message-ID: <CAMWSM7gdtjvdp=py9+isYfKqf_Bd9OXS7jQB18ym_XX78sV7CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Thu, Jul 4, 2019 at 10:05 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.org/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1?
>

It appears there's an extra character on the end of that buildbot URL.

It looks like the correct URL is:
http://autobuild.buildroot.org/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/at-spi2-core/at-spi2-core.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> index 40b29bdb3f..3a5197eb03 100644
> --- a/package/at-spi2-core/at-spi2-core.mk
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -11,7 +11,10 @@ AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI
>  AT_SPI2_CORE_LICENSE = LGPL-2.0+
>  AT_SPI2_CORE_LICENSE_FILES = COPYING
>  AT_SPI2_CORE_INSTALL_STAGING = YES
> -AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst
> +AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
> +       $(TARGET_NLS_DEPENDENCIES)
>  AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
>
> +AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +
>  $(eval $(meson-package))
> --
> 2.20.1
>

Also fixes:
- http://autobuild.buildroot.net/results/b46f989e2c5d37e9c6535ce5630c80ca9d0a9009

Tested-by: Joseph Kogut <joseph.kogut@gmail.com>

Lastly, it appears there is a similar failure with atk. I assume the
fix is also the same. Do you have time to make a patch for that as
well? If not, I can submit one.

Best,
Joseph
