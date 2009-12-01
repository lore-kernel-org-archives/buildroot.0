From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Dec 2009 09:33:12 +0100
Subject: [Buildroot] Where did "project name" go?
In-Reply-To: <op.u383h9jpyqa4qb@jap> (Joachim Pihl's message of "Tue\,
	1 Dec 2009 09\:36\:06 +0100")
References: <op.u383h9jpyqa4qb@jap>
Message-ID: <87zl63gkl3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 Joachim> There is no longer an option "Project name" under target
 Joachim> options. Why was this removed for 2009.11? It seems to me that
 Joachim> some essential functionality is lost due to this when you
 Joachim> target multiple platforms. It seems to me that I have to run
 Joachim> make distclean, then make xconfig, when switching target
 Joachim> configurations for the next target to build cleanly.

Are you refererring to the project_build_<arch>/<project> stuff, that
could be used to build variants of a given arch/platform? That was
removed as part of the cleanup work, as it's a fairly specialized setup
and it added a lot of confusion / complexity to the system.

You can use an external toolchain to atleast not need to rebuild the
toolchain (typically the slowest thing to build).

Notice that you can use the O=<path> make argument to put the output
files somewhere else than ouput, which can be handy when you build for
several boards from the same tree.

See
http://git.buildroot.net/buildroot/commit/?id=3b2a803d2842e45a28b58afde6835dc40edb4c52
for more details.

-- 
Bye, Peter Korsgaard
