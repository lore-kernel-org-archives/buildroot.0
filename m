From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Nov 2017 09:02:04 +0100
Subject: [Buildroot] out of tree kernel patches question
In-Reply-To: <trinity-7fff4d5c-60f2-49ab-834f-06fc54b81cdb-1510991266180@3c-app-mailcom-bs13>
 (daggs@gmx.com's message of "Sat, 18 Nov 2017 08:47:46 +0100")
References: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
 <87efowy4ib.fsf@dell.be.48ers.dk>
 <trinity-7fff4d5c-60f2-49ab-834f-06fc54b81cdb-1510991266180@3c-app-mailcom-bs13>
Message-ID: <8760a8xber.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

Hi,

 >> Maybe it makes more sense to do it the other way around? First move to
 >> the mainline kernel and once that is done move to mainline u-boot as
 >> well. I've used 4.13 with the vendor u-boot without problems.
 >> 
 >> The only issue I am aware of for moving to mainline u-boot was an issue
 >> with HDMI output, as the driver assumed certain things were initialized
 >> in the bootloader, which was true for the vendor one but not mainline -
 >> But that is getting fixed:
 >> 
 >> https://lkml.org/lkml/2017/10/17/134
 >> 
 >> As for carrying patches in Buildroot - That is OK for me as long as they
 >> are not huge and the patches are only temporary (E.G. patches have
 >> already been submitted upstream and hopefully acked, but they just
 >> haven't been merged yet).
 >> 

 > as I wrote to Thomas, the main reason for this question is to remove
 > the gcc 4.9.x constraint.  without upgrading uboot, that cannot be
 > dropped.  I was working on upgrading the uboot while keeping the
 > vendor's kernel but the board won't boot.  afaics, uboot works, the
 > issue is that the kernel doesn't gets loaded at all.

I get that, but preferably we want to use mainline u-boot AND kernel,
and if the combination of mainline-uboot + vendor-kernel doesn't work
then it makes more sense to do it the other way around.

-- 
Bye, Peter Korsgaard
