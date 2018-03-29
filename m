From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 29 Mar 2018 10:58:39 +0000
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <1519027005.14718.2.camel@synopsys.com>
References: <20171219145554.17718-1-didin@synopsys.com>
 <1517385496.6038.3.camel@synopsys.com>
 <1517993000.5728.8.camel@synopsys.com>
 <1519027005.14718.2.camel@synopsys.com>
Message-ID: <1522321118.2593.20.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

More than 3 months have passed since the second version of patch was sent and there were no??any response/comment.
Could you please apply this patch if there is no problems with it?

Best regards,
Evgeniy Didin

On Mon, 2018-02-19 at 07:56 +0000, Alexey Brodkin wrote:
> Hi gents,
> 
> Most probably this thread somehow slipped through the cracks...
> I guess that's already too late for 2018.02 as we're on RC2 already :(
> 
> But anyways is there a chance to review/comment on this one?
> 
> -Alexey
> 
> On Wed, 2018-02-07 at 09:43 +0100, Alexey Brodkin wrote:
> > Hi Thomas, Peter, Arnout,
> > 
> > On Wed, 2018-01-31 at 10:58 +0300, Alexey Brodkin wrote:
> > > Hello,
> > > 
> > > On Tue, 2017-12-19 at 17:55 +0300, Evgeniy Didin wrote:
> > > > Synopsys DesignWare HSDK (which stands for ARC HS
> > > > Development Kit) is the latest and greatest development
> > > > platform that sports quad-core ARC HS38 in real silicon.
> > > > 
> > > > Most noticeable features of the board are:
> > > > ?* Quad-core ARC HS38 CPU running at 1GHz
> > > > ?* 4Gb of DDR
> > > > ?* Built-in Vivante GPU (well supported via open source
> > > > ???Etnaviv drivers)
> > > > ?* Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)
> > > > 
> > > > And as usual we have:
> > > > ?* [micro] SD-card slot
> > > > ?* 2 USB 2.0 ports
> > > > ?* 1Gbit Ethernet port
> > > > ?* Built-in Digilent JTAG probe
> > > > ?* Serial port accessible via micro-USB port
> > > > 
> > > > Writing sdcard.img on SDcard creates two partitions:
> > > > ?* FAT32 with uImage and uboot.env
> > > > ?* EXT4 with root filesystem
> > > > 
> > > > We modify kernel config because in default hsdk kernel config
> > > > CONFIG_INITRAMFS_SOURCE parameter is set and when we build
> > > > rootfs separately (BR2_TARGET_ROOTFS_INITRAMFS is not set)
> > > > error appears. Also we set up CONFIG_ARC_UBOOT_SUPPORT which
> > > > enables usage of uboot variables in the boot process.
> > > > 
> > > > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > > > Cc: arc-buildroot at synopsys.com
> > > > ---
> > > > Changes since v1:
> > > > -add entries in DEVELOPERS and .gitlab-ci.yml
> > > > -change genimage-hsdk.cfg to genimage.cfg
> > > > -enable BR2_TARGET_UBOOT_ENVIMAGE against mkenvimage in post-image.sh
> > > > -add renaming "uboot-env.bin" to "uboot.env" in post-image.sh
> > > > -changed tar to gzip when archiving sdcard.img
> > > 
> > > I'm worried if we can make it merged before the next Buildroot
> > > release. Any comments [except probably requirement to rebase as?
> > > it's been more than a month since v2 was posted] or/and suggestions on
> > > this one?
> > 
> > Please pardon myself for being that annoying but it looks like 2018.02-rc1
> > was recently cut and that patch is not there yet.
> > 
> > It would be really cool if we may still get this one merged ASAP so
> > it becomes a part of the upcoming release.
> > 
> > FWIW the board was now officially released, see?
> > https://www.synopsys.com/dw/ipdir.php?ds=arc-hs-development-kit
> > and we're looking forward to have more people working with that
> > quite capable board.
> > 
> > -Alexey
