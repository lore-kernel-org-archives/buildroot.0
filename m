From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:14:45 +0200
Subject: [Buildroot] Recommended cross toolchain for ARM
In-Reply-To: <20130723060305.GA6169@zuhnb712.ap.bm.net>
References: <20130723060305.GA6169@zuhnb712.ap.bm.net>
Message-ID: <20130727161445.1ca8a5c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 23 Jul 2013 14:03:05 +0800, Woody Wu wrote:

> Do you guys have a suggested cross toolchain?  I want to use glibc
> instead of uclibc, so in the buildroot default supported options, it
> left only Sourcery CodeBench (SCB).  But SCB seems not a very completed
> toolchain, when I use it to compile some of my applications, I found it
> missed with some definitions (such as RLIM_*) which should normally
> appear in a standard header file.

Sourcery CodeBench toolchains usually work fine. Could you point to
specific problems with them, i.e which package fails to build, with
which version of the Sourcery CodeBench? Most likely, if your
application fails to build with a Sourcery CodeBench toolchain, it's
because your application doesn't #include the right header files.

> Then I tried, Linaro, but it seems that it do not well support my armv5t
> core. Anyway, I run with errors after configured it with buildroot.

The Linaro toolchains are built for ARMv7, so the C library they
contain will only work on ARMv7+ processors.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
