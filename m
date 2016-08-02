From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Tue, 2 Aug 2016 07:24:24 +0100
Subject: [Buildroot] How to login automatically without typing root in
	buildroot x86 64 QEMU?
Message-ID: <CAFXrp_e2sDqZGZKM_B2rgBuh_1oXWhJgW6wgMzfBWsGQ_hnV7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I do:

    git clone git://git.buildroot.net/buildroot
    cd buildroot
    git checkout 2016.05
    make qemu_x86_defconfig
    make BR2_JLEVEL=2
    qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive
file=output/images/rootfs.ext2,if=virtio,format=raw -append root=/dev/vda
-net nic,model=virtio -net user

I have to type `root` into QEMU before I can use the shell.

How to configure buildroot to skip that and login directly?

Tested on Ubuntu 16.04.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160802/a5e4006d/attachment.html>
