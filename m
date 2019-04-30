From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Apr 2019 21:56:23 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <20190430194033.GE27252@scaer>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
 <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
 <20190430194033.GE27252@scaer>
Message-ID: <20190430195623.GF27252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-30 21:40 +0200, Yann E. MORIN spake thusly:
> On 2019-04-30 13:20 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> > >   > > +? elif [ $device_name == "xtensa-lx60" ] || [ $device_name ==
> > >   "xtensa-lx60-nommu" ]; then
> > >   > > +? ? echo "xtensa cannot be tested"
> > >   >? If that is the case, why do we even have these qemu defconfigs? Max?
> > >  Tested both configurations just now, with the current buildroot tip
> > >  (2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
> > >  with QEMU command line from the readme.
> >  Is this with the system-intalled qemu? I guess so, because Buildroot still has
> > 3.1.0... That might be the issue :-)
> 
> I've started a test-build ehre, to check.

And it does not build because:

      UIMAGE  arch/xtensa/boot/uImage
    "mkimage" command not found - U-Boot images will not be built
    arch/xtensa/boot/Makefile:51: recipe for target 'arch/xtensa/boot/uImage' failed

So, it needs to have host-uboot-tools.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
