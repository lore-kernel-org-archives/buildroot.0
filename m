From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 11:41:12 +0100
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <CAM+bi4sKAyBrLjAKfBBkDMVDLReBHffqUCfdDvU61X1wErLfNA@mail.gmail.com>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
 <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
 <20131120111027.472fe84b@skate>
 <CAM+bi4sKAyBrLjAKfBBkDMVDLReBHffqUCfdDvU61X1wErLfNA@mail.gmail.com>
Message-ID: <20131120114112.03abac2f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro Gamez,

On Wed, 20 Nov 2013 11:36:00 +0100, Alvaro Gamez wrote:

> Now that I take the time to revisit Xilinx' website, I think maybe
> we're doing something wrong...
> 
> Old Xilinx git repository,
> http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries now
> redirect to github: https://github.com/xilinx and seems to be quite
> up to date with upstream gcc.

These repositories are exactly the repositories that Spenser patches
are using for the internal toolchain backend.

See:

  http://patchwork.ozlabs.org/patch/291045/ (binutils)
  http://patchwork.ozlabs.org/patch/291046/ (gcc)
  http://patchwork.ozlabs.org/patch/291047/ (glibc)
  http://patchwork.ozlabs.org/patch/291048/ (gdb)

> There seems to be also a later version of GNU Tools available at
> http://www.xilinx.com/guest_resources/gnu/
> 
>    - GNU Tools for MicroBlaze (gcc 4.6.4, gdb 7.6.0, binutils 2.23.2,
>    newlib 1.19, eglibc-2.18) -
> mb_gnu_20131023.tar.gz<http://www.xilinx.com/guest_resources/member/mb_gnu/mb_gnu_20131023.tar.gz>
> 
> I don't know how up to date are these downloads, but it may be worth
> a try? Although if we're going ahead with Spenser's patches maybe we
> can/(want to?) avoid Xilinx altogether?

We are not avoiding Xilinx altogether at all, please look at Spenser
patches.

*However* the tarballs you're pointing at at
http://www.xilinx.com/guest_resources/gnu/ look interesting for
pre-built external toolchains. I'm currently downloading "GNU Tools for
MicroBlaze (gcc 4.6.4, gdb 7.6.0, binutils 2.23.2, newlib 1.19,
eglibc-2.18)", and I'll have a look at what it is exactly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
