From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 30 Sep 2008 09:01:54 +0200
Subject: [Buildroot] Error in xserver_xorg-server.mk?
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32B2750@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

i guess that in the file xservers_xorg-server.mk the block

XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
		--disable-xnest --disable-xephyr --disable-xvfb \
		$(XSERVER_XORG_NULL_CURSOR) 
		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"

should be:

XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
		--disable-xnest --disable-xephyr --disable-xvfb \
		$(XSERVER_XORG_NULL_CURSOR) \
		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"


There is no \ after $(XSERVER_XORG_NULL_CURSOR), but it should be there
and was there before the last commit to the file, where
$(XSERVER_XORG_NULL_CURSOR) was added.


Regards
Sebastian
