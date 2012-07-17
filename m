From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 23:45:35 +0200
Subject: [Buildroot] [PATCH] avahi: only install
 default.script/S05avahi-setup.sh if not present in fs skeleton
In-Reply-To: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
References: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20120717234535.6ae0b109@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 00:14:36 -0400,
Danomi Manchego <danomimanchego123@gmail.com> a ?crit :

> +	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
> +		$(INSTALL) -m 0755 -D package/avahi/busybox-udhcpc-default.script \
> +			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
> +	fi

This doesn't work: the Busybox package already installs a
default.script file in usr/share/udhcpc. If avahi is built before
Busybox, then you'll have the Avahi script. If Busybox is built before
Avahi, then you'll have the Busybox script. This doesn't look correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
