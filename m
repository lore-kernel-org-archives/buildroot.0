From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 10 Oct 2008 09:08:13 +0200
Subject: [Buildroot] "make menuconfig" error
In-Reply-To: <8c09713c0810092354j5ec58b17y47ac9a8e2fddf5fb@mail.gmail.com>
References: <8c09713c0810092354j5ec58b17y47ac9a8e2fddf5fb@mail.gmail.com>
Message-ID: <20081010070813.GA6148@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 10, 2008 at 02:54:45PM +0800, Jerry.Zhang wrote:
>Hello, everyone!
>
>Very nice to meet you here!
>
>Host: ubuntu 8.04
>gcc:  4.2.3
>GNU make 3.81
>
>I was trying to compile the buildroot.        After I issue the "make
>menuconfig", some errors pops out.
>The output is as belows. It seems that it could not find the headers
>(ctype.h, stdlib.h, stdio.h, string.h, unistd.h, time.h)
>Could anyone  just tell me why ? How should i handle this ??
>
>  root at Hawk:/home/jerry/projectroot/buildroot# make menuconfig
>make CC="/usr/bin/gcc" -C package/config conf mconf
>make[1]: Entering directory
>`/home/jerry/projectroot/buildroot/package/config'
>/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE -DKBUILD_NO_NLS -g -O2  -c
>conf.c -o conf.o
>conf.c:6:19: error: ctype.h: No such file or directory
>conf.c:7:20: error: stdlib.h: No such file or directory
>conf.c:8:19: error: stdio.h: No such file or directory
>conf.c:9:20: error: string.h: No such file or directory
>conf.c:10:20: error: unistd.h: No such file or directory
>conf.c:11:18: error: time.h: No such file or directory
>conf.c:12:22: error: sys/stat.h: No such file or directory

You need to install libc6-dev (the C library development package).
