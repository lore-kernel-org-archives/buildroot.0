From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Jun 2017 22:29:00 +0200
Subject: [Buildroot] [PATCH v2] board: added support for Raspberry Pi
 Zero W
In-Reply-To: <20170621224648.44373a00@windsurf>
References: <1498077584-19344-1-git-send-email-yves.deweerdt.linux@gmail.com>
 <20170621224648.44373a00@windsurf>
Message-ID: <20170622222900.6ec535ed@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Yves,

On Wed, 21 Jun 2017 22:46:48 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 21 Jun 2017 22:39:44 +0200, Yves Deweerdt wrote:
> > added a new config file for the Raspberry Pi Zero W (rpi0w)
> > - added new folder for raspberrypi0w
> > - included the overlays in the genimage config
> > - add pi3-miniuart-bt overlay to the config
> > - remove rpi0w device tree from the raspberrypi0_defconfig and genimage
> > 
> > Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
> 
> I'd like a review/ack from Peter Seiderer, or other RPi folks of the
> Buildroot community. I think the commit log should summarize why the
> Zero W support is removed from raspberrypi0_defconfig, and why a
> separate defconfig is needed.
> 

The remaining difference between raspberrypi0_defconfig raspberrypi0w_defconfig
wil be the usage of the pi3-miniuart-bt overlay. As there is no possibility to
enable/disable this on demand I think this is enough to justify a second
configuration (and keep the 'better' ttyAMA0 usage for serial console for
the basic raspberrypi0)...

Regards,
Peter

> > ---
> >  board/raspberrypi/genimage-raspberrypi0.cfg  |  1 -
> >  board/raspberrypi/genimage-raspberrypi0w.cfg | 31 +++++++++++++++++++++++++
> >  board/raspberrypi0w                          |  1 +
> >  configs/raspberrypi0_defconfig               |  2 +-
> >  configs/raspberrypi0w_defconfig              | 34 ++++++++++++++++++++++++++++
> >  5 files changed, 67 insertions(+), 2 deletions(-)
> >  create mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
> >  create mode 120000 board/raspberrypi0w
> >  create mode 100644 configs/raspberrypi0w_defconfig
> 
> An update to board/raspberrypi/readme.txt would be needed.
> 
> Thanks,
> 
> Thomas
