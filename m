From: Ran Shalit <ranshalit@gmail.com>
Date: Mon, 19 Mar 2018 09:42:40 +0200
Subject: [Buildroot] time difference between kernel timestamp and uptime
Message-ID: <CAJ2oMh+EZn32ocjJerdpqGcQ0HVm7AiobLAuh_6wDu6jmOq9GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am facing a time difference, between kernel timestamp, and uptime
command as following:

# uptime;  echo "hello" > /dev/kmsg;
 00:04:20 up 4 min,  load average: 0.00, 0.00, 0.00
# dmesg -c
[  258.487438] hello

There is about ~2-3 seconds difference.

Is there a way to resolve this time difference ?
Seems that busybox uptime can't be used with millisecond resolution,
so the difference is in seconds resolution (instead of milliseconds,
which would have been preferred). Is there any alternative for getting
boot time in millisecond format ? Should use the kernel printing
instead, for a better resolution >

kernel version is 4.10:

uname -a
Linux buildroot 4.10.181 #1 SMP Sat Jan 13 21:06:19 MST 2018 i686 GNU/Linux

Thanks you,
ranran
