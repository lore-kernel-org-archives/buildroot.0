From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:47:12 +0200
Subject: [Buildroot] ELFUTILS - only build for the target architecture...
In-Reply-To: <CACxOKoKEi0OnY+aq1i6S=zX5XnDnu_pMVWtGmEpnDB7CrdW2cw@mail.gmail.com>
References: <CACxOKoKEi0OnY+aq1i6S=zX5XnDnu_pMVWtGmEpnDB7CrdW2cw@mail.gmail.com>
Message-ID: <20201013134712.023269ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maurice,

On Mon, 12 Oct 2020 17:06:26 -0600
Maurice Smulders via buildroot <buildroot@busybox.net> wrote:

> Currently, ELFUTILS gets built for all architectures it looks like.
> 
> safe:/usr/lib/elfutils> ls  
> libebl_aarch64-0.177.so  libebl_i386.so           libebl_s390-0.177.so
> libebl_aarch64.so        libebl_ia64-0.177.so     libebl_s390.so
> libebl_alpha-0.177.so    libebl_ia64.so           libebl_sh-0.177.so
> libebl_alpha.so          libebl_m68k-0.177.so     libebl_sh.so
> libebl_arm-0.177.so      libebl_m68k.so           libebl_sparc-0.177.so
> libebl_arm.so            libebl_ppc-0.177.so      libebl_sparc.so
> libebl_bpf-0.177.so      libebl_ppc.so            libebl_tilegx-0.177.so
> libebl_bpf.so            libebl_ppc64-0.177.so    libebl_tilegx.so
> libebl_csky-0.177.so     libebl_ppc64.so          libebl_x86_64-0.177.so
> libebl_csky.so           libebl_riscv-0.177.so    libebl_x86_64.so
> libebl_i386-0.177.so     libebl_riscv.so

I don't see these shared libraries when building elfutils with the
current Buildroot. Could you give more details about your Buildroot
version and configuration ?

> Is there a way to get it built just for the target architecture - in
> our case PowerPC (ppc)? I have added minicoredumper to the
> customization packages, and it requires elfutils....

I think these files are all probably built for your target
architecture, but have support for inspecting ELF files from other CPU
architectures? For example, even if you're on PPC system, you may want
to inspect x86 or ARM binaries. But I'm really just guessing here since
I don't have those shared libraries installed when I build elfutils.

And I see in the libebl/Makefile.am that it's a noinst library, so
libebl should not even be installed. That being said, I admit I'm
building with the latest Buildroot, which has elfutils 0.181 and you're
using elfutils 0.177.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
