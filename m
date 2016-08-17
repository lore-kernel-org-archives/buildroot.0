From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 17 Aug 2016 23:27:33 +0200
Subject: [Buildroot] How to run ltris on QEMU 64? Fails with:
 "set_video_mode: cannot allocate screen: Couldn't set console screen info"
In-Reply-To: <CAFXrp_e6LiWL7+MNFj9ETc04ONkV4QSwTyRR0TwyL2vEndgUpg@mail.gmail.com>
References: <CAFXrp_e6LiWL7+MNFj9ETc04ONkV4QSwTyRR0TwyL2vEndgUpg@mail.gmail.com>
Message-ID: <1eaa9aba-fd4d-5969-8d97-67b995d2e097@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ciro,

On 14/08/2016 16:52, Ciro Santilli wrote:
> I have run:
>
>     git checkout 2016.05
>     make qemu_x86_64_defconfig
>     make menuconfig
>     # Enable: ltris, C++ and wchar. BR2_PACKAGE_LTRIS=y appears on
> `.config`.
>     make
>     qemu-system-x86_64 \
>         -enable-kvm \
>         -M pc \
>         -kernel output/images/bzImage \
>         -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
>         -append root=/dev/vda \
>         -net nic,model=virtio \
>         -net user
>     
> And from inside QEMU:
>
>      ltris
>
> Fails with:
>
>     set_video_mode: cannot allocate screen: Coundn't set console
> screen info
>     Segmentation fault
>
> I suppose that this is maybe because I'm not running X, but startx
> isn't an available command.

ltris uses SDL which doesn't need X to display graphics. By default it
uses framebuffer interface.
To check if framebuffer is working, you can use fb-test-app package.

For me, Ltris is working fine on my ARM platforms and on qemu
arm-versatile target.

Best regards,
Julien
