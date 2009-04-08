From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Apr 2009 16:59:11 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <20090408075004.18784e45@surf> (Thomas Petazzoni's message of
	"Wed\, 8 Apr 2009 07\:50\:04 -0700")
References: <20090407083540.15437e75@surf>
	<878wmc2y8c.fsf@macbook.be.48ers.dk> <20090408075004.18784e45@surf>
Message-ID: <87ws9vyyww.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Or even better, compile lzo for the host and link against that.

 Thomas> I know that's what we do for automake, autoconf, pkg-config, m4 and a
 Thomas> bunch of other stuff. But I must admit, that personnaly, I'm not
 Thomas> really a fan of this. I would rather prefer to leverage what's
 Thomas> installed on the host, and consider that Buildroot having dependencies
 Thomas> on installed packages (liblzo-dev and others) is normal.

Yes, that works as long as the dependencies are stable and we can work
with the various versions available. That's unfortunately often not
the case, and then the easiest solution is to simply build it
ourselves.

I think lzo clearly fits in the:

 - Not available on most systems
 - Small and hence quick to compile
 - Users (mkfs.jffs2) needs a fairly specific version

Category.

 Thomas> Currently, one of the strong advantage of Buildroot compared
 Thomas> to more heavyweight solutions like OpenEmbedded is that the
 Thomas> time for Buildroot checkout to the first basic root
 Thomas> filesystem being produced is very small (15 minutes or
 Thomas> so). If we start compiling more and more host tools to the
 Thomas> point that we basically recompile everything that's on the
 Thomas> host, we'll to some extent loose this advantage.

True. It's a tradeoff ofcourse, but from looking at various bug
reports we're unfortunately not in a situation today where people can
just download BR on a random machine and run tar jxvf && make
menuconfig && make and expect it to work all the time.

Adding more dependencies on the host is not going to make this any
better.

-- 
Bye, Peter Korsgaard
