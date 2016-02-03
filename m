From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 15:45:00 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160129005530.GA4314@tungsten.ozlabs.ibm.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
 <20160127093256.77169e7d@free-electrons.com>
 <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
 <20160128091742.45cad80d@free-electrons.com>
 <20160128102044.53877287@free-electrons.com>
 <20160129005530.GA4314@tungsten.ozlabs.ibm.com>
Message-ID: <20160203154500.4ea488e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Fri, 29 Jan 2016 11:55:30 +1100, Sam Bobroff wrote:

> I've managed to replicate your problem!
> 
> The key to reproducing it seems to be to optimise for size: I compared your
> compile line to mine, and the only difference was -Os vs. -O3 :-)
> 
> So try optimizing for speed instead: this obviously works around it for me ;-)
> 
> And yes, it's the lqarx instruction causing the problem: it's first argument must
> be even but it's 7, so this looks like a bug in gcc.
> 
> I did some searching around and it looks like this has been a problem in the
> past and it's been fixed, but it looks like optimizing for size causes it to
> re-appear. There's a bit of related info here:
> 
> http://comments.gmane.org/gmane.comp.gcc.bugs/388637

Thanks for looking into the problem.

> Would you like to raise it on https://gcc.gnu.org/bugzilla/ ?
> Alternativly, it's no problem for me handle it if you like (I work on PowerKVM
> :-).

Since you actually work on PowerPC, it would be good if you could
report the problem yourself.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
