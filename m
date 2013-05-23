From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 14:53:54 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <519E0EEC.6070402@carallon.com>
References: <20130523131251.2ffc509f@skate>
	<519E0EEC.6070402@carallon.com>
Message-ID: <20130523145354.40106277@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Thu, 23 May 2013 13:43:24 +0100, Will Wagner wrote:

> > Do you see solutions to this?
> 
> Thomas, I might be missing something but it seems like all the needed 
> dependencies are host dependencies. Can we not make all host 
> dependencies be on the patch step and all others on the configure step. 
> I think that would work for rtai wouldn't it?

Wow, thanks for taking the time to look into the problem, and enter the
discussion!

It seems like what you're proposing would work. It is not worst than the
solution of filtering out linux on one side, and including linux on the
other side that I was proposing, but I still don't find this very clean.

While it solves the problem, the solution seems completely disconnected
from it. In a few years: "Why the heck do we have host dependencies
before patch, and other dependencies before configure, instead of
having all of them together before patch? Ah, yes, because there is
this crazy specific need for RTAI".

So certainly, what you're proposing solves the problem, it just doesn't
really feel like a nice and clean solution. I know it's a very
subjective opinion I'm giving here, so if others do agree with that
proposal, I'll be fine with it, but I'd be interested in hearing the
ideas and opinions of others to see if we can come up with something
cleaner.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
