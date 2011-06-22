From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Wed, 22 Jun 2011 14:00:32 +0700
Subject: [Buildroot] Issue with pthread_mutex_lock with external toolchain
Message-ID: <BANLkTi=VZ=q7MTfyf453BAAfEqqAZ41Lpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I am testing pcscd of pcsc-lite and I got segmentation fault, following is
the gdb backtrace:

# gdb /usr/sbin/pcscd
GNU gdb 6.8
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html
>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-unknown-linux-gnueabi"...
(no debugging symbols found)
(gdb) run --foreground --debug --apdu
Starting program: /usr/sbin/pcscd --foreground --debug --apdu
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
debuglog.c:277:DebugLogSetLevel() debug level=debug
debuglog.c:306:DebugLogSetCategory() Debug options: APDU
pcscdaemon.c:550:main() pcsc-lite 1.7.2 daemon ready.
[New LWP 1183]

Program received signal SIGSEGV, Segmentation fault.
[Switching to LWP 1183]
0x400624e8 in pthread_mutex_lock () from /lib/libpthread.so.0
(gdb)


Has anyone faced the same issue in the past and came up with solution?

Many thanks in advance



--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110622/ca0f85fc/attachment.html>
