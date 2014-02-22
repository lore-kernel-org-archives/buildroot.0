From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:24:11 +0100
Subject: [Buildroot] [PATCH 1/2] evas: depend on thread support
In-Reply-To: <1393093203-12370-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 19:20:02 +0100")
References: <1393093203-12370-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnxyuc9g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Evas has an optional mechanism to do asynchronous preloading of
 > images. This mechanism is optional, and in commit
 > b6d92bf415df33ac86487d68f5f8299f406859d2 ("libevas: async image
 > preload support needs threads support in toolchain"), Peter made sure
 > to disable the asychronous preloading when no thread support was
 > available.

 > Unfortunately, it seems like disabling the asynchronous loading is
 > rarely used, and it in facts fails to build: a member of structure is
 > not present when asynchronous preloading is disabled, but the code
 > continues to use it.

 > Since the fix is not obvious, and all this mechanism seems to have
 > changed completely in EFL 1.8.x, and we probably don't care much about
 > EFL without threads, this commit adds a dependency of libevas on
 > thread support. Consequently, it also reverts commit
 > b6d92bf415df33ac86487d68f5f8299f406859d2 which is no longer necessary.

 > Of course, this commit propagates this additional dependency to the
 > reverse dependencies of libevas.

 > Fixes:

 >   http://autobuild.buildroot.org/results/6de/6de90018a9eeb9c495d15046a8b3270eb95a5550//
 >   http://autobuild.buildroot.org/results/693/693df99db4ab357b48d427be3a72f6d64dd53065//

Committed both, thanks.

-- 
Bye, Peter Korsgaard
