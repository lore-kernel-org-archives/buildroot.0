From: Ranran <ranshalit@gmail.com>
Date: Sat, 20 Oct 2018 19:03:12 +0300
Subject: [Buildroot] Boot without busybox
In-Reply-To: <c98ccac7-5680-6cee-fd6e-ef105c2fd377@mind.be>
References: <CAJ2oMhJbBLv7eiJo=LNnmHSJms1SQZknD7_dTHM8UfE8xPoTxA@mail.gmail.com>
 <c98ccac7-5680-6cee-fd6e-ef105c2fd377@mind.be>
Message-ID: <CAJ2oMhK0wTWgqnC=kQ7yf69_vafF3X1mi-B=n4k4NiLKbgT=aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 20, 2018 at 3:29 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/10/2018 08:04, Ranran wrote:
> > Hello,
> >
> > As part of Linux hardening we want to remove busybox from filesystem.
>
>  How does replacing busybox with bloatware harden your system?
>
I actually thought of removing it totally (no replacement), but if
this is not possible on buildroot we might consider other alternatives
(such as minimizing its capability).

> > But I am not sure if system can boot without it.
> > I am quite sure that there are init files that depends on busybox.
> >
> > Is it possible to boot without busybox or does it require a custom init ?
>
>  We have support for 3 different init systems: busybox, sysvinit, and systemd.
> There is also the "none" option, but then you're on your own for finding the
> appropriate init system. You can use it for using s6 as init system, for example.
>
>  If you remove Busybox entirely, you will also have to manually select all the
> other packages needed to get a minimal Unix system, like GNU coreutils, some
> shell, util-linux, ...
>

Isn't removing buildroot just a matter of selections in menuconfig ?
I mean, must I know which package should be replcaed with others or is
it that buildroot menu shall automatically choose for me the correct
selection when I remove busybox ?

Thanks,
ranran

>  Regards,
>  Arnout
>
> >
> > Thank you,
> > ranran
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
