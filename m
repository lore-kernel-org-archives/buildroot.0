From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Dec 2014 19:31:40 +0100
Subject: [Buildroot] [PATCH] dnsmasq: install DBus configuration file
In-Reply-To: <1419953667-3169-1-git-send-email-yegorslists@googlemail.com>
References: <1419953667-3169-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141230193140.24c4688f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 30 Dec 2014 16:34:27 +0100, Yegor Yefremov wrote:

> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +define DNSMASQ_INSTALL_DBUS
> +	$(INSTALL) -D \
> +	  $(@D)/dbus/dnsmasq.conf \
> +	  $(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf

Indentation should be done with tabs, so:

	$(INSTALL) -D $(@D)/dbus/dnsmasq.conf \
		$(TARGET_DIR)/etc/...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
