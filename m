From: Guo Ren <guoren@kernel.org>
Date: Mon, 3 Jun 2019 14:47:09 +0800
Subject: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add
 C-SKY Qemu run Documentation
In-Reply-To: <20190602134620.77a41eb3@windsurf>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
 <1559468510-22085-2-git-send-email-guoren@kernel.org>
 <20190602134620.77a41eb3@windsurf>
Message-ID: <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Jun 2, 2019 at 7:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> On Sun,  2 Jun 2019 17:41:50 +0800
> guoren at kernel.org wrote:
>
> > + wget https://gitlab.com/c-sky/buildroot/-/jobs/197192514/artifacts/raw/output/images/csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz;
> > + mkdir tools;
> > + tar -Jxf csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz -C tools;
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -kernel output/images/vmlinux -nographic;
> > +
> > +For ck810/ck807:
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -kernel output/images/vmlinux -nographic;
> > +
> > +For ck610:
> > + LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv1 -M virt -kernel output/images/vmlinux -nographic;
>
> Instead of this, I think it makes sense to add support for C-SKY in the
> host-qemu package. It should be fairly easy to do, and then you can
> enable building host-qemu as part of the c-sky qemu defconfigs.
Qemu upstream is under way and I want to add host-qemu for C-SKY after that.

See here:
https://gitlab.com/c-sky/buildroot/tree/master/package/csky-qemu
I don't use package/qemu to build csky qemu and I add another
csky-qemu package for simple.

Best Regards
 Guo Ren
