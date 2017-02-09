From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:44:05 +0100
Subject: [Buildroot] [PATCH v3 1/2] Added keepalived
In-Reply-To: <1486672636-20750-1-git-send-email-apalos@gmail.com>
References: <1486672636-20750-1-git-send-email-apalos@gmail.com>
Message-ID: <20170209214405.0bb5e19d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title of the commit should be:

	keepalived: new package

Other comments below.

On Thu,  9 Feb 2017 22:37:15 +0200, Ilias Apalodimas wrote:

> +KEEPALIVED_VERSION = 1.3.2
> +KEEPALIVED_SITE = http://www.keepalived.org/software
> +KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
> +KEEPALIVED_LICENSE = GPLv2+
> +KEEPALIVED_LICENSE_FILES = COPYING
> +KEEPALIVED_CONF_OPTS += --disable-dbus
> +
> +ifeq ($(BR2_PACKAGE_IPSET),y)
> +KEEPALIVED_CONF_OPTS += --enable-libipset

Missing dependency on the ipset package.


> +else
> +KEEPALIVED_CONF_OPTS += --disable-libipset


> +endif
> +
> +ifeq ($(BR2_PACKAGE_IPTABLES),y)
> +KEEPALIVED_CONF_OPTS += --enable-libiptc

Missing dependency on the iptables package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
