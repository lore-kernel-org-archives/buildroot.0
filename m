From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 25 Feb 2020 13:39:22 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/frr: new package
In-Reply-To: <CAMw6YJJH8utQ8kSf7G2f55N91qX66vpFwJytn1gN5fd1G=Y5wA@mail.gmail.com>
References: <20200225025850.17209-1-vadim4j@gmail.com>
 <20200225025850.17209-3-vadim4j@gmail.com>
 <CAEyMn7Z7LiHmSxE+7VYdWRgeyPwQ1F-s-MxKjMW_OjXhK1_rtA@mail.gmail.com>
 <CAMw6YJJH8utQ8kSf7G2f55N91qX66vpFwJytn1gN5fd1G=Y5wA@mail.gmail.com>
Message-ID: <CAEyMn7YC8Wtk+ayQK_BR35W3tHz8jug-QKqk7gAXFgpsJRMA=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim and all,

> >
> > I see that thei install step installs examples in a directory where (I
> > think) it never should install stuff! It is the targetno directory.
> >
> >  /usr/bin/install -c -m 644 zebra/zebra.conf.sample
> > bgpd/bgpd.conf.sample bgpd/bgpd.conf.sample2 bgpd/bgpd.conf.vnc.sample
> > ripd/ripd.conf.sample ripngd/ripngd.conf.sample
> > ospfd/ospfd.conf.sample ospf6d/ospf6d.conf.sample
> > isisd/isisd.conf.sample isisd/fabricd.conf.sample
> > ldpd/ldpd.conf.sample babeld/babeld.conf.sample
> > eigrpd/eigrpd.conf.sample pimd/pimd.conf.sample pbrd/pbrd.conf.sample
> > staticd/staticd.conf.sample bfdd/bfdd.conf.sample
> > vtysh/vtysh.conf.sample
> > '/home/hthiery/sources/mainline/buildroot/output/targetno'
> >
> >
> > I cannot see how it is possible to properly disable the install of
> > examples. I see that you already have set the option
> > --disable-exampledir. But this seems not to be enought, or it is
> > broken.
>
> Wow! Nice catch, I did not realize this, so there are like at least 2 options ?
> 1) remove it in hook
> 2) patch the frr build scripts (which looks like more safer?)

I think reporting that upstream and patching would be the best solution.

--
Heiko
