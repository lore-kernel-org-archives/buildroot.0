From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Jan 2007 16:08:06 +0100
Subject: [Buildroot] Building x86_64 failes
In-Reply-To: <20070119133153.GH14371@priv.blacknet.de>
References: <20070119133153.GH14371@priv.blacknet.de>
Message-ID: <20070119150806.GA16887@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2007 at 02:31:53PM +0100, Goetz Bock wrote:
>Dear list,
>
>after I've successfully build buildroot for i586 on my
>amd64/debian/sarge box, I wanted to build the same rootfs for amd64.
>
>So I copied the existing buildroot, removed build_i586 and
>toolchain_build_i586, ran make clean and make menuconfig to
>reconfigureit for x86_64.
>
>But building the toolchain failes with:
>
>/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:
>In function 'x86_fallback_frame_state':
>/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:152:
>error: 'struct sigcontext' has no member named 'esp'
>.
>. [ more missing e?? members ]
>.

Can you check that uClibc has the correct arch set?
>
>It does not matter what version of binutils/gcc I use, it's always the
>same error.
>(I've tried binutuils: 2.16.1, 2.17, 2.17.50.0.7, 2.17.50.0.9 and gcc
>4.0.3, 4.1.1, 4.2)
>
>The i386 realy irritates me, and I've no idea where it comes from.

The config/i386 is ok

What kernel-headers do you use?

hm. Could it be that you try to compile a 32bit x86-64 compiler? For the
64bit, there is definately no (resp. shouldn't be a) esp.
