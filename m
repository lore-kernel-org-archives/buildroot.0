From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 9 Jun 2017 10:18:48 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <878tl29m64.fsf@dell.be.48ers.dk>
References: <20170605073740.855-1-francois.perrad@gadz.org>
 <87y3t2a64r.fsf@dell.be.48ers.dk>
 <CAB0FRsv4WF1BE6LNagQZhLZ7DxGH_sovyJutrKrufNhvWcFrCg@mail.gmail.com>
 <878tl29m64.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRstAGwcUOowSvH9xmQLX=j5no7aPO6KiCLXVS7U3W_C=yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-08 23:58 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:
>
>  > 2017-06-08 16:47 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>  >> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>  >>
>  >> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  >>
>  >> Out of interest, what distribution doesn't have bash in /bin?
>  >> #!/bin/bash is a quite common shebang, and we use it in several places
>  >> outside support/scripts.
>  >>
>  >>
>  > I found this issue with NixOS (http://nixos.org/) where:
>  > $ ls /bin
>  > sh
>  > $ ls /usr/bin
>  > env
>  > $ which bash
>  > /run/current-system/sw/bin/bash
>  > $ which which
>  > /run/current-system/sw/bin/which
>
>  > so, #!/bin/sh is the only shebang which doesn't require to start with
>  > #!/usr/bin/env
>
> And /bin/sh is a symlink to /run/current-system/sw/bin/bash? Otherwise I
> don't understand how the logic in Makefile and
> support/dependencies/dependencies.sh could work?
>

/bin/sh is a symlink to
/nix/store/bxr5lwdhhgfh1p28mh3w7kyc0spk7niz-bash-4.4-p5/bin/sh
/run/current-system/sw/bin/bash is a symlink to
/nix/store/bxr5lwdhhgfh1p28mh3w7kyc0spk7niz-bash-4.4-p5/bin/bash


>
> What about packages? Are there no package build systems that hardcodes
> /bin/bash?
>

No.
Packages needed by Buildroot could be declared like this :
https://github.com/fperrad/misc/blob/master/nix/buildroot.nix

Fran?ois


>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170609/65605813/attachment.html>
