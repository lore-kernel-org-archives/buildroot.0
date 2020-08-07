From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 07 Aug 2020 10:32:27 +0200
Subject: [Buildroot] [PATCH] package/boost: fixup Optimization flag in
 boost build
In-Reply-To: <20200806201650.GG2186@scaer>
Message-ID: <55-5f2d1180-1-5f33a980@99011495>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
 
On Thursday, August 06, 2020 22:16 CEST, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote: 
 
> Michael, All,
> 
> On 2020-08-05 14:41 +0200, Michael Nosthoff spake thusly:
> > When building with Boost Build the CXXFLAGS are extended depending
...
> 
> Unfortunately, that does not seem to work:
> 
>     gcc.compile.c++ bin.v2/libs/thread/build/gcc-9.2.1/release/threadapi-pthread/threading-multi/visibility-hidden/pthread/thread.o
>     "/home/ymorin/dev/buildroot/O/host/bin/arm-none-linux-gnueabihf-g++"
>         -fvisibility-inlines-hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>         -D_FILE_OFFSET_BITS=64  -Os   -fPIC -pthread -O3 -finline-functions
>         -Wno-inline -Wall -fvisibility=hidden -Wextra -Wno-long-long
>         -Wno-unused-parameter -Wunused-function -pedantic -DBOOST_ALL_NO_LIB=1
>         -DBOOST_THREAD_BUILD_DLL=1 -DBOOST_THREAD_DONT_USE_CHRONO
>         -DBOOST_THREAD_POSIX -DNDEBUG  -I"." -c -o
>         "bin.v2/libs/thread/build/gcc-9.2.1/release/threadapi-pthread/threading-multi/visibility-hidden/pthread/thread.o"
>         "libs/thread/src/pthread/thread.cpp"
> 

Unfortunately that is true. I had some changes in my tree that made it appear to work.
So it seems i have to fall back to the sed-based approach. I'll send a v2 shortly.

Regards,
Michael
