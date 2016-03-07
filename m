From: Martin Bark <martin@barkynet.com>
Date: Mon, 7 Mar 2016 13:02:48 +0000
Subject: [Buildroot] node.js ENOTFOUND error when using uclibc
In-Reply-To: <trinity-42794f72-6f90-430b-8cdf-048645cbdab2-1457338189594@3capp-gmx-bs39>
References: <trinity-42794f72-6f90-430b-8cdf-048645cbdab2-1457338189594@3capp-gmx-bs39>
Message-ID: <CAFGQKxcn_nCR+jGABopOAHMt0-rhAF=g3ZvaxtFaE-CzAQo1Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael,

I can reproduce your issue using the qemu_x86_64_defconfig.  As you
say this looks like a bug in uclibc or a difference between uclibc and
glibc.

Can you please raise this in bugzilla
(https://bugs.buildroot.org/buglist.cgi?product=buildroot) and add as
much detail as you can.  If possible can you try to narrow down the
issue, perhaps by testing getaddrinfo with hints.ai_flags sets to
AI_V4MAPPED for uclibc and glibc.

Thanks

Martin

On 7 March 2016 at 08:09, Michael Toldo <Michael_Toldo@gmx.net> wrote:
> Hi everybody,
>
> I get the error described on https://github.com/nodejs/node/issues/5436 when
> using bildroot with uclibc.
>
> I also managed to compile buildroot with glibc and then the problem is gone.
> Is there a way to fix the DNS "bug" in uclibc?
>
> Thanks and regards,
> Michael
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
