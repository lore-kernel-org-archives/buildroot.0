From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 20:20:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: include signal.h to
 fix build errors
In-Reply-To: <20161023144115.19982-1-bernd.kuhls@t-online.de>
References: <20161023144115.19982-1-bernd.kuhls@t-online.de>
Message-ID: <20161023202051.0a8e4b05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 16:41:15 +0200, Bernd Kuhls wrote:
> Fixes build errors with uClibc-ng on the following platforms:
> 
> bfin: http://autobuild.buildroot.net/results/fbf/fbf63bbe0974b490b875a95fb930ba601364b85a/
> m68k: http://autobuild.buildroot.net/results/cc9/cc9b87c4c695f97a056cc53f19e7662750dffeff/
> microblazeel: http://autobuild.buildroot.net/results/941/941c06e29f6542e258f20799dc6f3f94b2f8af88/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> I am unsure whether this is the right fix or not, therefore I did not
> send the patch upstream yet. A different solution is to include signal.h
> in sysroot/usr/include/pthread.h in line 686, right before the header
> file bits/sigthread.h is included. This may point to a problem either in
> the prebuilt toolchain or uClibc itself, CC'ing Thomas & Waldemar.

I already reported this issue to Waldemar yesterday. I think it's a
uClibc-ng bug, because:

 1/ It happens only with -std=c99

 2/ It shouldn't be necessary to include another header to make
    #include <pthread.h> work properly.

See
http://mailman.uclibc-ng.org/pipermail/devel/2016-October/001235.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
