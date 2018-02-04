From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 13:38:29 +0100
Subject: [Buildroot] [PATCH] configs/qemu_sparc_ss10: add Linux kernel
 patch to fix build with gcc 7.x
In-Reply-To: <20170813213245.27199-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 13 Aug 2017 23:32:45 +0200")
References: <20170813213245.27199-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87shahx73u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a Linux kernel patch that fixes the build of the
 > qemu_sparc_ss10 defconfig when used with gcc 7.x:

 > arch/sparc/kernel/pcic.c: In function ?pcibios_fixup_bus?:
 > arch/sparc/kernel/pcic.c:647:8: error: ?cmd? may be used uninitialized in this function [-Werror=maybe-uninitialized]
 >     cmd |= PCI_COMMAND_IO;
 >         ^~

 > The patch has been submitted upstream.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > I don't know if we want to merge this patch in Buildroot. Indeed:

 >  - The defconfig doesn't use gcc 7.x currently, so the problem doesn't
 >    exist with the defconfig as-is.

 >  - This problem exists for essentially all SPARC configurations that
 >    have PCI support enabled.

 > The reason why I encountered this problem is because I'm testing
 > bleeding edge toolchains (based on gcc 7.x) with our Qemu defconfigs.

I see this is mainline since 4.13, so I've marked this as rejected in
patchwork. When we move to gcc7.x we can just bump the kernel version.

-- 
Bye, Peter Korsgaard
