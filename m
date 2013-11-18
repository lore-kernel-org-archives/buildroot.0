From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Nov 2013 12:17:16 +0100
Subject: [Buildroot] [PATCH] Apply upstream patch to set correct linkage
 on MIPS64
In-Reply-To: <5289F60D.7000805@imgtec.com>
References: <1384772206-57234-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131118120635.52bba816@skate> <5289F60D.7000805@imgtec.com>
Message-ID: <20131118121716.2d42d217@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 18 Nov 2013 11:12:13 +0000, Markos Chandras wrote:

> Thanks for the comments. It does not fix anything yet (affected packages 
> need to start using AUTORECONF), and the libiscsi is just one of the 
> problems so we thought it shouldn't be part of the commit message.

I do understand that the patch itself is not fixing the problems, but
if you don't explain *why* you're backporting something, then it isn't
going to be obvious for the maintainer why this libtool change is
needed.

Something like: "This libtool change ensures that ld uses the right
machine emulation file, which will allow to fix several MIPS64 n32 link
failures, such as the one currently visible on the libiscsi package.
Packages affected by this problem will have to use <pkg>_AUTORECONF =
YES to benefit from this libtool fix, until they are fixed upstream."

> I incorrectly thought that we do not use numbers for patches anymore.

We did not use numbers in the past, and the new (1 year old or so)
policy is to use numbers, to guarantee a correct ordering between
patches.

> v2 to follow soon!

Thanks! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
