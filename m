From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:23:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec-tools: fix build with gcc
 10
In-Reply-To: <20210710092854.1164329-1-fontaine.fabrice@gmail.com>
References: <20210710092854.1164329-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716232306.1da33771@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 10 Jul 2021 11:28:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build is broken with gcc 10 since bump to version 2.0.22 in commit
> cadb8f2f317bf37c13aea98ac1c81bf8566aad92:
> 
> /tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: kexec/arch/ppc/kexec-elf-ppc.o:(.sbss+0x0): multiple definition of `ramdisk'; kexec/arch/ppc/kexec-ppc.o:(.sbss+0x0): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22932529f925630ec6db3c6a4eaebbda68b3fc16
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...move-duplicate-definition-of-ramdisk.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
