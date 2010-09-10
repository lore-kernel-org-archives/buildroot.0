From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 10 Sep 2010 09:20:16 +0100
Subject: [Buildroot] gdb / gdbserver 6.8 does not stop at breakpoint
	sincebuildroot 2010.05
In-Reply-To: <DF9B554AA3564BFB942A3ABC5820C6FD@AP366>
References: <DF9B554AA3564BFB942A3ABC5820C6FD@AP366>
Message-ID: <06703720D1FB4F5BAF1866A4BBCA70E9@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the record...

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of Will Moore
> Sent: 02 September 2010 16:23
> 
> With 2009.08, 2009.11 and 2010.02 releases I have been able to
> successfully
> use the buildroot built host gdb to remotely debug applications on a
> buildroot built system running gdbserver.  However since 2010.05 release
> (same with 2010.08) while gdb will talk to gdbserver it does not stop at
> breakpoints and the application being debugged on the target just runs.  I
> have been using gdb from within Eclipse however I can also see this from
> the
> command line gdb:
> 
> GNU gdb 6.8-debian
> Copyright (C) 2008 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "i486-linux-gnu"...
> (gdb) show sysroot
> The current system root is
> "/home/apmdev/dx/buildroot-2010.08/output/staging/".
> (gdb) break main
> Breakpoint 1 at 0x8048739: file ../main.c, line 6.
> (gdb) target remote 192.9.200.98:2345
> Remote debugging using 192.9.200.98:2345
> [New Thread 1213]
> 0xb7776828 in _start ()
>    from /home/apmdev/dx/buildroot-2010.08/output/staging/lib/ld-
> uClibc.so.0
> (gdb) continue
> Continuing.
> 
> And that is it, it never stops at the breakpoint ... no errors are given.
> The target gdbserver at this point just runs the application.
> 
> For the host gdb I am running /output/toolchain/gdbhost6.8/gdb/gdb.  I
> have
> used a .gdbinit file that contains only the single line "set sysroot
> /home/apmdev/dx/buildroot-2010.08/output/staging/".
> 
> I assume nobody else is having this problem?
> 
> I appreciate that lots of stuff changes between releases e.g. kernel
> versions, gcc versions, various packages etc however I could not see
> anything obvious in the mailing list to do with the gdb.

It was the move from kernel 2.6.32.9 to 2.6.33.4 that seems to have upset
gdb.  With buildroot 2010.08 selecting 2.6.32.9 kernel once more fixed the
problem.

> 
> I have hit a dead end on this so any suggestions of things to try would be
> appreciated!
> 
> Regards,
> 
> 
> 
> Will
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
