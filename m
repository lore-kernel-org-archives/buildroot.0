From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 30 Apr 2019 10:54:07 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
Message-ID: <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for you comments Arnout, I have corrected the indentation,
timeout and  function declaration issues.

However; I think that duplicating the content of readme.txt of each qemu
architecture would be difficult to maintain (even if it is more convenient
to use), this is why a project like toolchain builder :
https://github.com/bootlin/toolchains-builder/blob/master/build.sh is
reading directly from readme.txt.
Concerning the naming of x86_64 folder in board/qemu, it is the only one
that uses underscore instead of hyphen. Changing the directory name may
cause issues with other works as maybe other scripts as relying on this
name (especially that it exists since a long time ago).

I want to thank you also Max for your answer (We need to investigate more).

Regards.

On Tue, Apr 30, 2019 at 1:38 AM Max Filippov <jcmvbkbc@gmail.com> wrote:

> On Mon, Apr 29, 2019 at 3:32 PM Arnout Vandecappelle <arnout@mind.be>
> wrote:
> > > +  elif [ $device_name == "xtensa-lx60" ] || [ $device_name ==
> "xtensa-lx60-nommu" ]; then
> > > +    echo "xtensa cannot be tested"
> >
> >  If that is the case, why do we even have these qemu defconfigs? Max?
>
> Tested both configurations just now, with the current buildroot tip
> (2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
> with QEMU command line from the readme.
> Curious as well.
>
> --
> Thanks.
> -- Max
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190430/cf1acc4c/attachment.html>
