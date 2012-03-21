From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 14:04:52 +0100
Subject: [Buildroot] [PATCH 2/2] ushare: new package
In-Reply-To: <1332331352-6072-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 21 Mar 2012 09:02:32 -0300")
References: <1332331352-6072-1-git-send-email-gustavo@zacarias.com.ar>
 <1332331352-6072-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87aa3a3y17.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> UPnP media streamer.
 Gustavo> TODO: Add DLNA support (libdlna) if there's interest.

 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +USHARE_VERSION = 1.1a
 Gustavo> +USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 Gustavo> +USHARE_SITE = http://ushare.geexbox.org/releases
 Gustavo> +USHARE_DEPENDENCIES = host-pkg-config libupnp
 Gustavo> +
 Gustavo> +define USHARE_CONFIGURE_CMDS
 Gustavo> +	(cd $(@D); \
 Gustavo> +		$(TARGET_CONFIGURE_OPTS) \
 Gustavo> +		./configure --prefix=/usr $(DISABLE_NLS) --cross-compile \
 Gustavo> +		--cross-prefix="$(TARGET_CROSS)" --sysconfdir=/etc \
 Gustavo> +		--disable-strip --disable-debug \
 Gustavo> +	)
 Gustavo> +endef
 Gustavo> +
 Gustavo> +define USHARE_INSTALL_TARGET_CMDS
 Gustavo> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 Gustavo> +	rm -f $(TARGET_DIR)/etc/init.d/ushare
 Gustavo> +endef

Why the custom configure and install steps?

 Gustavo> +
 Gustavo> +$(eval $(call AUTOTARGETS))

-- 
Bye, Peter Korsgaard
