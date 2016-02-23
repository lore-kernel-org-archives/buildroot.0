From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 10:12:47 +0100
Subject: [Buildroot] [PATCH v2] configs/olimex_imx233_olinuxino: switch
 to u-boot
In-Reply-To: <CAPiYbRJgxCXCNSasxzzzS86-u-+wqZ4UyBLzhpkcb_huWkwqeg@mail.gmail.com>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456122476-6210-1-git-send-email-phil@zankapfel.net>
 <20160222234908.5cd7b5a7@free-electrons.com>
 <CAPiYbRJgxCXCNSasxzzzS86-u-+wqZ4UyBLzhpkcb_huWkwqeg@mail.gmail.com>
Message-ID: <20160223101247.243becf1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 00:24:12 +0100, Phil Eichinger wrote:

> > Tested-by tags are meant to be given by other people, not the patch
> > author, since we assume you have tested the patches you are
> > submitting :-)
> 
> This should read Tested-on-actual-hardware-by ;-)

Then this should be mentioned explicitly in the commit log, as it's
useful information.

> >> -BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
> >> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
> >> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
> >
> > Any reason to use an appended uImage? If you're using a recent version
> > of U-Boot, you should use bootz to boot a zImage, and boot with a DTB
> > separate from the kernel.
> 
> The reason behind this is the u-boot defconfig boots an uImage by default.
> So I thought this defconfig should provide the easiest starting point for anyone
> trying to get an image up and running.

Makes sense. Then keep it this way, but please mention that in the
commit log as well. zImage + separate DTB is normally the "modern" way
of booting on ARM, so it's the situation we normally expect to see when
a defconfig is modernized. If it isn't this way, then it's good to have
the explanation that you gave.

> > Finally, but this is a possible improvement for the future, you could
> > probably replace the complicated sequence of commands to build the SD
> > card by a nice post-image script that relies on genimage. But this is
> > for another patch.
> 
> I was thinking of something like an post-image script but doesn't that
> mean to settle on
> something like the smallest SD card possible?
> Or were you thinking more of an interactive post-image script?

Look at the other boards that use genimage, simply do:

	git grep genimage board/

And you will see multiple examples of genimage usage.

> > Could you send an updated version that takes into account the above
> > suggestions?
> 
> Sure, tomorrow!
> Thanks for your thorough review, again I've learned a lot!

You're welcome. Thanks to you for contributing in the first place!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
