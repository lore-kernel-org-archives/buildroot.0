From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Jun 2014 06:28:00 +0200
Subject: [Buildroot] gdbserver compile problem on buildroot-2014.05
In-Reply-To: <CANFXpYPnmOY-dfJzK66Vkt0JRuF0howD7fPSjyKxtR1jwDd0_A@mail.gmail.com>
References: <CANFXpYNT98nofVkVCZqt5giFpf2YJeVt8OKBqaka=s0pMo1Row@mail.gmail.com>
 <01e3093b-3486-4712-bb9b-229de05f51e0@email.android.com>
 <CANFXpYNUssB_VnnOrxQMY=UzbozcEO=CPG8jyw7FU=io9r-Knw@mail.gmail.com>
 <CAAXf6LWZURewJH_yhqA9=Z-sfGMk5djB-0UCm_8B72-0R_L1dw@mail.gmail.com>
 <CANFXpYPnmOY-dfJzK66Vkt0JRuF0howD7fPSjyKxtR1jwDd0_A@mail.gmail.com>
Message-ID: <3a8b3d0b-86bd-46a8-b29d-f3bfbc306921@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Toshi Morita <toshi@peernova.com> schreef:
>On Wed, Jun 11, 2014 at 10:33 AM, Thomas De Schampheleire <
>patrickdepinguin at gmail.com> wrote:
>
>> Hi Toshi,
>>
>> (please don't top-post)
>>
>> On Tue, Jun 10, 2014 at 9:06 PM, Toshi Morita <toshi@peernova.com> wrote:
>> [..]
>> >> Toshi Morita <toshi@peernova.com> schreef:
>> >> >I'm using buildroot-2014.05, and gdbserver seems to have compile
>> >> > problems.
>> >> >Any suggestions on what to look at?
>> >> >
>> >> >/home/tm/buildroot/buildroot-2014.05/output/host/usr/bin/
>> >> >arm-buildroot-linux-uclibcgnueabi-gcc -c -pipe -Os     -I. -I.
>> >> >-I./../common -I./../regformats -I./../../include -I./../gnulib/import
>> >> >-Ibuild-gnulib-gdbserver/import -Wall -Wdeclaration-after-statement
>> >> >-Wpointer-arith -Wformat-nonliteral -Wno-char-subscripts  thread-db.c
>> >> >In file included from thread-db.c:30:0:
>> >> >./../common/gdb_thread_db.h:124:3: error: unknown type name ?uint32_t?
>> >> >./../common/gdb_thread_db.h:215:5: error: unknown type name ?uintptr_t?
>> >> >./../common/gdb_thread_db.h:285:3: error: unknown type name ?intptr_t?
>> >> >./../common/gdb_thread_db.h:286:3: error: unknown type name ?intptr_t?
>> >> >thread-db.c: In function ?find_one_thread?:
>> >> >thread-db.c:315:6: error: ?struct lwp_info? has no member named ?th?
>> >> >thread-db.c: In function ?attach_thread?:
>> >> >thread-db.c:340:6: error: ?struct lwp_info? has no member named ?th?
>> >> >thread-db.c: In function ?thread_db_get_tls_address?:
>> >> >thread-db.c:513:47: error: ?struct lwp_info? has no member named ?th?
>> >> >thread-db.c: In function ?try_thread_db_load_from_sdir?:
>> >> >thread-db.c:708:30: error: ?LIBTHREAD_DB_SO? undeclared (first use in
>> >> > this
>> >> >function)
>> >> >thread-db.c:708:30: note: each undeclared identifier is reported only
>> >> > once
>> >> >for each function it appears in
>> >> >thread-db.c: In function ?try_thread_db_load_from_dir?:
>> >> >thread-db.c:719:29: error: ?LIBTHREAD_DB_SO? undeclared (first use in
>> >> > this
>> >> >function)
>> >> >thread-db.c: In function ?thread_db_load_search?:
>> >> >thread-db.c:748:41: error: ?LIBTHREAD_DB_SEARCH_PATH? undeclared (first
>> >> > use
>> >> >in this function)
>> >> >thread-db.c: In function ?thread_db_handle_monitor_command?:
>> >> >thread-db.c:971:7: error: ?LIBTHREAD_DB_SEARCH_PATH? undeclared (first
>> >> > use
>> >> >in this function)
>> >> >thread-db.c: In function ?try_thread_db_load_from_sdir?:
>> >> >thread-db.c:709:1: warning: control reaches end of non-void function
>> >> >[-Wreturn-type]
>> >> >make[1]: *** [thread-db.o] Error 1
>> >> >make[1]: Leaving directory `/home/tm/buildroot/buildroot-
>> >> >2014.05/output/build/gdb-7.5.1/gdb/gdbserver'
>> >> >make: ***
>> >> >
>> [/home/tm/buildroot/buildroot-2014.05/output/build/gdb-7.5.1/.stamp_built]
>> >> >Error 2
>> >> >tm at tm-VirtualBox:~/buildroot/buildroot-2014.05$
>>
>>
>>
>>
>> I tried to reproduce this problem using your .config, but the build
>> succeeds here, there is no problem.
>> Have you tried from a clean environment? Using 'make clean all' ?
>>
>> Thanks,
>> Thomas
>>
>
>make clean all fixed the problem. Thanks!

That's good to hear!
Do remember to always keep the list in copy, so other people also know the problem is fixed.

Best regards,
Thomas
