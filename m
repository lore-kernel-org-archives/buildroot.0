From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Mar 2016 21:12:51 +0100
Subject: [Buildroot] [PATCH v3] configs/olimex_imx233_olinuxino: switch
	to u-boot
In-Reply-To: <1456598432-4783-1-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Sat, 27 Feb 2016 19:40:32 +0100")
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456598432-4783-1-git-send-email-phil@zankapfel.net>
Message-ID: <87pov75prw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

 > mxs-bootlets broke somewhere in between toolchain version bumps.
 > Directly boot u-boot, as this is supported now, but it requires updated
 > partitioning (see readme.txt)

 > Drop mxs-bootlets patches, they aren't needed anymore.

 > Kernel is built as an uImage because the u-boot defconfig expects an
 > uImage on the second partition.

 > Tested on iMX233-OLinuXino-MINI hardware.

 > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
 > ---
 > Changes v3 -> v2:
 >  - Explain why an uImage is used
 >  - Add tested on which hardware
 >  - Set u-boot version to 2006.01
 >   (suggested by Thomas Petazzoni)

Committed with the changes suggested by Arnout, thanks.


 >  You'll need a spare MicroSD card with Freescale's special partition layout.
 > -This is basically two partitions:
 > +This is basically three partitions:
 
 > -1) Type 53, the bootstrap + bootloader/kernel partition, should be 16MB.
 > -2) Anything you like, for this example an ext2 partition, type 83 (linux).
 > +1) Type 53, the u-boot partition, should be 16MB.
 > +2) VFAT, place Kernel as uImage there
 > +3) Anything you like, for this example an ext2 partition, type 83 (linux).
 
 >  Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
 >  and from the buildroot project top level directory:

This seems like a good fit for genimage. Can you verify that you are
able to boot from a complete sdcard image generated with genimage and
then send a patch to create it in a post-image script?

See E.G. board/orangepi/orangepipc for an example, thanks!

-- 
Bye, Peter Korsgaard
