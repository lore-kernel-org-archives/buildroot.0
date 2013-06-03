From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 3 Jun 2013 17:26:08 +0800
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <20130529213510.43fc1372@skate>
References: <20130529213510.43fc1372@skate>
Message-ID: <CAJxxZ0MzWeQ4USQbwNwAuxGpkvwcejqaZvC7bGpySrZCdzus+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

For historic reasons, Blackfin GNU toolchain generate assembly symbols
with the prefix '_'. For example: _uconvmsg_dat and _icudt48_dat .
But, the pkgdata tool in icu doesn't generate assembly file
uconvmsg_dat.s and icudt48l_dat.s in this way when Blackfin GNU
toolchain is used. What do you think is a better way to fix it?

/buildroot/output/build/host-icu-4.8.1.1/source/bin/pkgdata -p
uconvmsg -O pkgdata.inc -m static -s uconvmsg -d uconvmsg -T uconvmsg
uconvmsg/uconvmsg.lst


.globl uconvmsg_dat
        .section .note.GNU-stack,"",%progbits
        .section .rodata
        .align 8
        .type uconvmsg_dat,%object
uconvmsg_dat:
...


In addition, I am fine to receive the test log by this email.

Regards,

Sonic


On Thu, May 30, 2013 at 3:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Sonic,
>
> On our autobuilders, a number of Blackfin builds end up failing with a
> problem on the icu package, which otherwise seems to build fine on
> other architectures.
>
> See
> http://autobuild.buildroot.org/results/0f9/0f953610792aa75f9bb1f9218bcac27b2786e3f8/build-end.log
> for one occurrence of this problem. It would be nice if you could have
> a look and figure out a way of solving this build problem.
>
> Generally speaking, would you be interested in receiving a daily e-mail
> that contains the list of build failures that occurred on the previous
> day, and that are related to the Blackfin architecture? Supporting an
> architecture in Buildroot also means to have this architecture in a
> good shape in terms of autobuilders testing.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
