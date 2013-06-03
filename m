From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jun 2013 11:38:57 +0200
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <CAJxxZ0MzWeQ4USQbwNwAuxGpkvwcejqaZvC7bGpySrZCdzus+g@mail.gmail.com>
References: <20130529213510.43fc1372@skate>
 <CAJxxZ0MzWeQ4USQbwNwAuxGpkvwcejqaZvC7bGpySrZCdzus+g@mail.gmail.com>
Message-ID: <20130603113857.0c7ff74a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Mon, 3 Jun 2013 17:26:08 +0800, Sonic Zhang wrote:

> For historic reasons, Blackfin GNU toolchain generate assembly symbols
> with the prefix '_'. For example: _uconvmsg_dat and _icudt48_dat .
> But, the pkgdata tool in icu doesn't generate assembly file
> uconvmsg_dat.s and icudt48l_dat.s in this way when Blackfin GNU
> toolchain is used. What do you think is a better way to fix it?

Can this specific behavior of the Blackfin toolchain be detected? Is
there a typical autotools test that would allow to test this?

Adding Mike in Cc, since I'm pretty sure he has some ideas about this.

> /buildroot/output/build/host-icu-4.8.1.1/source/bin/pkgdata -p
> uconvmsg -O pkgdata.inc -m static -s uconvmsg -d uconvmsg -T uconvmsg
> uconvmsg/uconvmsg.lst
> 
> 
> .globl uconvmsg_dat
>         .section .note.GNU-stack,"",%progbits
>         .section .rodata
>         .align 8
>         .type uconvmsg_dat,%object
> uconvmsg_dat:
> ...
> 
> 
> In addition, I am fine to receive the test log by this email.

Ok, I'll work on this.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
