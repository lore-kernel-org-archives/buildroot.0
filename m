From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 22:01:32 +0100
Subject: [Buildroot] [PATCH v5] netsurf: new package
In-Reply-To: <20181205134040.20861-1-francois.perrad@gadz.org>
References: <20181205134040.20861-1-francois.perrad@gadz.org>
Message-ID: <20181210220132.1cbe0f96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Dec 2018 14:40:40 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-avoid-system-perl-dependencies.patch | 29 ++++++++
>  package/netsurf/Config.in                     | 42 ++++++++++++
>  package/netsurf/netsurf.hash                  |  3 +
>  package/netsurf/netsurf.mk                    | 67 +++++++++++++++++++
>  6 files changed, 143 insertions(+)
>  create mode 100644 package/netsurf/0001-avoid-system-perl-dependencies.patch
>  create mode 100644 package/netsurf/Config.in
>  create mode 100644 package/netsurf/netsurf.hash
>  create mode 100644 package/netsurf/netsurf.mk

Applied to master with the following changes:

    [Thomas:
     - rename BR2_PACKAGE_NETSURF_FRAMEBUFFER to BR2_PACKAGE_NETSURF_SDL,
       and use "sdl" everywhere instead of "framebuffer", since really SDL
       can display on something else than the framebuffer
     - use a "depends on BR2_PACKAGE_LIBGTK2" instead of a "depends on
       BR2_PACKAGE_XORG7 + many other depends on + select
       BR2_PACKAGE_LIBGTK2"
     - use PKG_CONFIG_HOST_BINARY for the pkg-config path]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
