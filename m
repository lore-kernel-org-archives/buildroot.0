From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 30 Apr 2019 13:09:01 -0700
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <20190430195623.GF27252@scaer>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
 <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be> <20190430194033.GE27252@scaer>
 <20190430195623.GF27252@scaer>
Message-ID: <CAMo8BfK0guBr15W2zAhQPSZo8uE8gBmjpRNfLZYfLGTYRqnVRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 30, 2019 at 12:56 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> And it does not build because:
>
>       UIMAGE  arch/xtensa/boot/uImage
>     "mkimage" command not found - U-Boot images will not be built
>     arch/xtensa/boot/Makefile:51: recipe for target 'arch/xtensa/boot/uImage' failed

Ah, yes, I have mkimage somewhere in my PATH.

> So, it needs to have host-uboot-tools.

But I don't think this is the right thing. What I see is that despite
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is set to Image,
to only build self-contained ELF kernel, the initial kernel build is
run as 'make ... all', and only the build with the cpio is run as
'make ... Image'. Why?

-- 
Thanks.
-- Max
