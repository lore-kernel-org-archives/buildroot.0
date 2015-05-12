From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Tue, 12 May 2015 17:38:03 +0100
Subject: [Buildroot] Question about filesystem and Valgrind
Message-ID: <00a301d08cd2$050a5b50$0f1f11f0$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am not sure if this is a buildroot issue, but buildroot 2015.02 is the
tool I use to build my filesystem for an Arm based embedded board that I am
using.

I am using libc  (rather than uclibc) and when I run Valgrind on my target
it fails with. 

> --2993:0:aspacem  Valgrind: FATAL: aspacem assertion failed:

> --2993:0:aspacem    segment_is_sane

 

The issue it is identifying is with the filesystem:

If I cat /proc/self/maps I get

00008000-00106000 r-xp 00000000 00:00 8773       /bin/busybox

0010e000-0010f000 rw-p 000fe000 00:00 8773       /bin/busybox

0010f000-00111000 rw-p 00000000 00:00 0          [heap]

b6dae000-b6eea000 r-xp 00000000 00:00 8937       /lib/libc-2.13.so

                                ^^^^^

                                 dev & ino are always zero

 

the entry for /lib/libc-2.13.so should not have 00 for the device number.

I am not sure where to start with this, is this something I can configure
via build root or is it a kernel config  issue. Any clues on where to start
would be greatly appreciated.

 

Regards

John

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150512/fa206689/attachment.html>
