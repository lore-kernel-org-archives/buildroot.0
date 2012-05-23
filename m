From: Will Newton <will.newton@gmail.com>
Date: Wed, 23 May 2012 14:09:22 +0100
Subject: [Buildroot] gcc 4.2.4 toolchain
In-Reply-To: <CACDP-tcryHMzAjQ2iw+pRcGavZamDSHStABz5NFxfVrK3-iYzw@mail.gmail.com>
References: <CACDP-tcryHMzAjQ2iw+pRcGavZamDSHStABz5NFxfVrK3-iYzw@mail.gmail.com>
Message-ID: <CAFbHwiS-A6u9suwWALQO4C_j4iSC7inPd3LuEdDopdGP8N3oSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 22, 2012 at 11:50 PM, Andrew Chambers
<andrewchamberss@gmail.com> wrote:
> Hello,
>
> Recently ive tried to build a custom mips linux kernel version 2.6.28 under
> the buildroot-2012.02. However all gcc versions listed do not support
> some deprecated gcc inline assembly syntax being used extensively.
>
> Is it possible to use gcc 4.2.4 with buildroot-2012.02 . I manually added it
> to the buildroot menu but when attempting a mips build the toolchain i
> recieve the following errors while building the cross compiler ...
>
> ???????????????? from
> /Users/andrewc/Desktop/buildroot-2012.02/output/toolchain/gcc-4.2.4/gcc/unwind-sjlj.c:36:
> /Users/andrewc/Desktop/buildroot-2012.02/output/toolchain/gcc-4.2.4/gcc/gthr-posix.h:43:21:
> error: pthread.h: No such file or directory
>
> i have tried using linux threads and native posix options , but both require
> pthread which cant be found.

Hi Andrew,

It is pretty simple to add back gcc 4.2.4 support to buildroot. The
issue you see here is due
to a missing patch, which should be available in the older releases as
Peter suggested. The
patch in question is called 1001-gcc-4.2.x-inhibit-libc.patch but it
is probably safest just to
add back all the 4.2.4 patches.
