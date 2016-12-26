From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 09:48:57 +0100
Subject: [Buildroot] [PATCH 1/1] Fix collectd cannot configure with
 dependence error.
In-Reply-To: <20161225135434.124035-1-jackzzjack@gmail.com>
References: <20161225135434.124035-1-jackzzjack@gmail.com>
Message-ID: <20161226094857.6142ff20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Dec 2016 21:54:34 +0800, jackzzjack wrote:

>  ifeq ($(BR2_PACKAGE_NETSNMP),y)
> -COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
> +COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/include

The correct path was $(STAGING_DIR)/usr/, not
$(STAGING_DIR)/usr/include.

I've applied your patch after fixing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
