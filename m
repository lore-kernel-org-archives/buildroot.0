From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 14:05:33 +0100
Subject: [Buildroot] DirectFB + linux-headers-2.6.28.1 compilation
	problem
In-Reply-To: <fce2a370901230456m52a0b2d4xd74c5121ec3cdd6d@mail.gmail.com>
	(Ihar Hrachyshka's message of "Fri\,
	23 Jan 2009 14\:56\:40 +0200")
References: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
	<87sknakx0f.fsf@macbook.be.48ers.dk> <1232715256.6350.7.camel@sven>
	<fce2a370901230456m52a0b2d4xd74c5121ec3cdd6d@mail.gmail.com>
Message-ID: <87k58mkw9u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ihar" == Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:

 >> Yes. Seems to be a problem in the kernel headers.

 Ihar> Yes, it's a kernel headers bug. Should be fixed for next versions I think.

Ahh yes, I see it now:

commit 60c20fb8c00a2b23308ae4517f145383bc66d291
Author: Andy Whitcroft <apw@canonical.com>
Date:   Fri Jan 2 13:49:04 2009 +0000

    serial: RS485 ioctl structure uses __u32 include linux/types.h

I don't see it in 2.6.28.2-rc1 though, but I'll backport to 2.6.28.1.

-- 
Bye, Peter Korsgaard
