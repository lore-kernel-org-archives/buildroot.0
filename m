From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2017 10:23:16 +0100
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
 <20170125142716.55e7d7b3@free-electrons.com>
 <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
Message-ID: <20170130102316.2a02ed3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 18:27:36 +0100, C?dric Marie wrote:

> Le 2017-01-25 02:27, Thomas Petazzoni a ?crit?:
> > But then that's a bit annoying because we would have to explicitly
> > set this option to "YES" on all packages that support the Ninja backend
> > (most likely the majority).
> > 
> > I think it would make more sense to default the other way around, i.e
> > default to YES, and set it to NO on the few packages that do not
> > properly support the Ninja backend.
> > 
> > Or maybe better: do not introduce a per-package option for the moment,
> > have only the global one, see in practice how many packages work /
> > don't work and decide if we need a per-package option, and what default
> > value it should have.  
> 
> OK, but it seems that Romain has already noticed a problem with 
> openpowerlink, so it is likely that this option will be necessary - and 
> hopefully default to YES (supported).

Indeed.

> So, why did I want to introduce this option?
> 
> Because I'm not using Buildroot in one-shot mode. I'm developping in a 
> Buildroot environment. So I often make foo-rebuild my package, and I'm 
> interested in saving time for each rebuild.

OK, understood. But do you have numbers showing that "make foo-rebuild"
is actually faster with Ninja ?

In the tests done by Romain, it's only saving 1-2 seconds on the
total build of a package. So I would suspect that the savings on a
partial build are even smaller.

Even if your CMake packages are private, can you give us some numbers
that show the time benefits of Ninja?

> I know this is not what Buildroot is designed for. (Yet, there are a few 
> things that seem to be present for dev mode (rsync with OVERRIDE_SRCDIR 
> for example), so this is not "pure one-shot" either.)

Well, if we do have features such as OVERRIDE_SRCDIR, it's precisely to
make Buildroot usable/useful also during the development. So if there
are things we can improve in this area, it's good to have.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
