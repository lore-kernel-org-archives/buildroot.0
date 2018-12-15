From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Dec 2018 10:11:33 +0100
Subject: [Buildroot] [PATCH 1/1] glib-networking: fix build with pkgconf
 1.5.3
In-Reply-To: <20181215083723.25668-1-asafka7@gmail.com>
References: <20181215083723.25668-1-asafka7@gmail.com>
Message-ID: <20181215101133.793a5a34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 10:37:22 +0200, Asaf Kahlon wrote:
> CONF_OPTS has to be altered to contain only the prefix relative
> to STAGING_DIR, because the sysroot path is prepended since pkgconf
> bump to 1.5.3
> 
> Fixes:
> http://autobuild.buildroot.org/results/3a0/3a0687911f9da25fb36497b7abb2adb7ea3ef695
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/glib-networking/glib-networking.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> index 10a3b706b3..91def515cc 100644
> --- a/package/glib-networking/glib-networking.mk
> +++ b/package/glib-networking/glib-networking.mk
> @@ -23,7 +23,7 @@ GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
>  
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  GLIB_NETWORKING_DEPENDENCIES += gnutls
> -GLIB_NETWORKING_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +GLIB_NETWORKING_CONF_OPTS += --with-libgcrypt-prefix=/usr

Meh, this is getting crazy :-/ We're used to pass $(STAGING_DIR)/usr
everywhere for those prefixes.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
