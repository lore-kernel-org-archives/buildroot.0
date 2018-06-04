From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 12:09:08 +0200
Subject: [Buildroot] [PATCH] shadowsocks-libev: new package
In-Reply-To: <20180604071626.17528-1-xuminready@gmail.com>
References: <20180604071626.17528-1-xuminready@gmail.com>
Message-ID: <20180604120908.0f340f5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 00:16:26 -0700, Min Xu wrote:
> Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
> embedded devices and low-end boxes.
> 
> https://github.com/shadowsocks/shadowsocks-libev
> 
> A patch for BSD-3-Clause licence for libipset is added. It's from libipset's git repo.
> 
> Signed-off-by: Min Xu <xuminready@gmail.com>

Thanks for this new iteration!

>  package/Config.in                                  |  1 +
>  .../0001-docs-add-BSD-3-Clause-licence.patch       | 52 ++++++++++++++++++++++
>  package/shadowsocks-libev/Config.in                | 12 +++++
>  package/shadowsocks-libev/shadowsocks-libev.hash   |  8 ++++
>  package/shadowsocks-libev/shadowsocks-libev.mk     | 15 +++++++
>  5 files changed, 88 insertions(+)

Could you add an entry in the DEVELOPERS file for this new package, so
that you can be notified when there are build issues ?

> diff --git a/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> new file mode 100644
> index 0000000..64dda02
> --- /dev/null
> +++ b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> @@ -0,0 +1,52 @@
> +From 0047295445c499e010706598c50f1bff8b0d632c Mon Sep 17 00:00:00 2001
> +From: Min Xu <xuminready@gmail.com>
> +Date: Wed, 30 May 2018 13:16:12 -0700
> +Subject: [PATCH] docs: add BSD-3-Clause licence
> +
> +add missing licence for shadowsocks-libev/libipset
> +
> +Signed-off-by: Min Xu <xuminready@gmail.com>

I'm still not entirely convinced by a patch adding a license file. It
would definitely be useful to convince upstream to add this license
file, but I'm not sure we want to carry patches in Buildroot adding
license files.

Peter, Arnout, Yann, any comment on this ?

> +SHADOWSOCKS_LIBEV_VERSION = 3.2.0
> +SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
> +SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause(libbloom), BSD-3-Clause(libcork, libipset)
> +SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING libipset/LICENSE.txt
> +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
> +SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
> +SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr

--disable-documentation is already passed by the autotools-package
infrastructure, so it isn't needed.

Besides those minor issues, the rest looks good to me. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
