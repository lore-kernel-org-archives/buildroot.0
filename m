From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2011 14:47:19 +0200
Subject: [Buildroot] Some build failures to solve for volunteers
In-Reply-To: <BANLkTinD8BNxzLKe8bR940aeFNxANr85vg@mail.gmail.com>
References: <20110522171916.0ba1bba7@surf>
	<BANLkTinq4Nr71bL3+O+nfUXbYvJzu36GJw@mail.gmail.com>
	<20110523142820.14924d4c@surf>
	<BANLkTinD8BNxzLKe8bR940aeFNxANr85vg@mail.gmail.com>
Message-ID: <20110523144719.6b79d3b6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 May 2011 14:42:12 +0200
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> > I have no experience with BuildBot, but as far I as could see,
> > BuildBot is oriented towards building the same software in the same
> > configuration over and over again, for continuous integration. From
> > what I could see, it assumes that it has a finite set of build
> > configurations, and run them all.
> 
> There's no problem running Buildroot builds with Buildbot. I do
> actually have one running here locally for our local needs. :)

Sure running Buildroot builds with BuildBot is possible. What I'm
questionning is if running *random* builds with BuildBot does make
sense. I think BuildBot tracks whether a particular build configuration
was building at a time, then no longer building. This only makes sense
if the tested build configurations are identical over time.

> One could set "make randpackageconfig" as one step of the build
> process in the Factory, but that makes it hard to find patterns in the
> failing builds, hence my suggestion of one toolchain per slave and all
> options enabled. Maybe there's other advantages of random configs?

Well "make randpackageconfig" creates a completely random set of
package set and options. This allows to test an enormous number of
possible configurations.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
