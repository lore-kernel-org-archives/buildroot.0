From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:27:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix service
 installation
In-Reply-To: <20191102151726.7341-1-petr.vorel@gmail.com>
References: <20191102151726.7341-1-petr.vorel@gmail.com>
Message-ID: <20191102222736.1179b419@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Sat,  2 Nov 2019 16:17:26 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

>  define IPUTILS_INSTALL_SERVICE_NINFOD
> +	$(INSTALL) -D -m 0644 $(@D)/systemd/ninfod.service.in \
> +		$(TARGET_DIR)/usr/lib/systemd/system/ninfod.service

This cannot be right: ninfod.service.in contains @sbindir@ that needs
to be replaced before being installed.

>  define IPUTILS_INSTALL_SERVICE_RDISC
> +	$(INSTALL) -D -m 0644 $(@D)/systemd/rdisc.service.in \
> +		$(TARGET_DIR)/usr/lib/systemd/system/rdisc.service

Ditto.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
