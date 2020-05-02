From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 14:32:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <20200502060435.23004-1-james.hilliard1@gmail.com>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
Message-ID: <20200502143243.4e2b3ef3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 May 2020 00:04:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index eefb2c83f7..d98eaf945a 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -136,6 +136,36 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>  endef
>  GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>  
> +define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> +	# Set prefix to /usr because pkg-config appends the sysroot directory
> +	$(SED) "s%^prefix=.*%prefix=\/usr%g" \
> +		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc

No, the host variant of pkg-config should not append the sysroot
directory. If it does, then it is wrong.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
