From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 13:29:05 +0200
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <20160419212441.6a0454e9@free-electrons.com>
 <20160419201733.GA19934@smipidev>
 <CAGm1_kv4ipig0JpHxiBDV7b0roUrY_7sr0To=iNJuNYR_YhtcA@mail.gmail.com>
 <20160420164216.GA26814@smipidev>
 <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
Message-ID: <20160421132905.7c271814@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 12:55:12 +0200, Yegor Yefremov wrote:

> >> Have made basic tests, i.e. changing configuration for barebox and
> >> barebox-2 and running make to see, if proper barebox was compiled.
> >> Everything is working the way it was in v4 from this point of view.
> >
> > Thanks! Did you flash a bare SD card or the internal eMMC with boot.vfat and
> > rootfs.ext4 as part of the tests?
> 
> If I copy your images (MLO, barebox.bin) directly to the FAT
> partition, everything starts as expected. But I dd boot.vfat, the
> system doesn't boot and shows only CCCCC, though I have no problems
> mounting the first partition in Linux.
> 
> sudo dd if=/tmp/boot.vfat of=/dev/sdd1 bs=1M

So this means that the Barebox build is OK, and only the genimage part
is causing problems. But this doesn't prevent from merging the barebox
aspects of the series (patches 1 to 6), which are really the important
part. The last patch is really more a defconfig proving that it works,
I am not even sure that in practice we want to merge a defconfig for
BeagleBone that is just different from beaglebone_defconfig in the fact
that it uses Barebox instead of U-Boot. Peter?

Peter, I think you looked at using genimage on AM335x, what were your
conclusion? On OMAP3, there were some very strict geometry restrictions
in the romcode, but I don't remember if your conclusion is that they
also apply to AM335x or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
