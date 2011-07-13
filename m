From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 19:11:35 +0200
Subject: [Buildroot] [PATCH 3/3] gvfs: fix installation of gsettings
 schemas
In-Reply-To: <1310576089-9207-3-git-send-email-s.neumann@raumfeld.com>
References: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
 <1310576089-9207-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20110713191135.25b4454b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jul 2011 18:54:49 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> -GVFS_POST_INSTALL_TARGET_HOOKS += GVFS_REMOVE_USELESS_BINARY
> +define GVFS_REMOVE_TARGET_SCHEMAS
> +	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
> +endef
> +
> +define GVFS_COMPILE_SCHEMAS
> +	$(HOST_DIR)/usr/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
> +endef
> +
> +GVFS_POST_INSTALL_TARGET_HOOKS += \
> +	GVFS_REMOVE_USELESS_BINARY	\
> +	GVFS_REMOVE_TARGET_SCHEMAS	\
> +	GVFS_COMPILE_SCHEMAS

I have no idea what those schemas are, but why do you remove them in
GVFS_REMOVE_TARGET_SCHEMAS to generate them again in
GVFS_COMPILE_SCHEMAS ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
