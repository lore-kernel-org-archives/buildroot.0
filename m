From: Guy Ka <guyarkam@gmail.com>
Date: Fri, 22 Jan 2021 16:23:58 -0500
Subject: [Buildroot] RV32 "initial RAM FS linked into the target"
Message-ID: <CAEYXRPnWD3VZTwuMNnk6zk76xnhEy8imJEe-iXgpcT3B8Hkivw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,,
I am trying to build an RV32 system with the Root FS linked into the kernel
I started with make qemu_riscv32_virt_defconfig
and subsequently
make  menuconfig
In the Filesystem section I selected the option "Initial RAM filesystem
linked into Linux Kernel"
( I also selected OpenSBI and included Linux as OpenSbi payload)
I saved my configuration and launched the build process.

Everything completed without error. I can boot the kernel with spike/Qemu
while providing the rootfs as the --initrd parameter.
My assumption was that the rootfs would be included in the Linux and I
would not need to pass it as an initrd parameter
However, if I omit the rootfs and only provide the kernel/Opensbi, I get a
kernel panic message "Unable to mount root fs on unknown-block (0,0)"
Is my assumption correct? If yes is there any specific parameter that I
should pass to the Kernel for this to work?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210122/56005563/attachment.html>
