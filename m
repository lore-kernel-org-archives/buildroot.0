From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Sep 2016 08:50:00 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI am335x-evm
In-Reply-To: <f297e95d-443c-06e1-3430-4ab4a752e964@gmail.com> (Lothar Felten's
 message of "Fri, 23 Sep 2016 00:21:42 +0200")
References: <1471261882-5640-1-git-send-email-lothar.felten@gmail.com>
 <20160918193045.15a33be3@free-electrons.com>
 <87fuotya3r.fsf@dell.be.48ers.dk>
 <20160921105303.1832ad5e@free-electrons.com>
 <87bmzhy6ci.fsf@dell.be.48ers.dk>
 <20160921121803.487035d8@free-electrons.com>
 <877fa5y1y2.fsf@dell.be.48ers.dk>
 <20160921140912.29c4584e@free-electrons.com>
 <f297e95d-443c-06e1-3430-4ab4a752e964@gmail.com>
Message-ID: <87eg4bnm93.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lothar" == Lothar Felten <lothar.felten@gmail.com> writes:

Hi,

 > I changed the patches, they now update the current beaglebone, the
 > defconfigs will be: beaglebone_defconfig and beaglebone_qt_defconfig.
 > The readme.txt lists the supported targets.

Ok, great!

 >>> Uboot SD card patch:
 >>> Early AM335x-evm boards can only use 1 bit communication to the SD card, on
 >>> newer board revisions this might be fixed.
 >>> Forcing 1 bit communication slows down the communication but will work
 >>> regardless if the SD card is attached via 1 or 4 bits.
 >>> If the board has a working 4 bit SD card interface, this patch can be removed,
 >>> this will speed up the access.
 >> 
 >> Do you still have those early AM335x EVM boards? Are they widespread?
 >> I'm wondering if it really makes sense to have this patch.

 > I've only use two EVMs and they both have the issue, I'm not sure that
 > it ever got fixed. Any board will run in 1 bit mode, but some evms
 > won't run in 4 bit mode, so I think that's a safe choice. Anyway, it
 > applies to the uboot only.

What is the upstream status of this? Have you discussed it on the u-boot
list? Right now, this is a hack that isn't suitable for upstream, but
how about tweaking omap_hsmmc host_cap if we are running on the evm?

As it stands, the beaglebone boards are also forced into 1bit mode even
though they don't have the problem.


 >> Does this really work for the BeagleBone, which uses ttyO2 if I
 >> remember correctly? Maybe another reason to have a defconfig that
 >> supports just the am335x_evm.

 > The beaglebone (ttyO0 on USB) beagleboneblack (ttyO0 on pinheader) and
 > the evm (sub d 9 pin) all use ttyO0

Ok, great!

-- 
Venlig hilsen,
Peter Korsgaard 
