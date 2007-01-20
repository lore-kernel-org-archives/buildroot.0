From: Goetz Bock <bock@blacknet.de>
Date: Sat, 20 Jan 2007 13:51:16 +0100
Subject: [Buildroot] Building x86_64 failes
In-Reply-To: <20070119150806.GA16887@aon.at>
References: <20070119133153.GH14371@priv.blacknet.de>
	<20070119150806.GA16887@aon.at>
Message-ID: <20070120125116.GJ14371@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, Jan 19 '07 at 16:08, Bernhard Fischer wrote:
> On Fri, Jan 19, 2007 at 02:31:53PM +0100, Goetz Bock wrote:
> > [ ... I'm unable to build buildroot toolchain for x96_64 ... ]
> >/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:
> >In function 'x86_fallback_frame_state':
> >/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:152:
> >error: 'struct sigcontext' has no member named 'esp'
> >.
> >. [ more missing e?? members ]
> >.
> 
> Can you check that uClibc has the correct arch set?

The toolchain_build_x86_64/uClibc-0.9.28/.config lists:
TARGET_x86_64=y
ARCH_SUPPORTS_LITTLE_ENDIAN=y
TARGET_ARCH="x86_64"
ARCH_LITTLE_ENDIAN=y
KERNEL_SOURCE="/build/buildroot.amd64/toolchain_build_x86_64/linux"

In the KERNEL_SOURCE dir include/asm is linked to asm-x86_64

> What kernel-headers do you use?

I'm using the 2.6.12.0 headers, as my kernel will be 2.6.18 from Etch

> hm. Could it be that you try to compile a 32bit x86-64 compiler? For the
> 64bit, there is definately no (resp. shouldn't be a) esp.

That's at last not what I intend. I want to build a small rescueue
system to work with Debian Etch kernels.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
