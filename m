From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:31:17 +0200
Subject: [Buildroot] [PATCH 4/4] package/mender: install dbus
 authentication file if dbus is selected
In-Reply-To: <20210320222835.3951325-5-aduskett@gmail.com>
References: <20210320222835.3951325-1-aduskett@gmail.com>
 <20210320222835.3951325-5-aduskett@gmail.com>
Message-ID: <20210330223117.1c2376cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sat, 20 Mar 2021 15:28:35 -0700
aduskett at gmail.com wrote:

> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +MENDER_DEPENDENCIES += dbus

Do we really need DBus to be built/installed before ? It seems like the
hook below only installs an extra DBus configuration file.

> +define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> +	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
> +		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
