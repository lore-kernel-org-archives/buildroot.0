From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 12:27:59 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160819222238.GZ22524@waldemar-brodkorb.de>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
 <20160819222238.GZ22524@waldemar-brodkorb.de>
Message-ID: <20160820122759.68b6e8b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 00:22:38 +0200, Waldemar Brodkorb wrote:

> > eelf32bfin.c:1790:1: error: unable to find a register to spill in class 'CCREGS'
> > 
> > Waldemar, this is a gcc bug.  
> 
> Seems simlar to the ffmpeg issue. Some kind of optimization is
> broken for Blackfin in gcc 6.1.x.

OK. Can you cook a patch for this one as well?

Ideally, we should fix the gcc problem, but I clearly don't have enough
knowledge about gcc internals to fix this one I believe. Though it
would be a good opportunity to learn about such internals.

> > >         m68k |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1014a22cfdd3b18f349dde33f14acca4131dbd5b/  
> > 
> > Waldemar, no support of libffi for 5208. What's the plan for that?  
> 
> I have a local patch for this. I will sent it out later.

Applied, thanks.

> > >         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/20b1586757450d6aad8583ad7a787a7ca11acef1/  
> > 
> > Waldemar, this is still occuring :)  
> 
> I am pretty sure it will disappear, when we switched to simple FLAT
> as it just seems to be a newer error message for the same problem we
> are seeing with -msep-data.

OK. I guess you'll send a patch series about this soonish?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
