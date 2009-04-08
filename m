From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2009 07:50:04 -0700
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <878wmc2y8c.fsf@macbook.be.48ers.dk>
References: <20090407083540.15437e75@surf> <878wmc2y8c.fsf@macbook.be.48ers.dk>
Message-ID: <20090408075004.18784e45@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 07 Apr 2009 19:02:43 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Or even better, compile lzo for the host and link against that.

I know that's what we do for automake, autoconf, pkg-config, m4 and a
bunch of other stuff. But I must admit, that personnaly, I'm not
really a fan of this. I would rather prefer to leverage what's
installed on the host, and consider that Buildroot having dependencies
on installed packages (liblzo-dev and others) is normal.

Currently, one of the strong advantage of Buildroot compared to more
heavyweight solutions like OpenEmbedded is that the time for Buildroot
checkout to the first basic root filesystem being produced is very
small (15 minutes or so). If we start compiling more and more host
tools to the point that we basically recompile everything that's on the
host, we'll to some extent loose this advantage.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
