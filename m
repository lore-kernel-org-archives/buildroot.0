From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Mar 2016 09:52:01 +0100
Subject: [Buildroot] [PATCH v3] configs/olimex_imx233_olinuxino: switch
	to u-boot
In-Reply-To: <CAPiYbRKwwmyTz4vSEVUVdQZvGmd2MVzRKpktwHhOWih42dSCaQ@mail.gmail.com>
 (Phil Eichinger's message of "Mon, 7 Mar 2016 08:42:24 +0100")
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456598432-4783-1-git-send-email-phil@zankapfel.net>
 <87pov75prw.fsf@dell.be.48ers.dk>
 <CAPiYbRKwwmyTz4vSEVUVdQZvGmd2MVzRKpktwHhOWih42dSCaQ@mail.gmail.com>
Message-ID: <87lh5u6572.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

Hi,

>> See E.G. board/orangepi/orangepipc for an example, thanks!

 > I had a look. Some genimage.cfg use a fixed size of 512MB for the
 > rootfs, some just use the size of the rootfs.
 > I do prefer the later, as I'm able to fit a as small as possible SD
 > card. Especially since 512MB + some MB for the Kernel and bootloader
 > would at least require a 1GB card. What's the intent behind using a
 > 512MB rootfs partition in that case?

I didn't write those genimage configurations, but my understanding is
that the size you specify only sets the size of the PARTITION (E.G. the
data in the MBR), and not the size of the image file (atleast for the
last partition, data in between partitions is probably padded with zeros
/ a sparse file is generated).

The last partition is typically a read/write rootfs, so having some
extra space is often handy. To use it you do need to tell the filesystem
that there's extra space available, E.G. by running resize2fs on the
partition after writing it to a SD card.

The choice of 512MB is afaik pretty arbitrary. I would think that all
our defconfigs create rootfs images < 50MB, so less could certainly also
be used - But do you really have a microsd card smaller than 1G?

-- 
Venlig hilsen,
Peter Korsgaard 
