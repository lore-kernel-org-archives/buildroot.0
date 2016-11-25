From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 17:45:58 +0100
Subject: [Buildroot] [PATCH] gpsd: Fix building with gcc 6.x
In-Reply-To: <20161125110042.6680-1-abrodkin@synopsys.com>
References: <20161125110042.6680-1-abrodkin@synopsys.com>
Message-ID: <20161125174558.5cd19867@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 14:00:42 +0300, Alexey Brodkin wrote:
> When building C++ parts of gpsd (for example Qt bindings) with gcc 6.x following
> failure happens, see [1]:
> ------------------------------>8-------------------------------  
> <command-line>:0:0: warning: "_LARGEFILE_SOURCE" redefined
> <command-line>:0:0: note: this is the location of the previous definition
> In file included from clock_gettime.c:10:0:
> compiler.h: In function 'void memory_barrier()':
> compiler.h:93:25: error: 'memory_order_seq_cst' was not declared in this scope
>      atomic_thread_fence(memory_order_seq_cst);
>                          ^~~~~~~~~~~~~~~~~~~~
> compiler.h:93:25: note: suggested alternative:
> In file included from .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/atomic:41:0,
>                  from compiler.h:75,
>                  from clock_gettime.c:10:
> .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/atomic_base.h:62:7: note:   'memory_order_seq_cst'
>        memory_order_seq_cst
>        ^~~~~~~~~~~~~~~~~~~~
> In file included from clock_gettime.c:10:0:
> compiler.h:93:45: error: 'atomic_thread_fence' was not declared in this scope
>      atomic_thread_fence(memory_order_seq_cst);
>                                              ^
> compiler.h:93:45: note: suggested alternative:
> In file included from .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/atomic:41:0,
>                  from compiler.h:75,
>                  from clock_gettime.c:10:
> .../output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/atomic_base.h:101:3: note:   'std::atomic_thread_fence'
>    atomic_thread_fence(memory_order __m) noexcept
>    ^~~~~~~~~~~~~~~~~~~
> scons: *** [qt-clock_gettime.os] Error 1
> scons: building terminated because of errors.
> ------------------------------>8-------------------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
