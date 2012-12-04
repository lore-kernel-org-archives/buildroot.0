From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Tue, 4 Dec 2012 00:13:14 -0800 (PST)
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
Message-ID: <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





----- Original Message -----
From: Bryan Hundven <bryanhundven@gmail.com>
To: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Cc: "buildroot at busybox.net" <buildroot@busybox.net>
Sent: Tuesday, December 4, 2012 5:33 AM
Subject: Re: [Buildroot] elfutils and the perf userspace tool

On Mon, Dec 3, 2012 at 2:20 PM, Bogdan Radulescu
<bogdan_radulescu99@yahoo.com> wrote:
>
>
> Hello everybody,
>
> I am using buildroot for generating a distro for ARM. I am able to add additional packages to buildroot or to use arm-linux-gcc directly to compile simple C programs.
>
> Still I haven't yet understood how to cross compile the perf userspace tool and I think it would be a very nice addition to buildroot.
>
> The perf tool requires elfutils and the kernel sources it comes with.
>
> My first problem is that elfutils will not successfully compile, as you can see here:
> http://pastie.org/pastes/5474687/text
>
> My elfutils.mk file looks like this http://pastie.org/pastes/5474697/text
>
> Please tell me how do I move further from this.
>
> Thanks,
> Bogdan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I forgot to cc buildroot at ... eh.

Original response:

I think you need the argp-standalone, as I don't think uclibc provides libargp.

-Bryan



Hi Bryan,

As you can see in the elfutils.mk file I already added argp-standalone as a dependency. It compiles OK.
I am also linking against it, still something goes wrong at some point.

Bogdan
