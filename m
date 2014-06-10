From: Toshi Morita <toshi@peernova.com>
Date: Tue, 10 Jun 2014 11:09:46 -0700
Subject: [Buildroot] gdbserver compile problem on buildroot-2014.05
Message-ID: <CANFXpYNT98nofVkVCZqt5giFpf2YJeVt8OKBqaka=s0pMo1Row@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using buildroot-2014.05, and gdbserver seems to have compile problems.
Any suggestions on what to look at?

/home/tm/buildroot/buildroot-2014.05/output/host/usr/bin/
arm-buildroot-linux-uclibcgnueabi-gcc -c -pipe -Os     -I. -I.
-I./../common -I./../regformats -I./../../include -I./../gnulib/import
-Ibuild-gnulib-gdbserver/import -Wall -Wdeclaration-after-statement
-Wpointer-arith -Wformat-nonliteral -Wno-char-subscripts  thread-db.c
In file included from thread-db.c:30:0:
./../common/gdb_thread_db.h:124:3: error: unknown type name ?uint32_t?
./../common/gdb_thread_db.h:215:5: error: unknown type name ?uintptr_t?
./../common/gdb_thread_db.h:285:3: error: unknown type name ?intptr_t?
./../common/gdb_thread_db.h:286:3: error: unknown type name ?intptr_t?
thread-db.c: In function ?find_one_thread?:
thread-db.c:315:6: error: ?struct lwp_info? has no member named ?th?
thread-db.c: In function ?attach_thread?:
thread-db.c:340:6: error: ?struct lwp_info? has no member named ?th?
thread-db.c: In function ?thread_db_get_tls_address?:
thread-db.c:513:47: error: ?struct lwp_info? has no member named ?th?
thread-db.c: In function ?try_thread_db_load_from_sdir?:
thread-db.c:708:30: error: ?LIBTHREAD_DB_SO? undeclared (first use in this
function)
thread-db.c:708:30: note: each undeclared identifier is reported only once
for each function it appears in
thread-db.c: In function ?try_thread_db_load_from_dir?:
thread-db.c:719:29: error: ?LIBTHREAD_DB_SO? undeclared (first use in this
function)
thread-db.c: In function ?thread_db_load_search?:
thread-db.c:748:41: error: ?LIBTHREAD_DB_SEARCH_PATH? undeclared (first use
in this function)
thread-db.c: In function ?thread_db_handle_monitor_command?:
thread-db.c:971:7: error: ?LIBTHREAD_DB_SEARCH_PATH? undeclared (first use
in this function)
thread-db.c: In function ?try_thread_db_load_from_sdir?:
thread-db.c:709:1: warning: control reaches end of non-void function
[-Wreturn-type]
make[1]: *** [thread-db.o] Error 1
make[1]: Leaving directory `/home/tm/buildroot/buildroot-
2014.05/output/build/gdb-7.5.1/gdb/gdbserver'
make: *** [/home/tm/buildroot/buildroot-2014.05/output/build/gdb-7.5.1/.stamp_built]
Error 2
tm at tm-VirtualBox:~/buildroot/buildroot-2014.05$
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/c641bcdc/attachment.html>
