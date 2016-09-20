From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 20 Sep 2016 17:38:13 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Add Wifi support
In-Reply-To: <87bmzi3fxc.fsf@dell.be.48ers.dk>
References: <1474314302-19064-1-git-send-email-festevam@gmail.com>
 <87bmzi3fxc.fsf@dell.be.48ers.dk>
Message-ID: <bdc51173-3273-f768-ace1-d508cea17f00@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/2016 02:37 PM, Peter Korsgaard wrote:
> > +++ 
> b/board/warp7/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt
> We recently had a discussion about this .txt file in the context of
> rpi3. How specific to warp7 is this file? Is there some documentation
> somewhere explaining what all these settings do?

Noticed the file used by some of the Allwinner boards contains:

https://build.opensuse.org/package/view_file/hardware/bcm43xx-firmware/brcmfmac43362-sdio-cubietruck.txt

==
# Board Revision is P307, same nvram file can be used for P304, P305, 
P306 and P307 as the tssi pa params used are same
#Please force the automatic RX PER data to the respective board 
directory if not using P307 board, for e.g. for P305 boards force the 
data into the following directory 
/projects/BCM43362/a1_labdata/boardtests/results/sdg_rev0305
==

So apparently some values involve low-level hardware tuning, and it's 
possible you need a different file if the PCB layout of the board you 
are using is changed at some point.

This makes it kinda difficult to have a common rootfs for more than one 
board.
Would be nice if they moved those values to device tree.



Yours sincerely,

Floris Bos
