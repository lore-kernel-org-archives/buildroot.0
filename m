From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 28 Feb 2007 19:37:09 +0100
Subject: [Buildroot] static libgcc_s
In-Reply-To: <45E5A4E6.3010508@indiana.edu>
References: <45E5A4E6.3010508@indiana.edu>
Message-ID: <20070228183709.GA21065@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 28, 2007 at 10:51:02AM -0500, Piotr Adam Zolnierczuk wrote:
> 
> Hi,
> I am trying to compile a flash bootloader for a AT91SAM9260EK board on 
> my Linux box.

U-Boot?

> When I use gnuarm.org precompiled toolchain (gcc-3.4.3) it works fine, 
> but when I use my own toolchain
> (build by buildroot rev 17875, gcc-4.1.1) it complains about missing 
> gcc_s (the bootloader wants to use __divsi3 routine).

either build a toolchain with soft float or remove -msoft-float from the
makefiles in the U-Boot source.

(but the only real option you have is to turn on soft-float when
building, using the kernels FPU-emulation is horribly slow.)

> My toolchain properly builds libgcc_s.so, but for some reasons it does 
> not build libgcc_s.a. Otherwise the toolchain is fine: builds kernel, 
> rootfs etc.
> 
> Any ideas how can I "force" buildroot to build a static version of libgcc_s?

I don't think you need to do that.


Thomas.
