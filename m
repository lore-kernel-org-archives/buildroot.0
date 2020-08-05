From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 17:31:22 +0200
Subject: [Buildroot] Status of LLVM
In-Reply-To: <e54d173f-533b-1abf-1b74-ea8286fe88a2@gmail.com>
References: <CAGt4E5vRu+xVXtaze8+6CmWFXSmzJx2PV46bC7STiDnKCqksRw@mail.gmail.com>
 <31f39a1d-1436-0952-43e8-561135e6aa60@gmail.com>
 <e54d173f-533b-1abf-1b74-ea8286fe88a2@gmail.com>
Message-ID: <20200805173122.0d201e51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Aug 2020 16:36:12 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Last year I was able to build an aarch64 system with clang 8 (rootfs + kernel)
> on a Potato Board.
> 
> Recently I tried again with a riscv64 target running under qemu:
> 
> https://asciinema.org/a/DDspJVktlVl1Rh97dwLgtYcRY
> 
> Clang: 10.0
> kernel: 5.7.12
> Busybox: 1.31.1 + patch
> gcc toolchain: Bootlin riscv64--glibc--bleeding-edge-2020.02-2.defconfig
> 
> I need some time to continue to work on this series and convince upstream to add
> cland support in Buildroot. But it means more maintenance work for Buildroot
> maintainers/contributors to fix all packages that fail to build with clang.
> At least, we need to enable autobuilders testing with clang if this support is
> added.

I think it makes sense to have support for clang in Buildroot, and we
can certainly add testing for clang configurations in our autobuilders.

The one thing that was still a bit unclear for me is whether it is
possible to build a system with just clang, without a gcc compiler at
all. Indeed, Buildroot isn't really suited/designed for building two
different compilers/toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
