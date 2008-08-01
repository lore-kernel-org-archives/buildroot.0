From: Brian Beattie <beattie@beattie-home.net>
Date: Fri, 01 Aug 2008 05:47:37 -0700
Subject: [Buildroot] my /etc/init.d/rcS won't run
In-Reply-To: <4892BA2F.60606@cetrtapot.si>
References: <oVJvhsJM.1217543786.9718410.beattie@localhost>
	<4892BA2F.60606@cetrtapot.si>
Message-ID: <1217594857.6188.11.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2008-08-01 at 09:24 +0200, Hinko Kocevar wrote:
> Brian Beattie wrote:
> > I'm building a generic powerpc buildroot and it's all working as far as
> > I can tell, except the /etc/init.d/rcS will not run.  The line
> > "null::sysinit:/etc/init.d/rcS" is in /etc/inittab (I'm using
> > target/generic/target_skeleton/...).  Everything else in inittab seems
> > to be working and when I take the entries that mount /proc and all out
> > /proc does not get mounted.  When I run /etc/rcS it works fine.  The
> > permissions look OK.  I even put "echo $0>>/tag" as the first
> > executable line in the file, but rcS just does not want to run.
> > 
> > I'm baffeled, has anybody else run into this?
> 
> Is the /etc on the same partition as /bin, /sbin?
> 
> Can you post the error displayed? Also you might want to use this shabang
> 
> #!/bin/sh -x
> 
> in the /etc/init.d/rcS to see some debugging..

No errors, shell scripts would not run.

What I found was that including bash, caused /bin/sh to point to bash
and for dome reason bash does not want to run that early.  Currently
I've dropped bash.

> 
> HTH,
> Hinko
> 
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
