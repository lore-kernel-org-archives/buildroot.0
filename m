From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 07 Mar 2008 09:24:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
In-Reply-To: <20080307000104.GA28350@cloud.net.au>
References: <20080306175611.EB4541201CA@busybox.net>
	<20080306234746.GC26530@cloud.net.au>
	<041901c87fe5$b1503080$030514ac@atmel.com>
	<20080307000104.GA28350@cloud.net.au>
Message-ID: <1204878294.9461.88.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2008-03-07 at 11:01 +1100, Hamish Moffatt wrote:
> On Fri, Mar 07, 2008 at 12:56:09AM +0100, Ulf Samuelsson wrote:
> > ----- Original Message ----- 
> > From: "Hamish Moffatt" <hamish@cloud.net.au>
> > To: <buildroot@uclibc.org>
> > Sent: Friday, March 07, 2008 12:47 AM
> > Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/bzip2
> > 
> > > Why move libbz2 from /lib to /usr/lib?
> > 
> > 
> > I think that this has been the trend for the last year.
> > A lot of packages has had this change.
> 
> I think some sort of policy document would be useful here. If libbz2 is
> in /usr/lib, that means no binaries in /bin or /sbin should use it
> really.
> 

Agreed.

Applications in /bin and /sbin which are dynamic linked must find their
libraries in /lib.

> Is /usr really irrelevant on a buildroot-sized system anyway? Should we
> just put everything in /lib, /bin and /sbin and forget it? (Perhaps even
> bin and sbin should merge.)
> 

No, some embedded systems have multiple flash partitions, and might use
one for /usr stuff and another for / stuff.

And please do not merge /bin and /sbin;

1. you must change a whole lot of Makefiles (make install)
2. some systems actually have multiple users ;)

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
