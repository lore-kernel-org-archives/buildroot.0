From: Justin Maggard <jmaggard10@gmail.com>
Date: Tue, 4 Feb 2014 14:26:20 -0800
Subject: [Buildroot] Broken pread() on ARM
Message-ID: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using buildroot on a 32-bit ARM platform, and I have run into
pread issues after recently switching from buildroot-2013.05 to
buildroot-2013.11.  In both cases I'm using a generated uClibc
toolchain, and uClibc 0.9.33.2.  Comparing the strace outputs of both,
the offset shows up differently.  As an extra data point, I tried the
latest uClibc snapshot instead of 0.9.33.2, and it worked fine again.

I see there are a number of extra uClibc patches that were added
between 2013.05 and 2013.11.  Perhaps we have just the right
combination of backports to make some platforms work, while breaking
others?

-Justin
