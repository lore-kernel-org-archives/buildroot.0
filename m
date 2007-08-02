From: Claudio Leonel <leonel@elaxys.com>
Date: Thu, 02 Aug 2007 17:31:44 -0300
Subject: [Buildroot] "sendto: Invalid argument"  revisited
Message-ID: <46B23F30.9090504@elaxys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am having a problem with an ARM board with a filesystem
I built with buildroot where some networks commands
like ping and others show the error:
   "sendto: Invalid argument"

But I can ping the board from an external host and do several
networking operations.

Searching the lists I found at least two similar occurrences
of this problem and no proposed cause or solution:

http://buildroot.uclibc.org/lists/buildroot/2007-May/002709.html
http://www.busybox.net/lists/busybox/2006-December/025702.html


Running strace seems to indicate the problem is in calling
Linux system call 290: sendto, which returns EINVAL to
the application.

..............................
gettimeofday({2119, 59692}, NULL)       = 0
SYS_290(0x3, 0xbeb8dc5c, 0x40, 0, 0xa83e8) = -1 EINVAL (Invalid argument)
close(3)                                = 0
..............................


My current target/tools configuration:

Hardware : AT91RM9200 (ARM9TDMI)
Kernel   : 2.6.14
buildroot: snapshot 1/Aug/2007
uClibc   : 0.9.29 ABI: OABI
binutils : 2.17
gcc      : 4.2.0

Could this problem be:

- An OABI/EABI problem ? (Then kernel uses OABI and
   I configured uClibc to use OABI)
- a uClibc problem ?
- cross-compiler problem ?
- Any other sugestions ?


Best regards,
Claudio Leonel
