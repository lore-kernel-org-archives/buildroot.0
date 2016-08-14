From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sun, 14 Aug 2016 15:52:53 +0100
Subject: [Buildroot] How to run ltris on QEMU 64? Fails with:
 "set_video_mode: cannot allocate screen: Couldn't set console screen info"
Message-ID: <CAFXrp_e6LiWL7+MNFj9ETc04ONkV4QSwTyRR0TwyL2vEndgUpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have run:

    git checkout 2016.05
    make qemu_x86_64_defconfig
    make menuconfig
    # Enable: ltris, C++ and wchar. BR2_PACKAGE_LTRIS=y appears on
`.config`.
    make
    qemu-system-x86_64 \
        -enable-kvm \
        -M pc \
        -kernel output/images/bzImage \
        -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
        -append root=/dev/vda \
        -net nic,model=virtio \
        -net user

And from inside QEMU:

     ltris

Fails with:

    set_video_mode: cannot allocate screen: Coundn't set console screen info
    Segmentation fault

I suppose that this is maybe because I'm not running X, but startx isn't an
available command.

Tested on Ubuntu 16.04.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160814/da899c9e/attachment.html>
