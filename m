From: Andrew Parlane <andrewp@carallon.com>
Date: Thu, 27 Nov 2014 12:05:18 +0000
Subject: [Buildroot] Perf questions on a 3.10.17 kernel on IMX6
Message-ID: <5477137E.4090303@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm attempting to do some profiling of a QT5 application on an IMX6 
running a 3.10.17 kernel, based of a boundary devices BSP. All built 
through buildroot 2014.08

Firstly to get perf to build I needed to apply a patch to 
linux/tools/lib/lk/Makefile to get it to honour cross compiling. I found 
the commit in the 3.12.33 branch of the kernel.org GIT. 
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/tools/lib/lk/Makefile?id=3c4797d46c14fa0c7cf733a77bd4b28875078b53

Running "perf test -v" it doesn't look so happy. Output log here: 
http://slexy.org/view/s21a2Nugr8

I'm having problems getting debug symbols in the output. I've spent a 
couple of days reading up on perf and trying various options. I can get 
some kernel debug symbols, but nothing from userspace. I'm pretty sure 
I've built my app with -Og -ggdb -fno-omit-frame-pointer -Wl,--build-id.

If anyone has any suggestions, that would be useful.

My other question is has anyone had any success recording on a target 
environment and then analysing on the build machine? Allowing debug 
symbols to be supplied only on the build machine? I got perf built for 
the host using buildroot, it runs but I still don't see debug symbols, 
and I can't see how to pass in a binary with debug symbols for it to use 
(like you would using gdbserver on the target and gdb on the host).

If anyone has any advice on using perf like this, it would be much 
appreciated.

Thanks,
Andrew Parlane
Carallon LTD.
