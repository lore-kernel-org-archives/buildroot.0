From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 10:55:21 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229095242.GB3176@scaer>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
 <20171229104219.71c908e6@windsurf.lan>
 <20171229095242.GB3176@scaer>
Message-ID: <20171229105521.78a4e35a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 10:52:42 +0100, Yann E. MORIN wrote:

> > > Rather than duplicate the optional dependency on Busybox in all the
> > > packages (and as Thomas demonstrated, there are quite a few of them).  
> > 
> > Seems like a good idea to me.  
> 
> For that, we'll need the three-patch series I submitted to Busybox:
>     http://lists.busybox.net/pipermail/busybox/2017-December/086039.html

Absolutely. Hopefully, upstream will give some feedback soon.

> > I don't really like this approach, I find it too brutal.  
> 
> Sorry, I was not advocating for this solution. What I meant was that, to
> simplify things even further we could do that. But I don't think we need
> that.

OK, then we agree :)

> > Since we have the testing logic to validate that no package overwrites
> > files from another package, I think the approach of having explicit
> > dependencies in Busybox is good enough.  
> 
> Once we turn the warniong into a hard error, yes. ;-)

In fact, I'd like to turn this into a hard error fairly soon. Or
perhaps I could do some research in the autobuilder logs to identify
the issues (other than Busybox) so that we try to fix them ahead of
time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
