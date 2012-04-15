From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 15:38:16 +0200
Subject: [Buildroot] [PATCH 2/2] ushare: new package
In-Reply-To: <1334154982-23530-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Apr 2012 11:36:22 -0300")
References: <1334154982-23530-1-git-send-email-gustavo@zacarias.com.ar>
 <1334154982-23530-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871unpazef.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> UPnP media streamer.
 Gustavo> TODO: Add DLNA support (libdlna) if there's interest.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> +++ b/package/ushare/ushare.mk
 Gustavo> @@ -0,0 +1,31 @@

 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# ushare
 Gustavo> +#
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

--disable-debug should only be passed if BR2_ENABLE_DEBUG isn't enabled.

 Gustavo> +	)
 Gustavo> +endef
 Gustavo> +
 Gustavo> +define USHARE_BUILD_CMDS
 Gustavo> +	$(MAKE) -C $(@D)
 Gustavo> +endef
 Gustavo> +
 Gustavo> +define USHARE_INSTALL_TARGET_CMDS
 Gustavo> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 Gustavo> +	rm -f $(TARGET_DIR)/etc/init.d/ushare

You don't provide an alternative init script. Could this one not be used
(renamed to SXXushare)?

-- 
Bye, Peter Korsgaard
