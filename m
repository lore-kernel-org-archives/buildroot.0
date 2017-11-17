From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Nov 2017 22:33:32 +0100
Subject: [Buildroot] out of tree kernel patches question
In-Reply-To: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
 (daggs@gmx.com's message of "Fri, 17 Nov 2017 14:16:17 +0100")
References: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
Message-ID: <87efowy4ib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

 > Greetings,
 > when it comes to the odroidc2 support, there are 3 things that I'm concerned about:
 > 1. gcc is limited to 4.9.x
 > 2. old uboot (2005.11).
 > 3. very old kernel (3.14.79).

 > #1 is needed because #2, currently upstream uboot support this board
 > from 2007.05 but I've tried for months to get upstream uboot to work
 > with the vendor's kernel without any luck.
 > unfortunately, the uboot mailing list isn't helpful at all (no one seems to care much),
 > this means that in order to solve issue #2, the kernel needs to be upgraded.
 > latest upstream kernel holds bask support for this board, the
 > development is progressing. now assuming that I take patches existing
 > in the kernel mailing list that adds missing support for features in
 > the kernel to a point that the board can be used in a decent manner,
 > what is the policy of adding out of the kernel patches to a board in
 > buildroot?

Maybe it makes more sense to do it the other way around? First move to
the mainline kernel and once that is done move to mainline u-boot as
well. I've used 4.13 with the vendor u-boot without problems.

The only issue I am aware of for moving to mainline u-boot was an issue
with HDMI output, as the driver assumed certain things were initialized
in the bootloader, which was true for the vendor one but not mainline -
But that is getting fixed:

https://lkml.org/lkml/2017/10/17/134

As for carrying patches in Buildroot - That is OK for me as long as they
are not huge and the patches are only temporary (E.G. patches have
already been submitted upstream and hopefully acked, but they just
haven't been merged yet).

-- 
Bye, Peter Korsgaard
