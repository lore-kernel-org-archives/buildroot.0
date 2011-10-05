From: Satoshi Matsushita <matusita@k-micro.com>
Date: Wed, 05 Oct 2011 10:16:17 +0900
Subject: [Buildroot] modprobe doesn't work with MIPS codesourcery
Message-ID: <4E8BAFE1.1030503@k-micro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to use buildroot-2011.05 with Linux2.6.28
on the MIPS CPU system.

As for the toolchain, I planed to use "CodeSourcery
MIPS 2011.03". So I changed options as follows from
default settings:
Target Architecture (mipsel)
Target Architecture Variant (mips 32r2)
Toolchain type (External toolchain)
Toolchain (CodeSourcery MIPS 2011.03)
Filesystem images (jffs2 root filesystem)

As the result, the build process itself has been
finished successfully. But when the Linux boot with
this image, the following messages was displayed and
boot process was failed.

------------------------------------------------------
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing prom memory: 956k freed
Freeing unused kernel memory: 136k freed
request_module: runaway loop modprobe binfmt-464c
request_module: runaway loop modprobe binfmt-464c
request_module: runaway loop modprobe binfmt-464c
request_module: runaway loop modprobe binfmt-464c
request_module: runaway loop modprobe binfmt-464c
------------------------------------------------------

If I could have any suggestions to solve this problem,
it would very helpful for me.

BTW, when I used crosstool-ng as toolchain, Linux booted
without problem.

Best Regards,
Satoshi Matsushita
