From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 23:17:18 +0200
Subject: [Buildroot] [Buildroot PATCH v2] Add package nss-mdns.
In-Reply-To: <1340051873-5839-1-git-send-email-marek.belisko@open-nandra.com>
References: <1340051873-5839-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20120618231718.6eb8a739@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 18 Jun 2012 21:37:53 +0100,
Marek Belisko <marek.belisko@open-nandra.com> a ?crit :

> +define NSS_MDNS_INSTALL_CONFIG
> +	$(INSTALL) -m 0664 package/nss-mdns/nsswitch.conf $(TARGET_DIR)/etc/

Should be:

	$(INSTALL) -D -m 0664 package/nss-mdns/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf

Otherwise looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
