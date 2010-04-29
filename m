From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Apr 2010 12:07:00 +0200
Subject: [Buildroot] Still can't build working rootfs with
 crosstool-NGtoolchain
In-Reply-To: <hqn0op$14i$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
Message-ID: <20100429120700.45af880e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Apr 2010 14:06:18 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I never do anything with buildroot other than complete ground-up
> builds from scratch.  Despite the documented ways to do partial
> rebuilds, I was never able to reliably do a parial rebuild.  After
> several instances of spending hours or days chasing problems that went
> away after a complete re-build, I simply gave up on doing anything
> other than building from zero.

Yes, building from zero is the only way of being sure of what is
happening. As soon as *any* system-wide change, such as a toolchain
configuration change, is made, then a rebuild from zero is needed.

Partial rebuilds, as documented in the documentation, are possible on a
per-package basis, when you fully understand what you're doing and how
Buildroot uses the stamp files. You can very easily break things, or on
the opposite, get something working that wouldn't work with a build
starting from zero.

When doing work on packages, I do use partial rebuilds a lot, but I
also make sure to do a full rebuild at the end to make sure everything
is in order.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
