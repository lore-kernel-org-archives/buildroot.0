From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 12:02:38 +0200
Subject: [Buildroot] [PATCH] qt: add patch fixing build failure on ARMv8
	in 32-bit mode
In-Reply-To: <20170908073507.6009-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 8 Sep 2017 09:35:07 +0200")
References: <20170908073507.6009-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87lgl8werl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Qt package currently fails to build on ARMv8 cores in 32-bit mode
 > (for example, if you select ARM and then Cortex-A53), because the ARM
 > atomic operation implementation in Qt checks if we're on ARMv7, then
 > on ARMv6, and otherwise falls back to an ARMv5 implementation. The
 > latter uses the swp instruction, which doesn't exist on ARMv8, causing
 > a build failure.

 > To solve this, we simply add a patch that uses the ARMv7 atomic
 > operations for ARMv8-A.

 > There is no autobuilder reference because we don't have any ARMv8
 > 32-bit configuration in the autobuilders.

 > Cc: <ivychend@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Peter: this should go to 2017.02.x, the problem was reported on IRC by
 > ivychend who is using 2017.02.5.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
