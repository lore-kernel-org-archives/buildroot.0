From: Ulf Samuelsson <ulfs@dof.se>
Date: Tue, 23 Jan 2007 00:32:37 +0100
Subject: [Buildroot] microcom broken with latest uclibc snapshot.
Message-ID: <049801c73e80$cf0bedf0$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the latest uClibc snapshot to build the toolchain,
It looks like the high speeds are not acceptable (> 1151200) 
and the generated <staging_dir>/arm-linux/sys-include/bits/termios.h
has higher speeds commented away.

#if 0 /* limited on uClibc, keep in sync w/ cfsetspeed.c */
#define B230400 0010003
...
#endif

This is not a good idea, if the MCU can handle higher speed!

It also breaks microcom-1.02.

Best Regards,
Ulf Samuelsson
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070123/d9c4616a/attachment.htm 
