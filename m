From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Apr 2012 11:06:36 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.1
In-Reply-To: <CAHXCMM+98uc8qCuKvmsnt2sGiXheahRMbF0TRvn_DNH+O6aeeA@mail.gmail.com>
 (Samuel Martin's message of "Thu, 26 Apr 2012 09:52:31 +0200")
References: <1334517476-15258-1-git-send-email-s.martin49@gmail.com>
 <874ns7ar7b.fsf@macbook.be.48ers.dk>
 <CAHXCMM+98uc8qCuKvmsnt2sGiXheahRMbF0TRvn_DNH+O6aeeA@mail.gmail.com>
Message-ID: <87vckmamle.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Hi Peter, all,
 Samuel> 2012/4/26 Peter Korsgaard <jacmet@uclibc.org>:
 >>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
 >> 
 >> ?Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 >> 
 >> Thanks. On what toolchain as this been tested?
 Samuel> I tested it using an "Armdeus-like" toolchain or a qemu_arm_versatile
 Samuel> + WCHAR + gettext toolchain,
 Samuel> based on the head of master at the time of the submission.

Seems you forgot to update the cxx patch:

>>> lttng-libust 2.0.1 Patching package//lttng-libust

Applying lttng-libust-dont-build-cxx-tests-when-not-available.patch using patch: 
patching file configure.ac
Hunk #1 succeeded at 45 (offset 7 lines).
patching file tests/Makefile.am
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file tests/Makefile.am.rej
Patch failed!  Please fix lttng-libust-dont-build-cxx-tests-when-not-available.patch!

I also added a new patch fixing build with uClibc > 0.9.32 a few minutes
ago.

Care to fix and resubmit?

-- 
Bye, Peter Korsgaard
