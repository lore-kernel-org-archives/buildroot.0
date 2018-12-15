From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Dec 2018 17:02:24 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] glib-networking: remove --with-libgcrypt-prefix
In-Reply-To: <20181215141401.11112-1-fontaine.fabrice@gmail.com>
References: <20181215141401.11112-1-fontaine.fabrice@gmail.com>
Message-ID: <20181215170224.008971f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Asaf in Cc.

On Sat, 15 Dec 2018 15:14:00 +0100, Fabrice Fontaine wrote:
> --with-libgcrypt-prefix is not recognized (see
> http://autobuild.buildroot.org/results/3a0/3a0687911f9da25fb36497b7abb2adb7ea3ef695/build-end.log):
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-libgcrypt-prefix
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Remove --with-libgcrypt-prefix in a dedicated patch
> 
>  package/glib-networking/glib-networking.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> index 10a3b706b3..12caf86019 100644
> --- a/package/glib-networking/glib-networking.mk
> +++ b/package/glib-networking/glib-networking.mk
> @@ -23,7 +23,6 @@ GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
>  
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  GLIB_NETWORKING_DEPENDENCIES += gnutls
> -GLIB_NETWORKING_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr

So how can http://patchwork.ozlabs.org/patch/1013864/ be working ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
