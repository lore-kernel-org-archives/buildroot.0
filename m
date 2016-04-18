From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:18:54 +0200
Subject: [Buildroot] Run qemu with /dev/sda ?
In-Reply-To: <CAJ2oMhJibkfHEy4P54dm4HZ_frWv4rCXUNdxMezU38edF9v7vg@mail.gmail.com>
References: <CAJ2oMhJibkfHEy4P54dm4HZ_frWv4rCXUNdxMezU38edF9v7vg@mail.gmail.com>
Message-ID: <20160418211854.004ba053@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 18:32:22 +0300, Ran Shalit wrote:

> I probably have some misunderstanding with running qemu with buildroot output.
> I see in the following link:
> http://www.osadl.org/Use-BuildRoot-to-create-a-Linux-image-fo.buildroot-qemu.0.html
> that qemu should be run as following:

Please read board/qemu/*/readme.txt to learn how to start Qemu to use
the Qemu Buildroot defconfigs.

> qemu-system-i386 -kernel $LOCATION/$KERNEL \
> -hda $LOCATION/$DISK \
> -boot c \
> -m 128 \
> -append "root=/dev/sda rw" \
> -localtime \
> -no-reboot \
> -name rtlinux \
> -net nic -net user \
> -redir tcp:2222::22 \
> -redir tcp:3333::3333
> 
> But how can it be that qemu use the same disk as the host ?

It doesn't use the same disk as the host. The /dev/sda disk that the
system running inside Qemu sees is emulated. The contents of the
emulated /dev/sda are the ones of the file passed as argument to the
-hda option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
