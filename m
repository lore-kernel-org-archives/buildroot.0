From: KARTHIK SEKURU <karthik.sekuru@gmail.com>
Date: Mon, 3 Sep 2012 09:59:16 +0530
Subject: [Buildroot] Issue with "Unknown HZ value! (744514) Assume 100."
Message-ID: <CANev7oUGNDneJ+dLt4gqf-eUGHF6fV3Cuym-n5CvHBau8AViog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,


I am working on porting linux kernel 3.4 to an arm926-ejs based fpga board.


After the kernel bootup, in the command prompt when i am using the command
"ps -l "..i am getting the following

*sh-4.2# ps -l*
*Unknown HZ value! (744514) Assume 100.*
*
*
*
*
*F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD*
*0 S     0    51     1  0  80   0 -   443 wait   ttySAC0  00:00:12 sh*
*0 R     0    56    51  0  80   0 -   297 -      ttySAC0  00:00:04 ps*
*
*
*
*
The issue i am facing is *"I configured the jiffies for 25Hz in the
kernel,still it is assuming 100hz."*

I am using ".ext2"  filesystem build from buildroot.

The option set in buildroot for creating filesystem are as mentioned below:

*(3.4) linux version  *
*uClibc C library Version (uClibc 0.9.33.x)*
*Binutils Version (binutils 2.21.1)*
*GCC compiler Version (gcc 4.7.x)*


The tried the following options --

1. I tried using glibc instead of uclibc in buildroot , but it didn't help.

2. I replaced the linux-3.4.tar.bz from /dl/  folder in buildroot with the
modified linux-3.4.tar.bz where i made CONFIG_HZ as 25.This also didn't fix
the issue.


Please let me know if this issue is because of filesystem created using
buildroot.


Thanks,
Karthik.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120903/054b27d2/attachment-0001.html>
