From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Apr 2019 21:40:33 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
 <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
Message-ID: <20190430194033.GE27252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-30 13:20 +0200, Arnout Vandecappelle spake thusly:
> On 30/04/2019 10:54, Jugurtha BELKALEM wrote:
> > Thank you for you comments Arnout, I have corrected the indentation, timeout
> > and? function declaration issues.
> > 
> > However; I think that duplicating the content of readme.txt of each qemu
> > architecture would be difficult to maintain (even if it is more convenient to
> > use), this is why a project like toolchain builder :
> > https://github.com/bootlin/toolchains-builder/blob/master/build.sh is reading
> > directly from readme.txt.
> 
>  The idea would not be to duplicate it, but to move it. I.e., readme.txt just
> says "launch with board/qemu/x86_64/launch.sh", and the actual command is in
> that shell script.
> 
>  But maybe we should see what other Buildroot maintainers have to say about it.
> Thomas, Peter, Yann, Romain?

Ideally, I'd go without the readme.txt altogether, or if we want to keep
"backward compatibility", we'd make it a symlink to launch.sh.

Snf then, launch.sh would be an actual shell script that also contains
the readme (possibly as -h).

> >     > > +? elif [ $device_name == "xtensa-lx60" ] || [ $device_name ==
> >     "xtensa-lx60-nommu" ]; then
> >     > > +? ? echo "xtensa cannot be tested"
> >     >? If that is the case, why do we even have these qemu defconfigs? Max?
> >     Tested both configurations just now, with the current buildroot tip
> >     (2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
> >     with QEMU command line from the readme.
>  Is this with the system-intalled qemu? I guess so, because Buildroot still has
> 3.1.0... That might be the issue :-)

I've started a test-build ehre, to check.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
