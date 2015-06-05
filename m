From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 15:34:40 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <CAHXCMMLLPS5=_OWMVigMu=Ebbi0dxu-Ph5k7M5B4a4J9zrrgyw@mail.gmail.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLLPS5=_OWMVigMu=Ebbi0dxu-Ph5k7M5B4a4J9zrrgyw@mail.gmail.com>
Message-ID: <20150605153440.74d12bb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 5 Jun 2015 13:59:50 +0200, Samuel Martin wrote:

> > +define ROOTFS_ISO9660_CMD
> > +       $(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito \
> > +               -no-emul-boot -boot-load-size 4 -boot-info-table \
> > +               -o $@ $(ISO9660_TARGET_DIR)
> 
> Why the fakeroot trickery on genisoimage call is gone? or why is it
> not needed anymore?

That's the whole point of moving to the common rootfs infrastructure:
all the fakeroot trickery is handled by it. Look at the ext2 or ubifs
logic, none of them call fakeroot, because it's done in common code in
fs/common.mk.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
