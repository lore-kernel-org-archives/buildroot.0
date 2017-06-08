From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 8 Jun 2017 23:07:23 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <87y3t2a64r.fsf@dell.be.48ers.dk>
References: <20170605073740.855-1-francois.perrad@gadz.org>
 <87y3t2a64r.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsv4WF1BE6LNagQZhLZ7DxGH_sovyJutrKrufNhvWcFrCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-06-08 16:47 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Out of interest, what distribution doesn't have bash in /bin?
> #!/bin/bash is a quite common shebang, and we use it in several places
> outside support/scripts.
>
>
I found this issue with NixOS (http://nixos.org/) where:
$ ls /bin
sh
$ ls /usr/bin
env
$ which bash
/run/current-system/sw/bin/bash
$ which which
/run/current-system/sw/bin/which

so, #!/bin/sh is the only shebang which doesn't require to start with
#!/usr/bin/env

Fran?ois


> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170608/e352d69e/attachment.html>
