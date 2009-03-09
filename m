From: Will Newton <will.newton@gmail.com>
Date: Mon, 9 Mar 2009 17:36:19 +0000
Subject: [Buildroot] socket(PF_FILE, SOCK_STREAM, 0) not implemented
In-Reply-To: <kg91ff.12vtc6@webmail.variomedia.de>
References: <kg91ff.12vtc6@webmail.variomedia.de>
Message-ID: <87a5b0800903091036p328d0acexc2740d32dbac79b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 9, 2009 at 5:18 PM, Karl Krach <mailinglists@bluespirit.la> wrote:
>
> Hello,
>
> I have a handheld device with kernel 2.4.19 and am working with qt 3.3, gcc
> version 2.95 and glibc.
>
> For evaluation purposes I try to get the latest Qt version (4.5.0) running. So
> i need the uClibc 0.9.29 or greater and the gcc with at least version 4.0.1.
>
> I have downloaded the latest buildroot sources from svn (gcc 4.3.3, uClibc
> 0.9.30), compiled qt and created a chroot on my board. I ve also mounted /proc
> and /dev. But when using sockets (e.g. for qt's QWS), I get the error
> "Function not implemented":
>
> brk(0x137f4) ? ? ? ? ? ? ? ? ? ?= 0x137f4
> brk(0x14000) ? ? ? ? ? ? ? ? ? ?= 0x14000
> socket(PF_FILE, SOCK_STREAM, 0) = -1 ENOSYS (Function not implemented)
> stat64("/root/Settings/Trolltech.conf", 0xbffff2d8) = -1 ENOENT
>
> With my old environment (gcc 2.95 and glibc) the same test code is working
> without problems.
>
> When checking the uClibc code, I got stuck at a _syscall2. Do I have
> incompatibilities between the uClibc and my kernel? Is my chroot not right
> configured?

It looks as if the kernel headers you built uClibc with do not match
your kernel.
