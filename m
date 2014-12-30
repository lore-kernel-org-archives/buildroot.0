From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Dec 2014 22:44:19 +0100
Subject: [Buildroot] [PATCH v2] dnsmasq: install DBus configuration file
In-Reply-To: <1419972927-25825-1-git-send-email-yegorslists@googlemail.com>
References: <1419972927-25825-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141230224419.5288c872@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 30 Dec 2014 21:55:27 +0100, Yegor Yefremov wrote:

> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +define DNSMASQ_INSTALL_DBUS
> +	$(INSTALL) -D $(@D)/dbus/dnsmasq.conf \
> +		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf

Sorry, should have said that on the previous iteration: please add -m
0644 to the $(INSTALL) invocation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
