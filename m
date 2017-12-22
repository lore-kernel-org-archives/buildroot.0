From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 22 Dec 2017 17:10:49 -0500
Subject: [Buildroot] How to force mesa3d to use llvmpipe?
In-Reply-To: <7829580e-0ae9-e063-5124-c4e2cde424da@gmail.com>
References: <1513976018164-0.post@n4.nabble.com>
 <1513977748342-0.post@n4.nabble.com>
 <7829580e-0ae9-e063-5124-c4e2cde424da@gmail.com>
Message-ID: <CALoSW666QZZCi=XMkir+UP=8N+dG6hbZQ0ZiFLM=nGKRxQRB-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 22, 2017 at 4:52 PM, Romain Naour <romain.naour@gmail.com>
wrote:

> Hi Nimai,
>
> Le 22/12/2017 ? 22:22, nimaim a ?crit :
> > Looks like BR may still not have llvmpipe support. Curious if this patch
> got
> > anywhere?
> >  http://lists.busybox.net/pipermail/buildroot/2017-July/195823.html
>
> This patch series is still present in the patchwork [1] but this work need
> to be
> updated with the latest llvm/clang release (5.0.1).
>
> However, you can still test this series and you should be able to use
> llvmpipe.
>

Thanks! Sounds good, I will try to merge Adrian's llvm package and mesa3d
patches locally and rebuild mesa and see if I can get Qt to work with the
llvm OpenGL driver. By any chance, do you know if llvm v4.0.0 will work
with mesa 17.2.x or 17.3.x or will it have to be bumped to v5? Also, not
sure how familiar with Qt you are, but do you know if Qt will require
special hooks to be able to use this with xcb?

>
> I have not announced it yet on the mailing list that there will be a
> student at
> Smile working on this subject. He will present his internship topic during
> the
> next Buildroot meeting [2].


> Enabling llvmpipe support in mesa is not really difficult but packaging
> llvm/clang is a more difficult and time consuming task.
>

Great! Agreed, something that definitely needs some work. Glad to see
someone will be working it.

>
> You're welcome to work on this series and give some feedback.
>

I'm merely a small time dev and still learning (as is probably evident by
all my questions :)), especially with embedded graphics, but will be happy
to test and contribute any way I can. Hopefully I can get this in a decent
enough state. Quite surprised that this hasn't made it to BR yet.

>
> Best regards,
> Romain
>
> [1] http://patchwork.ozlabs.org/bundle/kubu/llvm-clang


Link doesn't seem to be working but I guess you are talking about the
patches here?

https://patchwork.ozlabs.org/patch/777949/
https://patchwork.ozlabs.org/patch/777947/


>
> [2] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018#Meeting_agenda
>
> >
> >
> >
> > --
> > Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171222/80031742/attachment.html>
