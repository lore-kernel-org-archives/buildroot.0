From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:33:27 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <20190403183202.19682-1-joerg.krause@embedded.rocks>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
Message-ID: <20190403213327.299f23ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Apr 2019 20:32:01 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Since version 0.49.0 the Meson build system has native support for
> looking for `libgcrypt-config` if no pkg-config file is found. As the
> latest version 1.8.4 of libgcrypt does not provide a .pc file, using
> `libgcrypt-config` is the only way for detecting the required libraries
> when linking agains libgrypt.
> 
> The `libgcrypt-config` entry is necessary for updating package mpd,
> which switched from the Autotools to the Meson build system when bumping
> from version 0.20 to 0.21.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/meson/cross-compilation.conf.in | 1 +
>  package/meson/meson.mk                  | 1 +
>  package/pkg-meson.mk                    | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index fc8e27f7eb..b68499a6fa 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -9,6 +9,7 @@ cpp = '@TARGET_CROSS at g++'
>  ar = '@TARGET_CROSS at ar'
>  strip = '@TARGET_CROSS at strip'
>  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> +libgcrypt-config = '@STAGING_DIR@/usr/bin/libgcrypt-config'

Hm, this is a bit annoying. We really have no other solution but to
pass this through cross-compilation.conf ? It cannot be passed on the
meson command line, on a per-package basis, like we do for the autotools ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
