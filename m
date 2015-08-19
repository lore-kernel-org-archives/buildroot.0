From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Aug 2015 22:57:56 +0200
Subject: [Buildroot] [PATCH] boost: fix build on ARC
In-Reply-To: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Aug 2015 20:26:52 +0200")
References: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zj1n6lnv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to Boost to make it use the eventfd()
 > function provided by the C library when uClibc is used, rather than
 > falling back to using directly the __NR_eventfd system call. This
 > fixes the build on ARC, which doesn't define __NR_eventfd.

What does it then do? Only __NR_eventfd2?

 > The original problem is that uClibc fakes to be glibc 2.2, which
 > didn't had eventfd(), so Boost makes the system call
 > manually. uClibc-ng, in its next release, will pretend to be glibc
 > 2.10 (see
 > http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3),
 > which will also fix the problem, but requires bumping the uClibc
 > version, rebuilding the external toolchains, and so on.

 > Ideally, Boost should be doing a compile test to detect if eventfd()
 > is available or not, but the Boost build system is so brain-damage

s/damage/damaged/

Committed, thanks.

-- 
Bye, Peter Korsgaard
