From: Anders Darander <anders.darander@gmail.com>
Date: Sun, 29 Jan 2012 10:07:58 +0100
Subject: [Buildroot] Gdb(server) on ARM and uClibc
In-Reply-To: <87fwezjyqq.fsf@macbook.be.48ers.dk>
References: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
 <87fwezjyqq.fsf@macbook.be.48ers.dk>
Message-ID: <CAE4k23_kCCeNio9-4KrubF9HYSXOFp9rd2wvJhM_WASHgqiu6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 28, 2012 at 22:36, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:
>
> Hi,
>
> ?Anders> Hi,
> ?Anders> I'm probably missing something simple when it comes to my
> ?Anders> uClibc-configuration... (Or is there still problems with gdb on uClibc
> ?Anders> and ARM?)
>
> ?Anders> I'm getting "error: No uintptr_t available; your C library is too
> ?Anders> old." when I'm compiling uClibc. I've tried both 7.2.x and 7.3.x. Next
>
> I'm getting confused. Are you talking about uClibc or gdb here?

Sorry for not being that clear... The above versions is gdb-versions.
I'm using uClibc 0.9.32.

> ?Anders> step will be to merge the tree I've based my work on sofar with
> ?Anders> master, and try 7.4, however I doubt that it'll help me... (I've sofar
> ?Anders> based this work on the tree
> ?Anders> https://github.com/fhunleth/buildroot-beaglebone.git, as I'm working
> ?Anders> on a beaglebone. I know that the tree in question is getting close to
> ?Anders> 2 months behind master now, but apart from the 7.4 inclusion, I
> ?Anders> haven't seen anything in the git log that I immediately recognize as a
> ?Anders> potential solution).
>
> I recently fixed a fairly serious gdb issue (afb6e3ed52142e), but that
> doesn't sound the problem you're having.
>
> I'll be starting an am335x based project soon, so I plan on integrating
> am335x / beaglebone support into mainline.

Sounds great!

> ?Anders> Any ideas were to start looking?

I've added the make error below. I'm using the default uClibc
configuration from toolchaing/uClibc/uClibc-0.9.32.config.

> ?Anders> I've mostly been out of the buildroot world for a 1 1/2 year, working
> ?Anders> on OE instead.
>
> Welcome back then ;)

Thanks!
Although for the moment it is primarily that I'm back as we''ve
decided to go for the beaglebone for our embedded Linux trainings. And
I really appreciate the relative ease of use and configuration in
buildroot when it comes to training. (Well, for some of our internal
projects, I'd have preferred buildroot, even though that would have
led us to handle two build systems.)


Part of the build output from gdbserver. This is where it starts to
fail... Quite likely, I'm missing some uClibc-configuration option (at
least I hope so).

/home/anders/Courses/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-c -pipe -Os ?-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os ?-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 ? -I.
-I/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver
-I/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../common
-I/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../regformats
-I/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../../include
-Wall -Wdeclaration-after-statement -Wpointer-arith
-Wformat-nonliteral -Wno-char-subscripts -Werror
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/proc-service.c
In file included from
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:31:0:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../gdb_thread_db.h:122:3:
error: expected specifier-qualifier-list before ?uint32_t?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../gdb_thread_db.h:208:2:
error: #error No uintptr_t available; your C library is too old.
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/../gdb_thread_db.h:293:3:
error: expected specifier-qualifier-list before ?intptr_t?
In file included from
/home/anders/Courses/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.3/include/stdint.h:3:0,
? ? ? ? ? ? ? ? ?from
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:37:
/home/anders/Courses/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/stdint.h:131:23:
error: two or more data types in declaration specifiers
/home/anders/Courses/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/stdint.h:131:32:
error: expected identifier or ?(? before ?;? token
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?thread_db_enable_reporting?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:237:3:
error: ?td_thr_events_t? has no member named ?event_bits?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:238:3:
error: ?td_thr_events_t? has no member named ?event_bits?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?find_one_thread?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:293:20:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:295:18:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:298:32:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:307:11:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:316:6:
error: ?struct lwp_info? has no member named ?th?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?attach_thread?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:330:25:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:331:25:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:332:40:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:336:27:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:341:6:
error: ?struct lwp_info? has no member named ?th?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:351:13:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?maybe_attach_thread?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:367:40:
error: ?td_thrinfo_t? has no member named ?ti_lid?
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?thread_db_get_tls_address?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:514:47:
error: ?struct lwp_info? has no member named ?th?
cc1: warnings being treated as errors
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:515:19:
error: cast to pointer from integer of different size
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:520:18:
error: cast from pointer to integer of different size
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?thread_db_load_search?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:709:41:
error: ?LIBTHREAD_DB_SEARCH_PATH? undeclared (first use in this
function)
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:709:41:
note: each undeclared identifier is reported only once for each
function it appears in
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:718:26:
error: ?LIBTHREAD_DB_SO? undeclared (first use in this function)
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:
In function ?disable_thread_event_reporting?:
/home/anders/Courses/buildroot/output/toolchain/gdb-7.3.1/gdb/gdbserver/thread-db.c:847:4:
error: ?td_thr_events_t? has no member named ?event_bits?
make[1]: *** [thread-db.o] Error 1
make[1]: *** Waiting for unfinished jobs....
arm-with-neon.c updated.
arm-with-vfpv3.c updated.
make[1]: Leaving directory
`/home/anders/Courses/buildroot/output/build/gdbserver-7.3.1'
make: *** [/home/anders/Courses/buildroot/output/build/gdbserver-7.3.1/gdbserver]
Error 2

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
