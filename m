From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:25:08 +0100
Subject: [Buildroot] [PATCH] configs: atmel: ensure EABIhf is selected
	for sama5d*
In-Reply-To: <20160223211829.GA10681@piout.net> (Alexandre Belloni's message
 of "Tue, 23 Feb 2016 22:18:29 +0100")
References: <1456244344-12726-1-git-send-email-alexandre.belloni@free-electrons.com>
 <87fuwj6tot.fsf@dell.be.48ers.dk> <20160223211829.GA10681@piout.net>
Message-ID: <8737sj6rwr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

Hi,

 >> We also have a atmel_sama5d3_xplained_mmc_defconfig that you
 >> forgot. Committed with that fixed, thanks.

 > I changed it and I forgot to amend my commit, thanks for fixing that.

You're welcome.


 >> It seems like we need to fixup the other defconfigs using EABIHF as well
 >> :/ In hindsight, maybe BR2_ARM_ENABLE_VFP should have defaulted to 'y'
 >> instead.
 >> 

 > Off list, I was suggesting to Thomas add BR2_ARM_ENABLE_VFP = y to all
 > defconfigs with a BR2_ARM_FPU_VFP* but it only catches four more
 > defconfigs. However, there are a lot more, like beaglebone, the
 > allwiner based boards, most of the freescale ones, etc...

This is only a problem for CPU cores where the VFP is optional like
arm926/A5/A9, and I've fixed up our A9 configs now so I believe it is
ok.

-- 
Venlig hilsen,
Peter Korsgaard 
