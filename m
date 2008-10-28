From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2008 08:14:10 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix use of pkg-config
In-Reply-To: <200810280251.36628.markus.heidelberg@web.de>
References: <200810280251.36628.markus.heidelberg@web.de>
Message-ID: <20081028081410.5395e6f0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Oct 2008 02:51:36 +0100,
Markus Heidelberg <markus.heidelberg@web.de> a ?crit :

> +		$(TARGET_CONFIGURE_OPTS) \
> +		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \

I don't get why PKG_CONFIG_SYSROOT should be set here. The correct
variable is PKG_CONFIG_SYSROOT_DIR and it is already set in
TARGET_CONFIGURE_OPTS. I probably missed something specific to Qt, but
I didn't understand the sentence: ?PKG_CONFIG_SYSROOT is only used to
avoid a warning from Qt's configure system?.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
