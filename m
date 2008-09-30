From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 30 Sep 2008 09:35:34 +0200
Subject: [Buildroot] Error in xserver_xorg-server.mk?
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF32B2750@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B2750@bfl-exchange-1.BFL.local>
Message-ID: <20080930093534.0b5e072d@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Sep 2008 09:01:54 +0200
"Matuschka, Sebastian" <Sebastian.Matuschka@gcd-solutions.de> wrote:

> Hi All,
> 
> i guess that in the file xservers_xorg-server.mk the block
> 

I guess you meant the file
package/x11r7/xserver_xorg-server/xserver_xorg-server.mk ;)

Feel free to make a patch and send that in the future, easier to apply
and understand where you have spotted the error.

> XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
> 		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
> 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
> 		--disable-xnest --disable-xephyr --disable-xvfb \
> 		$(XSERVER_XORG_NULL_CURSOR) 
> 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
> 
> should be:
> 
> XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
> 		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
> 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
> 		--disable-xnest --disable-xephyr --disable-xvfb \
> 		$(XSERVER_XORG_NULL_CURSOR) \
> 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
> 
> 
> There is no \ after $(XSERVER_XORG_NULL_CURSOR), but it should be
> there and was there before the last commit to the file, where
> $(XSERVER_XORG_NULL_CURSOR) was added.
> 

Seems correct by me, I have added the backslash to trunk, see revision
23562.

-- 
Best regards,
Hans-Christian Egtvedt
