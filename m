From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2019 13:20:47 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
Message-ID: <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jugurtha,

 [Please don't top-post, but reply inline like I do below.]

On 30/04/2019 10:54, Jugurtha BELKALEM wrote:
> Thank you for you comments Arnout, I have corrected the indentation, timeout
> and? function declaration issues.
> 
> However; I think that duplicating the content of readme.txt of each qemu
> architecture would be difficult to maintain (even if it is more convenient to
> use), this is why a project like toolchain builder :
> https://github.com/bootlin/toolchains-builder/blob/master/build.sh is reading
> directly from readme.txt.

 The idea would not be to duplicate it, but to move it. I.e., readme.txt just
says "launch with board/qemu/x86_64/launch.sh", and the actual command is in
that shell script.

 But maybe we should see what other Buildroot maintainers have to say about it.
Thomas, Peter, Yann, Romain?

> Concerning the naming of x86_64 folder in board/qemu, it is the only one that
> uses underscore instead of hyphen. Changing the directory name may cause issues
> with other works as maybe other scripts as relying on this name (especially that
> it exists since a long time ago).

 OK, true. Let's keep that like you have it then.


> I want to thank you also Max for your answer (We need to investigate more).

 If it doesn't work on gitlab-ci, I would just not enable the build of host-qemu
for those (and put some intelligence in the script that it only runs if
host-qemu has been built).


> On Tue, Apr 30, 2019 at 1:38 AM Max Filippov <jcmvbkbc@gmail.com
> <mailto:jcmvbkbc@gmail.com>> wrote:
> 
>     On Mon, Apr 29, 2019 at 3:32 PM Arnout Vandecappelle <arnout@mind.be
>     <mailto:arnout@mind.be>> wrote:
>     > > +? elif [ $device_name == "xtensa-lx60" ] || [ $device_name ==
>     "xtensa-lx60-nommu" ]; then
>     > > +? ? echo "xtensa cannot be tested"
>     >
>     >? If that is the case, why do we even have these qemu defconfigs? Max?
> 
>     Tested both configurations just now, with the current buildroot tip
>     (2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
>     with QEMU command line from the readme.

 Is this with the system-intalled qemu? I guess so, because Buildroot still has
3.1.0... That might be the issue :-)

 Regards,
 Arnout
