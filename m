From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 4 Nov 2012 20:41:45 +0100
Subject: [Buildroot] new perl build issue
In-Reply-To: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
Message-ID: <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/4 Alexander Khryukin <alexander@mezon.ru>:
> Hi.
> I'm trying to build new perl package
> and get error
> http://pastie.org/5181814
>
>
> FATAL: kernel too old
> The program compiled OK, but exited with status 1.
> You have a problem.  Shall I abort Configure [y]
> Ok.  Stopping Configure.
>
> Looks like perl package get kernel version string via uname or /proc
> 2.6.32-279.9.1.el6.x86_64 my kernel
>

the message 'FATAL: kernel too old' seems to come from qemu.

refering line number from http://pastie.org/5181814
a file 'try.c' containing line 74 & 75 is cross-compiled successfully
into 'try' by the command line 79.
the command line 80 fails to execute it with qemu.
    $ /home/fdkit/buildroot/output/build/perl-5.16.1/Cross/run-qemu-arm ./try

'Cross/run-qemu-arm' is a one line script which wraps 'qemu-arm'.

this afternoon, Thomas has posted 3 patches for qemu (see
http://patchwork.ozlabs.org/patch/197055/).
Alexander, try to rebuild host-qemu with them.

Fran?ois

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
