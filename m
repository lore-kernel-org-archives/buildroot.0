From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Thu, 17 May 2012 22:33:24 -0600
Subject: [Buildroot] dbus missing /var/lib/dbus directory
In-Reply-To: <20120517102106.221ad0e7@skate>
References: <1337225037.1496.51.camel@kepler.gfxmuse.org>
 <20120517102106.221ad0e7@skate>
Message-ID: <1337315604.1681.8.camel@kepler.gfxmuse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2012-05-17 at 10:21 +0200, Thomas Petazzoni wrote:
> define DBUS_INSTALL_TARGET_FIXUP
>         rm -rf $(TARGET_DIR)/var/lib/dbus
>         ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
>         $(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
> endef

> It doesn't exist in your filesystem?

Ah.  There's the reason.  I wipe /tmp on boot so I can create a custom
directory structure in a tmpfs.  I'll add support for /var/lib/dbus
there if I decide to keep dbus.

Thanks for the tip Thomas.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
