From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Apr 2019 22:31:40 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <CAMo8BfJn6TvsnEi1A8JUga8Sx6BPHvfGht7c-45nhjDE-=bnYg@mail.gmail.com>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
 <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
 <20190430194033.GE27252@scaer> <20190430195623.GF27252@scaer>
 <CAMo8BfK0guBr15W2zAhQPSZo8uE8gBmjpRNfLZYfLGTYRqnVRw@mail.gmail.com>
 <CAMo8BfJn6TvsnEi1A8JUga8Sx6BPHvfGht7c-45nhjDE-=bnYg@mail.gmail.com>
Message-ID: <20190430203139.GG27252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2019-04-30 13:23 -0700, Max Filippov spake thusly:
> On Tue, Apr 30, 2019 at 1:09 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > On Tue, Apr 30, 2019 at 12:56 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > And it does not build because:
> > >
> > >       UIMAGE  arch/xtensa/boot/uImage
> > >     "mkimage" command not found - U-Boot images will not be built
> > >     arch/xtensa/boot/Makefile:51: recipe for target 'arch/xtensa/boot/uImage' failed
> >
> > Ah, yes, I have mkimage somewhere in my PATH.
> >
> > > So, it needs to have host-uboot-tools.
> >
> > But I don't think this is the right thing. What I see is that despite
> > BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is set to Image,
> > to only build self-contained ELF kernel, the initial kernel build is
> > run as 'make ... all', and only the build with the cpio is run as
> > 'make ... Image'. Why?
> 
> Ok, I see why: because ffbe46a5295c ("linux: simplify LINUX_BUILD_CMDS").
> It's a regression then.

See also 2a7cf511f4 (linux: split calling "all" and "$(LINUX_TARGET_NAME)"
targets) which is an attempt at fixing the regression in ffbe46a5295c.

Furthermore, there were a few patches adding host uboot tools to a few
defconfigs that needed it, like 7cbf9c63e5 (configs/qemu_ppc_virtex_ml507:
kernel build needs mkimage)

Finally, see also the discussion on that series:
    http://lists.busybox.net/pipermail/buildroot/2019-April/248424.html

We may have missed a few. I'll send a patch adding it to the extensa
defconfigs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
