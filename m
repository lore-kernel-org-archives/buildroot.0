From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 14:37:51 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Add Wifi support
In-Reply-To: <1474314302-19064-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Mon, 19 Sep 2016 16:45:02 -0300")
References: <1474314302-19064-1-git-send-email-festevam@gmail.com>
Message-ID: <87bmzi3fxc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > Warp7 has a BRCM43430 Wifi chipset. Add support for it.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed, thanks.

 > +++ b/board/warp7/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt

We recently had a discussion about this .txt file in the context of
rpi3. How specific to warp7 is this file? Is there some documentation
somewhere explaining what all these settings do?

> @@ -0,0 +1,42 @@
 > +# 2.4 GHz, 20 MHz BW mode
 > +manfid=0x2d0
 > +prodid=0x0726
 > +vendid=0x14e4
 > +devid=0x43e2
 > +boardtype=0x0726
 > +boardrev=0x1202
 > +boardnum=22
 > +macaddr=00:90:4c:c5:12:38

Does this mean that all warp7 boards will use the same macaddr? This
hardcoded address seems to be the same as what is used by the rpi
people:

https://github.com/RPi-Distro/firmware-nonfree/blob/master/brcm80211/brcm/brcmfmac43430-sdio.txt

-- 
Bye, Peter Korsgaard
