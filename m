From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 18:36:33 +0100
Subject: [Buildroot] [PATCH v2 1/8] libunwind: fix C library dependency
In-Reply-To: <1453929930-18215-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Jan 2016 22:25:23 +0100")
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453929930-18215-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87egcwcoym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The libunwind package currently dependency on glibc *or* uclibc
 > snapshot. However, we are going to remove the support for uclibc
 > snapshot, and uClibc-ng has equivalent functionality as uclibc
 > snapshot. Moreover, musl is also capable of building libunwind for
 > certain architectures.

 > Therefore, this commit reworks the architecture dependencies of
 > libunwind, to make it available on all architectures for which it is
 > supported, depending on the capabilities of the different C libraries,
 > and the implementation of libunwind on each architecture.

 > On some architectures, libunwind uses the C library *context()
 > functions, which are not provided by musl at all, and not provided by
 > uClibc on all architectures. But on some other architectures,
 > libunwind does not use the C library *context() functions, which
 > explains why it can be built with musl on such architectures.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
