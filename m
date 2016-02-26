From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 15:57:50 +0100
Subject: [Buildroot] [PATCH v3] pandaboard_defconfig: bump u-boot to
	2015.10 and kernel to 4.3
In-Reply-To: <1455041692-12727-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Tue, 9 Feb 2016 16:14:52 -0200")
References: <1455041692-12727-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87lh67v7rl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

Hi,

 > VFPv3 and NEON was enabled and a readme.txt file was added.
 > Fixes bug #7580.

 > Tested on Pandaboard ES.

Sorry for the slow response. I have now dug out my pandaboard and tested
this.

> +++ b/configs/pandaboard_defconfig
 > @@ -1,37 +1,26 @@
 > -# Architecture
 >  BR2_arm=y
 >  BR2_cortex_a9=y
 > -
 > -# system
 > -BR2_TARGET_GENERIC_GETTY=y
 > +BR2_ARM_ENABLE_NEON=y
 > +BR2_ARM_ENABLE_VFP=y
 > +BR2_ARM_EABI=y

There's afaik no reason to use the old EABI instead of EABIhf on panda
(E.G. the binary gpu drivers are available in EABIhf variants as well),
so I've changed that and committed to next, thanks.

I've also added extra commits to bump the u-boot and kernel versions to
the latest, use ext4 instead of ext2 and generate a sdcard image using
genimage.

-- 
Bye, Peter Korsgaard
