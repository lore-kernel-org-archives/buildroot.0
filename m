From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 30 Nov 2015 08:16:52 -0200
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151129233338.261cf080@free-electrons.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
 <20151129092811.0d05dabd@free-electrons.com> <20151129095306.GA3630@free.fr>
 <565B78D8.6070103@mind.be> <20151129233338.261cf080@free-electrons.com>
Message-ID: <CANu7NGvkTDFax5jjdLc8yGigX1pgmhUJrrz3diu0G7PAd-1+uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-11-29 20:33 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 29 Nov 2015 23:14:48 +0100, Arnout Vandecappelle wrote:
>
> > > Adding such a package would be a Buildroot peculiarity, which I would
> > > prefer we avoid.
> >
> >  +1 to that.
> >
> >  Also take into account that we only install it to staging, so there is
> really
> > nothing to gain from installing it conditionally.
> >
> >  The only question is whether to do it in the toolchain virtual package
> (which
> > would be unusual to say the least), or duplicate it in the musl and
> external
> > toolchain packages. I actually think the latter is the way to go.
>
> That's all fine with me. It is a lot better than duplicating
> sys/queue.h everywhere. It is kind of adding a patch on top of musl
> that we would have to keep on our side forever, but since it's just a
> separate header file, there's no maintenance cost, so I think it's fine.
>
> Regarding doing it in the toolchain virtual package or duplicate in
> musl and external toolchain packages, I don't have a strong opinion
> either way, so if Arnout feels like doing the duplication is better
> then so be it. Despite the duplication I also believe it is more
> logical to have it in the musl and external toolchain packages, since
> doing that in the toolchain virtual package would make that package no
> longer purely virtual.
>

Thank you all.

I'll be sending the patch today.

Best regards,


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151130/89066f94/attachment.html>
