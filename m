From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 20:58:12 +0200
Subject: [Buildroot] CMake issue with pthread library (bug report)
In-Reply-To: <CAO2+NUABZp7JAY=yNDegsQCcRZhaHhg9kGmcyKWbddiGdckSFA@mail.gmail.com>
References: <CAO2+NUABZp7JAY=yNDegsQCcRZhaHhg9kGmcyKWbddiGdckSFA@mail.gmail.com>
Message-ID: <20201006205812.3cc979a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Leonid,

On Tue, 6 Oct 2020 01:12:10 +0300
?????? ????? <leo@yuriev.ru> wrote:

> The reason is that CMake doesn't link executables and so-libraries
> with the pthread library and doesn't use the '-pthread' flag either.
> If you dig a little deeper, you can see that the Assembly always
> breaks when the code of pthreads functions is in the separate library
> (which should be linked explicitly).
> 
> I observe this behavior with cmake 3.17.4 on Fedora 32 and with cmake
> 3.16.3 on Ubuntu 20.04.
> At the same time, I am sure that everything is correct in my CMakefiles.
> In particular, when building locally for a host system, I see the
> `-pthread` flag in the linking commands (or linking with a pthread
> library on the other host).
> 
> I looked at support/misc/toolchainfile.cmake.in and
> package/pkg-cmake.mk but I didn't notice any errors.
> So, it would be nice for someone else to pay attention to this problem.

I don't immediately have a good suggestion, I didn't try to reproduce
the issue. However, CMake/pthread issues remind me of
-DTHREADS_PTHREAD_ARG=OFF that we are passing to a number of packages.
But it seems to be there to work around issues with CMake versions
older than 3.10, so it doesn't seem to be related to what you're seeing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
