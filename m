From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 25 Aug 2020 13:55:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <20200825100821.49937320@windsurf.home>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
 <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
 <20200825100821.49937320@windsurf.home>
Message-ID: <CALFsTFUeh=PjLmkpjGQYjS8QQQ38hqcakBA=TXf_Gaxsk8Qo7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Aug 25, 2020 at 11:08 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Asaf,
>
> Thanks for reviewing!
>
> On Tue, 25 Aug 2020 09:41:28 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > > +       bool "python-pycups"
> > > +       depends on BR2_PACKAGE_CUPS
> > Since this package wraps the CUPS API and uses the cups package, you
> > should select BR2_PACKAGE_CUPS instead of depending on it (and add the
> > additional "depends on" sections from cups).
>
> I perhaps wouldn't be so strict on this. When a dependency is
> "obvious", it is quite OK to have a "depends on". In this case, I
> believe the user who wants python-pycups will realize that CUPS is
> needed in the system, so I find a "depends on" dependency to be quite
> OK in this case. Using "depends on" has the advantage that we don't
> have to replicate the "depends on" from BR2_PACKAGE_CUPS.
I completely agree that the advantage of this is not duplicating the
"depends on" sections.
On the other hand:
* Differently from other packages that duplicate the "depends on",
here we show nothing in case BR2_PACKAGE_CUPS isn't selected, so we
should at least add a comment.
* In my opinion, even if the user knows that python-pycups needs cups,
he wouldn't want to select it on his own and expect it to be selected
when choosing python-pycups.
But I agree that in some cases it's not so critical.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Asaf.
