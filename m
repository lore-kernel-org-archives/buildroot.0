From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:47:08 +0200
Subject: [Buildroot] [git commit] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <20190803103754.5B0808129C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 3 Aug 2019 12:33:15 +0200")
References: <20190803103754.5B0808129C@busybox.osuosl.org>
Message-ID: <87blw7k5k3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > With a C library which does not provide fenv.h, it won't work at runtime:
 > Crash after an "import numpy" on python.

 > Since numpy v1.16.0:
 > "Alpine Linux (and other musl c library distros) support
 > We now default to use fenv.h for floating point status error reporting.
 > Previously we had a broken default that sometimes would not report
 > underflow, overflow, and invalid floating point operations. Now we can
 > support non-glibc distrubutions like Alpine Linux as long as they ship
 > fenv.h."

 > Disable python-numpy for uClibc to avoid the runtime errors.

 > ARC's glibc used to have an incomplete fenv.h, but this has been fixed
 > since commit be0aaaaecda5 ("toolchain: bump ARC tools to arc-2019.03
 > release"), so we don't need an exception for ARC.

 > Two patches attempted to fix the build for uclibc and glibc for ARC, but
 > didn't fix the runtime issue. Remove those patches.

 > Signed-off-by: Damien DUVAL <damien.duval@smile.fr>
 > Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
 > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.05.x (2019.02.x uses 1.15.1), thanks.

-- 
Bye, Peter Korsgaard
