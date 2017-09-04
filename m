From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 22:56:44 +0200
Subject: [Buildroot] [PATCH] squashfs: fix build with gcc 7
In-Reply-To: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 25 Jul 2017 21:28:15 +0300")
References: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
Message-ID: <87pob6mbcj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > gcc 7 with -Os (optimize for size) takes the liberty to remove the code of
 > inline function entirely. This leads to undefined function references at link
 > time. Restore gcc original inline behaviour to fix this issue.

 > Fixes:
 > http://autobuild.buildroot.net/results/3c5/3c5b1d799dce3ba361d618330c242bf4eba76019/
 > http://autobuild.buildroot.net/results/09f/09f350b62e2486404b78222dce211400bb233000/
 > http://autobuild.buildroot.net/results/693/693960ed7c01622c756dcc929e83b3b713c16ccc/

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > The gcc doc[1] doesn't mention that feature of C99. A gcc bug, maybe?

 > [1] https://gcc.gnu.org/onlinedocs/gcc/Inline.html

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
